import os,sys
from copy import deepcopy

#import pylada.crystal as pyc
#import pylada.crystal.read
import pylada.crystal.read as pcread
import pylada.crystal.write as pcwrite
from pylada.crystal import supercell, space_group, into_cell
import numpy as np
import numpy.linalg as npl
from math import cos, sin, acos, pi

from util import write_tcl, transform_cell, lcm, gcd, write_struct, write_xyz
from anim import closest_to, make_anim
from util import rot_euler

def get_options():
    import os, os.path
    from optparse import OptionParser
    parser = OptionParser()    
    parser.add_option("-A", "--A", dest="A",  type="string", default="A", help="poscar 1")
    parser.add_option("-B", "--B", dest="B",  type="string", default="B", help="poscar 2")
#    parser.add_option("-e", "--equal_blocks_ok", dest="equal_blocks_ok", help="generate DiADi cases, etc", action="store_true", default=False)
#    parser.add_option("-m", "--mode", dest="mode",  type="string", default="path", help="mode:one of 'path','sym','opt'")
    parser.add_option("-t", "--tiles", dest="output_tiles",  type="int", default=4, help="how many cells to tile in output")
    parser.add_option("-H", "--hlst", dest="do_hlst",  action="store_true", default=False, help="perform HLST fitting")
#    parser.add_option("-e", "--atom_dist_eps", dest="atom_dist_eps",  type="float", default=0.9, help="threshold for atom closeness")
    parser.add_option("-v", "--verbose", dest="verbose",  type="int", default=0, help="verbosity")
    parser.add_option("-z", "--trajdir", dest="trajdir",  type="string", default="trajdir", help="where to dump trajectory files")
    parser.add_option("-c", "--min_cluster_size", dest="min_cluster_size",  type="int", default=2, help="minimum size of atom clusters")
    parser.add_option("-s", "--no_shift", dest="no_shift", help="prevent shift of inequiv atoms to origin", action="store_true", default=False)
    parser.add_option("-b", "--bond_len", dest="bond_len",  type="float", default=2, help="bond length")
    parser.add_option("-n", "--frames", dest="frames",  type="int", default=1, help="how many frames in trajectory")
    parser.add_option("-y", "--check_syms", dest="check_syms", help="prevent checking of all syms", action="store_false", default=True)
    parser.add_option("-e", "--tol", dest="tol",  type="float", default=1e-1, help="tolerance for coordination calcs")
    
    (options, args) = parser.parse_args()
    return options, args


def distance(p, pcell, ipcell, q, qcell, iqcell):
    """
    figure out closest periodic distance between p \in pcell and q \in qcell.
    Note that there is an asymmetry.  By shifting the point along the "small" lattice, we may
    get closer than shifting along the "big" lattice.  Since we don't know which is which, take
    the minimum.  This can be done on a point-by-point basis because in reality there are equivalent
    atoms at any lattice points we can arrive at.
    """
#    plot_lattice(p,pcell, 2, [-3,1,0])
#    plot_lattice(p,pcell, 2, [2,-2,0])
#    x = np.array([5,6,7])
# print "round trip test: ",  x, np.dot(ipcell, x), np.dot(pcell, np.dot(ipcell, x))
    
    p0 = np.dot(ipcell, p) # coords of p
    p1 = p0 - np.round(p0) # fractional coords of p
    q2 = np.dot(ipcell, q)  # get q in p coords
    p2 = p1 + np.round(q2) # offset p1 by this number of cells to get "near" q2
    #unfortunately we're still only "close" so we have to try local shifts
    dmin = 1e100
    for i in range(-1,2):
        for j in range(-1,2):
            for k in range(-1,2):
                poff = np.array([i,j,k])
                p3 = p2 + poff
                p4 = np.dot(pcell,p3) # back to real space coords        
                d = npl.norm(p4 - q)    # now p3 and q should be close    
                if (d < dmin):
                    dmin = d    
                    p4min = p4                    
                    qmin = q

#    print p, p0, p1, p2,p3, "      ", q, q2, "   ", d
    
    return dmin, p4min, qmin

def dist_bothways(p, pcell, ipcell, q, qcell, iqcell):
    """ see distance(), r.e. asymmetry """
    d1, p1, q1 = distance(p, pcell, ipcell, q, qcell, iqcell)
    d2, q2, p2 = distance(q, qcell, iqcell, p, pcell, ipcell)
    if (d1 <= d2):
        return d1, p1, q1
    else:
        return d2, p2, q2
    
class Pairing(object):
    def __init__(self, ia, ib, apos, bpos, d, atype, btype):
        self.ia = ia
        self.ib = ib
        self.apos = apos
        self.bpos = bpos
        self.atype = atype
        self.btype = btype
        self.d = d

