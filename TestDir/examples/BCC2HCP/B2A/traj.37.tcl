
mol new traj.37.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.759613 -0.591400 4.606624} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-0.543439 2.715468 -4.606624} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.606624} width 3 style solid
graphics top color 0
graphics top line {2.759613 -0.591400 4.606624} {2.216174 2.124068 0.000000} width 3 style dashed
graphics top line {-0.543439 2.715468 -4.606624} {2.216174 2.124068 0.000000} width 3 style dashed
graphics top line {-0.543439 2.715468 -4.606624} {-0.543439 2.715468 0.000000} width 3 style dashed
graphics top line {0.000000 0.000000 4.606624} {-0.543439 2.715468 0.000000} width 3 style dashed
graphics top line {2.759613 -0.591400 4.606624} {2.759613 -0.591400 9.213248} width 3 style dashed
graphics top line {0.000000 0.000000 4.606624} {2.759613 -0.591400 9.213248} width 3 style dashed
graphics top line {2.216174 2.124068 0.000000} {2.216174 2.124068 4.606624} width 3 style dashed
graphics top line {-0.543439 2.715468 0.000000} {2.216174 2.124068 4.606624} width 3 style dashed
graphics top line {2.759613 -0.591400 9.213248} {2.216174 2.124068 4.606624} width 3 style dashed

