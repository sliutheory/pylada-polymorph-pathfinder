
mol new traj.50.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.227391 0.000000 1.254231} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.503261 4.103150 -4.563461} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.563461} width 3 style solid
graphics top color 0
graphics top line {4.227391 0.000000 1.254231} {0.724130 4.103150 -3.309231} width 3 style dashed
graphics top line {-3.503261 4.103150 -4.563461} {0.724130 4.103150 -3.309231} width 3 style dashed
graphics top line {-3.503261 4.103150 -4.563461} {-3.503261 4.103150 -0.000000} width 3 style dashed
graphics top line {-0.000000 0.000000 4.563461} {-3.503261 4.103150 -0.000000} width 3 style dashed
graphics top line {4.227391 0.000000 1.254231} {4.227391 0.000000 5.817692} width 3 style dashed
graphics top line {-0.000000 0.000000 4.563461} {4.227391 0.000000 5.817692} width 3 style dashed
graphics top line {0.724130 4.103150 -3.309231} {0.724130 4.103150 1.254231} width 3 style dashed
graphics top line {-3.503261 4.103150 -0.000000} {0.724130 4.103150 1.254231} width 3 style dashed
graphics top line {4.227391 0.000000 5.817692} {0.724130 4.103150 1.254231} width 3 style dashed