def make_dist_map(A,B):
    from copy import deepcopy
    details = False
    alg = 1

    if (details):
        print A
        print B
    if (alg == 1):
        dist_map = []
        iacell = npl.inv(A.cell)
        ibcell = npl.inv(B.cell)
        for ia in range(len(A)):
            apos = A[ia].pos
            amap = []        
            for ib in range(len(B)):
                bpos = B[ib].pos
                if A[ia].type != B[ib].type:
                    d = 1e3
                    p = deepcopy(apos)
                    q = deepcopy(bpos)
                else:
                    d, p, q = dist_bothways(apos,A.cell, iacell, bpos,B.cell,ibcell)
                amap.append(Pairing(ia,ib,p,q,d, A[ia].type,  B[ib].type))
            dist_map.append(amap)
       # dist_map = np.array(dist_map)
        if (details):
            s = "   | "
            for j in range(len(B)):
                s += "%d " % j
            print s
            s = "----"
            for j in range(len(B)):
                s += "---"
            print s
            for i in range(len(A)):
                s = "%d  |" % i
                for j in range(len(B)):
                    s += "%.2e " % (dist_map[i][j].d)
                print s

    
    else:
        dist_map2 = []
        newA = tofrac_coords(A)
        newB = tofrac_coords(B)
        for a in newA:
            amap = []        
            for b in newB:
                d = min_periodic_distance(a.pos, b.pos)
                amap.append(d)
            dist_map2.append(amap)
        dist_map2 = np.array(dist_map2)

        if (details):
            s = "   | "
            for j in range(len(B)):
                s += "%d " % j
            print s
            s = "----"
            for j in range(len(B)):
                s += "---"
            print s
            for i in range(len(A)):
                s = "%d  |" % i
                for j in range(len(B)):
                    s += "%e " % dist_map2[i,j]
                print s

    return deepcopy(dist_map)

def one_pairing_dist(p, dmap):
    dvec = [dmap[p[i][0]][p[i][1]].d for i in range(len(dmap))]
    d = npl.norm(dvec)
    return d


def plausible_pairs(src,dst, distmap, atom_dist_eps=1e-1):
    min0 = 0.5
    done = False
#    for amap in distmap:
#        for p in amap:
#            print p.ia, p.ib, p.apos, p.bpos, p.d 

    algo = 2
    if (algo==1):
        ppairs = ppairs_core(distmap, atom_dist_eps)
    else:
        from munkres import Munkres, print_matrix
        m = Munkres()
        natoms = len(distmap[0])
        matrix = list([[100*distmap[i][j].d   for i in range(natoms)] for j in range(natoms)])  # Munkres works only on integer-values!
        ppairs = []
        
        pairs = []
        indexes = m.compute(matrix)
#        print_matrix(matrix, msg='Lowest cost through this matrix:')
        total = 0
        for row, column in indexes:
            value = matrix[row][column]
            total += value
#            print '(%d, %d) -> %.2f' % (row, column, value/100.)
            pairs.append([column, row])
#        print 'total cost: %e' % (total/100.)
        ppairs.append(pairs)

    alldist = []
    for pair in ppairs:
        d = one_pairing_dist(pair, distmap)
        alldist.append(d)
        print "euclidean dist:", d

    return ppairs, alldist

def test_one_shifted_pair(A,B, options):
    from copy import deepcopy

### will be the same cell as currently used
#    print "test one, cells are"
#    print A.cell
#    print B.cell

    src = deepcopy(A)
    dst = deepcopy(B)
    if (options.do_hlst):
        from HLST import HLSTCtx, test_hlst_fit
        ctx = HLSTCtx()
    distmap = make_dist_map(src,dst)  ## important: takes into account periodicity
#    print "distmap done"
    pairings, alldist = plausible_pairs(src,dst,distmap)
#    print "plausible pairs done, found %d pairs" % len(pairings)
    allhlst = []
    dmin = 1e10
    partitionmin = None
    bigAmin = None
    dofmin = 1000
    pairmin = None
    ppmin = None
    for i in range(len(pairings)):  ## currently there will only be one pair returned from plausible_pairs, so we just go once through the loop.
        dist = alldist[i]
        amap = pairings[i]
        pp=[]
        i = 0
        for pair in amap:
            p = distmap[pair[0]][pair[1]]
