
mol new traj.96.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.520011 0.000000 -0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-0.049400 2.506774 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 3.695709} width 3 style solid
graphics top color 0
graphics top line {2.520011 0.000000 -0.000000} {2.470611 2.506774 -0.000000} width 3 style dashed
graphics top line {-0.049400 2.506774 0.000000} {2.470611 2.506774 -0.000000} width 3 style dashed
graphics top line {-0.049400 2.506774 0.000000} {-0.049400 2.506774 3.695709} width 3 style dashed
graphics top line {-0.000000 0.000000 3.695709} {-0.049400 2.506774 3.695709} width 3 style dashed
graphics top line {2.520011 0.000000 -0.000000} {2.520011 0.000000 3.695709} width 3 style dashed
graphics top line {-0.000000 0.000000 3.695709} {2.520011 0.000000 3.695709} width 3 style dashed
graphics top line {2.470611 2.506774 -0.000000} {2.470611 2.506774 3.695709} width 3 style dashed
graphics top line {-0.049400 2.506774 3.695709} {2.470611 2.506774 3.695709} width 3 style dashed
graphics top line {2.520011 0.000000 3.695709} {2.470611 2.506774 3.695709} width 3 style dashed

