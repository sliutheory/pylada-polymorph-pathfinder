
mol new traj.73.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.861271 -0.253457 4.614216} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.072191 2.617467 -4.614216} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.614216} width 3 style solid
graphics top color 0
graphics top line {2.861271 -0.253457 4.614216} {1.789080 2.364010 0.000000} width 3 style dashed
graphics top line {-1.072191 2.617467 -4.614216} {1.789080 2.364010 0.000000} width 3 style dashed
graphics top line {-1.072191 2.617467 -4.614216} {-1.072191 2.617467 0.000000} width 3 style dashed
graphics top line {0.000000 0.000000 4.614216} {-1.072191 2.617467 0.000000} width 3 style dashed
graphics top line {2.861271 -0.253457 4.614216} {2.861271 -0.253457 9.228431} width 3 style dashed
graphics top line {0.000000 0.000000 4.614216} {2.861271 -0.253457 9.228431} width 3 style dashed
graphics top line {1.789080 2.364010 0.000000} {1.789080 2.364010 4.614216} width 3 style dashed
graphics top line {-1.072191 2.617467 0.000000} {1.789080 2.364010 4.614216} width 3 style dashed
graphics top line {2.861271 -0.253457 9.228431} {1.789080 2.364010 4.614216} width 3 style dashed