#            print p.ia, p.ib, p.d, p.apos, p.bpos
            pp.append([p.ia, p.ia, p.d, p.apos, p.bpos])   # not a bug, we _want_ src and dst indices to match now--this is applying the permutation
            src[p.ia].pos = p.apos
            dst[p.ia].pos = p.bpos  # not a bug, we _want_ src and dst indices to match now
            src[p.ia].type = p.atype
            dst[p.ia].type = p.btype
            i+=1
        srcpos = np.transpose(np.array([a.pos for a in src]))
        dstpos = np.transpose(np.array([a.pos for a in dst]))

        ## TODO: insert local ICP solution here, ie. best rotation and shift _for this pairing_.
        ### this should be first ICP step of HLST fitting? yes, it is. but sometimes it's nice to turn it off for "clean" input. 

        if (options.do_hlst):
            hlst = test_hlst_fit(ctx, srcpos, dstpos, options)
            # returns list: [dof, partitioning, bigA(3N-dim transform)]
            dof = hlst[0]
        else:
            hlst = [[0],[0],[0]]
            dof = dofmin ## ignored

        # don't torture caller, just return best as judged first by lowest dof, then by lowest distance
        if (dof < dofmin or (dof == dofmin and dist < dmin)):
#            write_tcl(options, src, dst, pp, "dist")
            dmin = dist
            dofmin = dof
            ppmin = pp  # these include the possibly-periodically-shifted src and dst atom positions
            partitionmin = hlst[1]
            bigAmin = hlst[2]
            pairmin = amap  # these are pairs of indices in original order

    return dmin, [pairmin, ppmin], [dofmin, partitionmin,  bigAmin]

def my_space_group(s):
    from pylada.crystal import space_group, primitive

#    print "in my_space_group with s = ", s
    try:
        sprim = primitive(s)
        spacegroup = space_group(sprim)
    except:
        print "space_group failed"
        return []

    if len(spacegroup) == 0:
        spacegroup = np.zeros((1, 4, 3))
        spacegroup[0,0,0] = 1
        spacegroup[0,1,1] = 1
        spacegroup[0,2,2] = 1
    return spacegroup

def my_equivalence_iterator(structure, operations=None, tolerance=1e-6, splitocc=None):
  """ my version of this pylada function takes into account that structure might not be primitive"""

  from numpy import dot
  from numpy.linalg import inv, norm
  from pylada.crystal import space_group, which_site, primitive, into_cell

  # atoms: list of atoms + index. Pop returns the last item. Since we want
  # equivalence iterator to be stable, as much as possible, the list order is
  # inverted.
  atoms = [u for u in enumerate(structure)][::-1]
  if operations == None: operations = space_group(structure)
  invcell = inv(structure.cell)
  sprim = primitive(structure)

  icur = 0
  tags = [False for i in range(len(atoms))]
  while icur < len(atoms):
      atom = structure[icur]
      tags[icur] = True
      equivs = [icur]
      for itest in range(icur+1, len(atoms)):
          if (tags[itest]): # already used
              continue # go to next
          # check symmetrically equivalent
          atest = structure[itest]
          pos = into_cell(atest.pos, sprim.cell)      
          for op in operations:
              newpos = dot(op[:3], pos) + op[3]
              if npl.norm(newpos-atom.pos) < tolerance:
                  equivs.append(itest)
                  tags[itest] = True
                  break;  # need not test rest of syms.

      # if no further splitting, returns. 
      yield equivs

      icur += 1
      while (icur<len(atoms) and tags[icur]):
          icur += 1


def analyze_commensurized(src, dst, options):
    """ loop over symmetry of lattic and call analyzed_commensurized for each config"""
    from pylada.crystal import space_group, primitive
    from copy import deepcopy
    dmm = 1e10

#################
 # some debate in my mind; do we need consider symmetry within cell, or does a search over rotations cover it?
### Answer:We absolutely need this: the given structures may be given to us in any of the symmetry-equivalent
# forms allowed by the lattice; e.g. in a cubic lattice, we may get the exact same structure, just mirrored across x axis.
# The atom positions might be quite different, but it's clearly the same structure
# The cell is determined by gruber, niggli et al.
# Once we've chosen it, we have to mess with the decoration at a lower level in the hierarchy. (i.e. here)
#################
    if (options.check_syms):
        # find syms of the lattice (not nec. the struct).
        AA = primitive(src)
        AA.clear()
        AA.add_atom(0,0,0,"Au")
        asym = space_group(AA)
#        asym.append(rot_euler(0,0,90))  # special case.  testing here.  cures Vladan's SnS problem case
        nsym = len(asym)
        print "A lattice has %d symmetries" % len(asym)
    else:
        nsym = 1
        asym = [np.array([[1,0,0],[0,1,0],[0,0,1],[0,0,0]])]
        print "Ignoring A lattice symmetry"        
    for isym in range(nsym): 
        sym = asym[isym]
        print "testing symmetry %d of %d" % (isym, nsym), sym
