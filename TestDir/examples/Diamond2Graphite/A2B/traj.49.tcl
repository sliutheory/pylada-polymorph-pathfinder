
mol new traj.49.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.495526 0.000000 -0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-0.629850 2.326758 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 5.210622} width 3 style solid
graphics top color 0
graphics top line {2.495526 0.000000 -0.000000} {1.865676 2.326758 -0.000000} width 3 style dashed
graphics top line {-0.629850 2.326758 0.000000} {1.865676 2.326758 -0.000000} width 3 style dashed
graphics top line {-0.629850 2.326758 0.000000} {-0.629850 2.326758 5.210622} width 3 style dashed
graphics top line {-0.000000 0.000000 5.210622} {-0.629850 2.326758 5.210622} width 3 style dashed
graphics top line {2.495526 0.000000 -0.000000} {2.495526 0.000000 5.210622} width 3 style dashed
graphics top line {-0.000000 0.000000 5.210622} {2.495526 0.000000 5.210622} width 3 style dashed
graphics top line {1.865676 2.326758 -0.000000} {1.865676 2.326758 5.210622} width 3 style dashed
graphics top line {-0.629850 2.326758 5.210622} {1.865676 2.326758 5.210622} width 3 style dashed
graphics top line {2.495526 0.000000 5.210622} {1.865676 2.326758 5.210622} width 3 style dashed

