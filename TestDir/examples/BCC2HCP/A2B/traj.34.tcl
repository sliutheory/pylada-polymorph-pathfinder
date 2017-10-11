
mol new traj.34.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.896265 0.000000 0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-4.184812 2.581762 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.612739} width 3 style solid
graphics top color 0
graphics top line {2.896265 0.000000 0.000000} {-1.288547 2.581762 0.000000} width 3 style dashed
graphics top line {-4.184812 2.581762 0.000000} {-1.288547 2.581762 0.000000} width 3 style dashed
graphics top line {-4.184812 2.581762 0.000000} {-4.184812 2.581762 4.612739} width 3 style dashed
graphics top line {0.000000 0.000000 4.612739} {-4.184812 2.581762 4.612739} width 3 style dashed
graphics top line {2.896265 0.000000 0.000000} {2.896265 0.000000 4.612739} width 3 style dashed
graphics top line {0.000000 0.000000 4.612739} {2.896265 0.000000 4.612739} width 3 style dashed
graphics top line {-1.288547 2.581762 0.000000} {-1.288547 2.581762 4.612739} width 3 style dashed
graphics top line {-4.184812 2.581762 4.612739} {-1.288547 2.581762 4.612739} width 3 style dashed
graphics top line {2.896265 0.000000 4.612739} {-1.288547 2.581762 4.612739} width 3 style dashed