#        newsrc = transform_cell(sym[0:3,:], src)
        newsrc = deepcopy(src)   ## only transform points, not unit cell (doesn't matter except for pictures)
        for a in newsrc:
            a.pos = np.dot(sym[0:3,:], a.pos)
        dmin, pairsmin, Amin, Bmin, shiftmin  =   analyze_commensurized_sym(newsrc, dst, options)
        if (dmin < dmm):
            dmm = dmin
            pmm = deepcopy(pairsmin)
#            hmm = hlstmin
            smm = shiftmin
            Amm = deepcopy(Amin)
            Bmm = deepcopy(Bmin)
            print "new winner w.r.t sym", dmin
#    print "pairing", pmm[0], pmm[1]
#    write_tcl(options, Amm, Bmm, pmm[0], "distsym")
    return dmm, pmm, smm

def center_cell(A):
    from copy import deepcopy
    newA = deepcopy(A)
    for a in newA:
        a.pos = into_cell(a.pos, A.cell)
    pos = [a.pos for a in newA]
    amean = np.mean(pos, axis=0)
    for a in newA:
        p = deepcopy(a.pos)
        a.pos = p - amean
    return newA

def analyze_commensurized_sym(src, dst, options):
    """ read, do all possible shifts of sym-ineq cells, compute distmap, etc for each
    Assuming symmetry already applied"""
    from pylada.crystal.iterator import equivalence as equivalence_iterator
    from copy import deepcopy

    src0 = deepcopy(src)
    src_sg = my_space_group(src)
    if (len(src_sg) == 0):  ### bail here for bad and unusual case of pylada.crystal.primitive failing
        return 1e100, None, None, None, None

    dofmin = 1000
    dmin = 1e10

    if options.no_shift:
        nshift = 1
        nextra = 0
        groups = [[0]]
        test_shifts = [[0,0,0]]
    else:
        groups = [u for u in my_equivalence_iterator(src, src_sg)]
#        groups = [[k] for k in range(len(src))]  experiment!
        print "groups of equiv atom indices in src:" , groups
        nshift = len(groups)
        extra_shifts = []
        for i in range(2):
            for j in range(2):
                for k in range(2):
                    if i==0 and k==0 and j==0: continue
                    ijk = [0.0 + 0.5*i, 0.0 + 0.5*j, 0.0 + 0.5*k]
                    next = np.dot(src.cell, ijk)
                    extra_shifts.append(next)
        nextra = len(extra_shifts)
                
    for igroup in range(nshift+nextra): 
        src1 = deepcopy(src0)

        if (options.no_shift):
            shift = np.array(test_shifts[igroup])   ### for debugging, turn off shifting
        elif igroup < nshift:
            iorg = groups[igroup][0]
            shift = deepcopy(src[iorg].pos - src[0].pos)  # note, arbitrarily using atom 0 as reference
            print "shifting to position 0:", iorg, shift
        else:
            shift = extra_shifts[igroup-nshift]
            print "shifting to extra position %d:" % (igroup-nshift), shift
#            import pdb; pdb.set_trace()

        for ia in range(len(src)):
            src1[ia].pos = src0[ia].pos - shift

        write_tcl(options, src1, dst, [], "dist")
        
## call to center cell here after equivalence check b/c it messes up the computation of which atoms are equivalent
        src2 = center_cell(src1)
        dst2 = center_cell(dst)
#        src2 = deepcopy(src1)
#        dst2 = deepcopy(dst)

#        print "computing dist map and hlst for shift ", shift
        dist, pairs, hlst = test_one_shifted_pair(src2,dst2, options)

        # pairs = list of which atoms where paired for minimal distance
        # hlst = [dof, partitioning, bigA] for best pairing and partitoning
        dof = hlst[0]
#        print "came back, dof = ", dof
        if (dof < dofmin or (dof <= dofmin and dist < dmin)):
            dmin = dist
            hlstmin = hlst
            shiftmin = shift
            dofmin = dof
            pairsmin = deepcopy(pairs)
            Amin = deepcopy(src2)
            Bmin = deepcopy(dst2)
            print "new winner w.r.t shift", dmin   ###,   hlstmin[0], hlstmin[1]
#            write_tcl(options, src2, dst2, [], "center")  ## note at this point dst is in src's cell, so don't expect dst to look right            
#            write_tcl(options, src2, dst2, pairs[0], "dist")
#            print pairs[0]
            
#            if abs(dist - 2.82764) < 1e-2:
#                import pdb; pdb.set_trace()
#            print pairs[1]
#            import pdb; pdb.set_trace()

#    return dmin, pairsmin, hlstmin, shiftmin
    return dmin, pairsmin, Amin, Bmin,  shiftmin


