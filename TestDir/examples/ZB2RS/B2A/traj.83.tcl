
mol new traj.83.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.517801 0.000000 1.979907} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-0.991183 2.373806 -1.190526} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 2.907306} width 3 style solid
graphics top color 0
graphics top line {2.517801 0.000000 1.979907} {1.526618 2.373806 0.789381} width 3 style dashed
graphics top line {-0.991183 2.373806 -1.190526} {1.526618 2.373806 0.789381} width 3 style dashed
graphics top line {-0.991183 2.373806 -1.190526} {-0.991183 2.373806 1.716780} width 3 style dashed
graphics top line {0.000000 0.000000 2.907306} {-0.991183 2.373806 1.716780} width 3 style dashed
graphics top line {2.517801 0.000000 1.979907} {2.517801 0.000000 4.887213} width 3 style dashed
graphics top line {0.000000 0.000000 2.907306} {2.517801 0.000000 4.887213} width 3 style dashed
graphics top line {1.526618 2.373806 0.789381} {1.526618 2.373806 3.696687} width 3 style dashed
graphics top line {-0.991183 2.373806 1.716780} {1.526618 2.373806 3.696687} width 3 style dashed
graphics top line {2.517801 0.000000 4.887213} {1.526618 2.373806 3.696687} width 3 style dashed