class Symmetry(object):
    """ simple container for storing symmetry info"""
    def __init__(self,M, eps=1e-8):
        import scipy.linalg as spl
        self.full_matrix = M
        self.matrix = M[0:3,0:3] # we just are concerned with 3x3 part
        dat = spl.eig(self.matrix)
        self.evals = dat[0]
        self.evects = dat[1]
        if abs(np.prod(self.evals) - 1) < eps:
            self.axis = find_axis(self.evals, self.evects, eps)

def ucell_surface(A):
    ## must be a better way, but here I am
    # constructing a series of 3 cells whose VOLUMES are the SURFACE AREAS of
    # each of the 3 unique faces of the unit cell
    s = 0
    for i in range(3):
        i1 = i
        i2 = (i+1)%3
        a = A[:,i1]
        b = A[:,i2]
        n = np.cross(a,b)
        n = n/npl.norm(n)
        B = np.array([a,b,n])
#        print "a", a
#        print "B",B
        s0 = abs(npl.det(B))
        s += s0
    return 2*s


def stats_to_value(aa, aang, ba, bang, asa, bsa):
    # combine cell stats into one measure of similarity.
    # roughly...:
    m1 = 1.0  # 1 is a big distance
    m2 = 10.0  # 10 is a big angle
    m3 = 10.0 # 10 is a big surface area
    maxangle = 150
    minangle = 30
    d1 = sum([abs(ba[i]-aa[i]) for i in range(3)]) / m1
    d2 = sum([abs(bang[i]-aang[i]) for i in range(3)]) / m2
    d3 = abs(asa-bsa) / m3

    if (max(bang) > maxangle or min(bang)<minangle or max(aang) > maxangle or min(aang)<minangle):
        return 1e10
    else:
        return d1+d2+d3

def calc_cell_bignorms(A, Acells):
    # note uses "supercell", which results in atoms all _in_ supercell
    n1 = []
    for i in range(len(Acells)):
        print "Acell", Acells[i]
        x = supercell(A,np.dot(A.cell,Acells[i]))
        # make canonical versions:
        x = canonicalize(x)
        print x.cell
        pos  = [a.pos for a in x]
        # a check that the atoms are _in_ the supercell:
#        inv = npl.inv(x.cell)
#        coord = [np.dot(inv,y) for y in pos]
#        print np.max(coord), np.min(coord)
#        bigx = np.reshape(pos, (3*len(x)))
#        n1.append(mynorm(bigx))
        n1.append(ucell_surface(x.cell))
    return n1


def find_closest_cells(A, Acells, B, Bcells):
    # note uses "supercell", which results in atoms all _in_ supercell

    print "finding closest match among %d A cells and %d B cells" % (len(Acells), len(Bcells))
    Amincells = []  ## these lists all correspond.  the cells are integer matrices from which to build supercells (ala Gus Hart)
    Bmincells = []
    Bflags = []  ## the flags handle special cases, only one so far: include extra 90 deg rotated versions, because
    dmins = []  ## B is "near-symmetric", which seems to mean that a,b,and/or c are similar, and corresponding alpha, beta,
    dmin = 1e10 ## gamma is near 90.  I think inversion symmetry will handle 180 degrees (?).

    dthresh = 1000  ## don't really need this now, just prevents a litle copying
    max_cells = 10  ## max number of "similarly good" cell pairs to return
    max_diff = 0.001 ## defines "similarly good"
    small_angle = 10 ## angle for alpha that triggers an extra rotated version being added
## unused yet    small_distance = 2 ## distance for a that triggers .. 

    for i in range(len(Acells)):
        acell = np.dot(A.cell,Acells[i])
        Ap = supercell(A,acell)
        # make canonical versions:
        Ap = canonicalize(Ap)
        asa = ucell_surface(Ap.cell)
        aa,aang = vec2alpha(Ap.cell)

        for j in range(len(Bcells)):
            bcell = np.dot(B.cell,Bcells[j])   ## a candidate commensurate (# atoms) cell
            Bp = supercell(B,bcell)
            print "bcell0"
            print bcell
            # make canonical versions:
            Bp = canonicalize(Bp)   ## make it blocky with gruber()
            bsa = ucell_surface(Bp.cell)  ## get cell stats
            ba,bang = vec2alpha(Bp.cell)
            perms = [[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]]  ## permute a,b,c in case there are other orders also good
            for p in perms:
                pba = [ba[p[k]] for k in range(3)]
                pbang = [bang[p[k]] for k in range(3)]

                d = stats_to_value(aa, aang, pba, pbang, asa, bsa)
                print "new stats", d, aa, pba, aang, pbang, asa, bsa, p
                if (d < dmin):
                    dmin = d
                    imin = i
                    jmin = j
                    pmin = p
                    print "new best stats", d, aa, ba, aang, bang, asa, bsa, pmin
                if (d < dthresh):
                    print "new cell pairing with stats", d, aa, ba, aang, bang, asa, bsa, pmin
                    ## construct (with possible permuted a,b,c) unit cell we'll use 
                    ## note, it's not yet actually "on top of" acell, just _could_ be (judging by a,b,c,alpha,beta,gamma)
                    bcell = np.array([ [bcell[zz,p[xx]] for xx in range(3)] for zz in range(3)])
#                    print acell
#                    print bcell

                    # make supercell as a test
#                    print "making scell"
                    Bp = supercell(B,bcell)
#                    print "made scell"

                    Amincells.append(acell)
                    Bmincells.append(bcell)
                    Bflags.append(None)
                    dmins.append(d)
                    
                    if (abs(pbang[0] - 90) < small_angle):
                        Amincells.append(acell)
                        Bmincells.append(bcell)
                        Bflags.append(2)  ## triggers 90 deg. rotation around z axis
                        dmins.append(d)
                        
                    
            
    idx = [i[0] for i in sorted(enumerate(dmins), key=lambda x:x[1])]
    best_dmins = []
    best_Amincells = []
    best_Bmincells = []
    best_Bflags = []
    dmin = dmins[idx[0]]
    for i in range(min(max_cells,len(dmins))):
        if (dmins[idx[i]] - dmin < max_diff):
            best_dmins.append (dmins[idx[i]])
            best_Amincells.append(Amincells[idx[i]])
            best_Bmincells.append(Bmincells[idx[i]])
            best_Bflags.append(Bflags[idx[i]])

    print best_dmins
    return  best_dmins, best_Amincells, best_Bmincells, best_Bflags

def abs_cap(x):
    return max(-1,min(x,1))

def radians(theta):
    return theta * np.pi / 180.0

def ang2vec(a,b,c,alpha, beta, gamma):
    alpha_r = radians(alpha)
    beta_r = radians(beta)
    gamma_r = radians(gamma)
    val = (np.cos(alpha_r) * np.cos(beta_r) - np.cos(gamma_r))\
        / (np.sin(alpha_r) * np.sin(beta_r))
        #Sometimes rounding errors result in values slightly > 1.
    val = min(1,max(-1,val))
    gamma_star = np.arccos(val)
    vector_a = [a * np.sin(beta_r), 0.0, a * np.cos(beta_r)]
    vector_b = [-b * np.sin(alpha_r) * np.cos(gamma_star),
                 b * np.sin(alpha_r) * np.sin(gamma_star),
                 b * np.cos(alpha_r)]
    vector_c = [0.0, 0.0, float(c)]
    return np.transpose(np.array([vector_a, vector_b, vector_c]))
#    return np.transpose(np.array([vector_c, vector_a, vector_b]))

def vec2alpha(A):
    m = np.transpose(A)
    lengths = np.sqrt(np.sum(m ** 2, axis=1))
    angles = np.zeros(3)
    for i in range(3):
        j = (i + 1) % 3
        k = (i + 2) % 3
        angles[i] = abs_cap(np.dot(m[j], m[k]) / (lengths[j] * lengths[k]))
        
    angles = np.arccos(angles) * 180. / pi
    return lengths, angles


def basic_tform_cell(M, A):
    # transform cell by a left multiplication
    from copy import deepcopy
    B = deepcopy(A)
    B.cell = np.dot(M, A.cell)
    for b in B:
        b.pos = into_cell(np.dot(M, b.pos), B.cell)
    return B

def wrong_quad(v):
    ## check if in or on border of first quadrant, i.e. x,y,z all >=0
    eps = 1e-8
    print "wq", v
    for i in range(3):
        if v[i]+eps < 0:
            return True
    return False

def super_canon(A, flags = None):
    from pylada.math import gruber
    g = gruber(A.cell)
    # gruber gets us almost there (makes the cell "boxy"). 
    # but the boxy rep returned by gruber is not unique.
    # going from cell to a,b,c..., then back again makes
    # equal cells actually equal.
    a,v = vec2alpha(g)
    A2 = ang2vec(a[0],a[1],a[2],v[0],v[1],v[2])
    # going back and forth likes this makes A2 have the following properties:
    # "a3" along z-axis,
    # "a1" in x-z plane within 45 degrees of z axis, 
    # "a2" is pointing up in a 45 degree "cone" around y axis.
    if (flags != None):
        if flags == 2:
            print "adding 90 z-rotation"
            print "before"
            print A2
            A2 = np.dot(rot_euler(0,0,90), A2)
            print "after"
            print A2
            
    print "g"
    print g
    print "A2"
    print A2
#    print "calcs..."
#    print np.dot(npl.inv(A.cell), g)
#    print np.dot(npl.inv(A.cell), A2)
    ## g is actually a supercell of A, in the desired "blocky" shape.
    ## A2 is actually not a supercell of A (or g), it is a rotated version.
    ## so to make A, we go A->g->A2, first by supercell, then by transform.
    ## [ A <- A2 * g^-1 * g  = A2 ]
    A = supercell(A,g)
    Tfinal = np.dot(A2, npl.inv(g))
    A = basic_tform_cell(Tfinal, A)

    # rotations swap a<->b, etc, so we have to switch them around:
    if (flags != None):
        if flags == 2:
            tmp = deepcopy(A.cell[:,0])
            A.cell[:,0] = deepcopy(A.cell[:,1])
            A.cell[:,1] = -tmp
            
    for i in range(len(A)):
        A[i].pos = into_cell(A[i].pos, A.cell)

    print "A.cell"
    print A.cell

    return A

def canonicalize(A):
    # gruber gets us almost there (makes the cell "boxy"). 
    # but the boxy rep returned by gruber is not unique.
    if False:
        A = super_canon(A)
    else:
        from pylada.math import gruber
        g = gruber(A.cell)
        A = supercell(A,g)
    return A

def final_fix_gruber(A,B):
    # B and A are both canonincal, which means that "a3" are along z-axis,
    # "a1" are in x-z plane within 45 degrees of z axis, 
    # and "a2" is pointing up in a 45 degree "cone" around y axis.
    # But this doesn't mean they are as close to EACH OTHER as they could be.
    # so here we do one last step:

    asa = ucell_surface(A.cell)
    bsa = ucell_surface(B.cell)
    aa,aang = vec2alpha(A.cell)
    ba,bang = vec2alpha(B.cell)
    dmin = stats_to_value(aa, aang, ba, bang, asa, bsa)
    Pmin = np.identity(3)
    Qmin = np.identity(3)
    eps = 1e-2
    print "starting dmin", dmin  ### this is just to slightly favor the good match we already found
    for i1 in range(-1,2):
        for i2 in range(-1,2):
            for i3 in range(-1,2):
                for j1 in range(-1,2):
                    for j2 in range(-1,2):
                        for j3 in range(-1,2):
                            P = np.array([[1,i3,0],[0,1,0],[i1,i2,1]])
                            Q = np.array([[1,j3,0],[0,1,0],[j1,j2,1]])
                            Bp = np.dot(B.cell, P)
                            Ap = np.dot(A.cell, Q)
                            asa = ucell_surface(Ap)
                            bsa = ucell_surface(Bp)
                            aa,aang = vec2alpha(Ap)
                            ba,bang = vec2alpha(Bp)
                            d = stats_to_value(aa, aang, ba, bang, asa, bsa)
                            if d < 100:
                                print "new stats", d, aa, ba, aang, bang, asa, bsa
                            if (d < dmin-eps):
                                Pmin = P
                                Qmin = Q
                                dmin = d
                                print "new best stats", d, aa, ba, aang, bang, asa, bsa
    print "final_fix_gruber: P,Q = "
    print Pmin
    print Qmin
    newA = np.dot(A.cell, Qmin)
    newB = np.dot(B.cell, Pmin)
#    print newB
    A = supercell(A, newA)
    B = supercell(B, newB)
    return A, B

def prepare_final_cells(A, B, Acell, Bcell, Bflags, options, idx):
    print "About to start on A:"
    print A.cell, Acell
    Atest = supercell(A,Acell)
    #        Atest = basic_tform_cell(np.dot(A2, npl.inv(g)), Atest)
    #        Atest = basic_tform_cell(...
    print "... and B:"
    print B.cell, Bcell
    Btest = supercell(B,Bcell)
    
    write_tcl(options, Atest, Btest, [], "enum%d" %idx)

    # make canonical versions, including final rotation to known quadrant (see super_canon())
    Acan = super_canon(Atest, None)
    print "A after cannon"
    print Acan
    Bcan = super_canon(Btest, Bflags)
    print "B after cannon"
    print Bcan

    write_tcl(options, Acan, Bcan, [], "canon%d" % idx)

    # Using gruber, still one last fix ("flip"), (see comment in final_fix_gruber)
    A,Bflip = final_fix_gruber(Acan,Bcan)

    # A and Bflip are now commensurate structures with "most" overlapping unit cells
    return A, Bflip


class OneCellPairingResult(object):
    def __init__(self,dmin, A, Bflip, Tmatch, shiftmin, pairsmin):
        self.dmin = dmin
        self.A = A
        self.Bflip = Bflip
        self.Tmatch = Tmatch
        self.shiftmin = shiftmin
        self.pairsmin = pairsmin

def analyze_one_cell_mapping(A,B, options, idx):
    print "STARTING ANALYSIS OF ONE CELL PAIRING"
    # now _final_ warp of B to A cell
    Tmatch = np.dot(A.cell, npl.inv(B.cell))  # get exact map from B to A
    Bmatch = transform_cell(Tmatch, B)
    dmin_match = npl.norm(Tmatch-np.identity(3))  # we want this to be close to identity, i.e. minimize d
    write_tcl(options, A, Bmatch, [], "match%d"%idx, center=False)
    write_tcl(options, A, B, [], "flip%d"%idx, center=False)

#---------------    
    # do atom level pairing:
    dmin, pairsmin,  shiftmin = analyze_commensurized(A, Bmatch, options)
    print "DONE: found dmin, shiftmin=", dmin,  shiftmin
    print "      |Tmatch-I| = ", dmin_match 
    #print "Tperm", Tperm
    print "Tmatch", 
    print Tmatch

    # some interesting mid way files. rot and flip have original unit cell, just rotated, permuted, flipped.
    # but match has been transformed to target cell, so don't expect to see original structure
#    write_xyz(options, Brot, "rot", 4)
    write_xyz(options, B, "flip%d"%idx, 4)
    write_xyz(options, Bmatch, "match%d"%idx, 4)

    one_res = OneCellPairingResult(dmin, A, B, Tmatch, shiftmin, pairsmin)
    return one_res

    print "FINISHED ANALYSIS OF ONE CELL PAIRING"



def test_enum(A,B, options):
    from pylada import enum
    from pylada.crystal import supercell, primitive
    from util import write_xyz
    from copy import deepcopy

    # record starting state
    write_tcl(options, A, B, [], "start")
    print "incoming structures are %s and %s" % (options.A, options.B)
    print "incoming cells have %d and %d atoms, resp." % ( len(A), len(B) )
    print "incoming ucell surface areas:", ucell_surface(A.cell), ucell_surface(B.cell)

   # get primitive cells
    A = primitive(A)
    B = primitive(B)
    
    #### special tests
#    import sys
#    Tskew = np.dot(A.cell, npl.inv(B.cell))
#    print Tskew
### The point: idea was to simply truncate to integer the natural cell to cell transform.
### result of test is that the tform is very non-integer (in general) and this won't be a good approach
#    sys.exit()
    ####
#    from pylada.crystal import space_group, primitive
#    bsym = space_group(B)
#    print "B lend %d has %d symmetries" % (len(B), len(bsym))
#    B.clear()
#    B.add_atom(0,0,0, 'Au') 
#    bsym = space_group(B)
#    print "B len %d has %d symmetries" % (len(B), len(bsym))
### The point: testing whether space_group() function cares about decoration. It appears not too.
#    sys.exit()

    # figure out multipliers needed to make supercells with the same number of atoms
    n1 = len(A)
    n2 = len(B)
    N = lcm(n1, n2)
    m1 = N/n1
    m2 = N/n2

    # make all inequivalent supercells that match number of atoms
    Acells = enum.supercells(A,[m1])
    Bcells = enum.supercells(B,[m2])
    Acells = Acells[m1]
    Bcells = Bcells[m2]

    # find which ones have the most potential overlap (using gruber())
    dmin, Amincells, Bmincells, Bflags = find_closest_cells(A, Acells, B, Bcells)
    print "The %d close enough cells are" % len(Amincells)
    for i in range(len(Amincells)):
        print Amincells[i]
        print Bmincells[i]
        print "dist = ", dmin[i]
        print "Bflags = ", Bflags[i]
        print "------------"

    dmin = 1e10
    for imin in range(len(Amincells)):
        # make desired "closest" supercells
        Atest, Btest = prepare_final_cells(A, B, Amincells[imin],Bmincells[imin], Bflags[imin], options, imin)
        # run analyzis on this cell mapping
        one_res = analyze_one_cell_mapping(Atest,Btest, options, imin)
        if (one_res.dmin < dmin):
            best_res = deepcopy(one_res)
            dmin = one_res.dmin

    print "-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    print "HIERARCHICAL SEARCH DONE, dmin = ", best_res.dmin
    # save trajectory of best found
    from anim import make_anim
    make_anim(best_res.A, best_res.Bflip, best_res.Tmatch, best_res.shiftmin, best_res.pairsmin, options) 


if __name__=="__main__":
    options, arg = get_options()
    A = pcread.poscar(options.A)
    B = pcread.poscar(options.B)

    test_enum(A,B,options)




######## redo these: 
#     traj_Si-Qa2Qb/ traj_Si-Qb2Tb/ traj_Si-Tb2Cb/ traj_Si-Tb2Ta/
