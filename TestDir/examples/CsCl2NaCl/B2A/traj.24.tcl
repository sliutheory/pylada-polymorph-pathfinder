
mol new traj.24.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.288435 0.000000 2.892831} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.187756 4.099588 4.799261} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.799261} width 3 style solid
graphics top color 0
graphics top line {4.288435 0.000000 2.892831} {1.100678 4.099588 7.692092} width 3 style dashed
graphics top line {-3.187756 4.099588 4.799261} {1.100678 4.099588 7.692092} width 3 style dashed
graphics top line {-3.187756 4.099588 4.799261} {-3.187756 4.099588 9.598522} width 3 style dashed
graphics top line {-0.000000 0.000000 4.799261} {-3.187756 4.099588 9.598522} width 3 style dashed
graphics top line {4.288435 0.000000 2.892831} {4.288435 0.000000 7.692092} width 3 style dashed
graphics top line {-0.000000 0.000000 4.799261} {4.288435 0.000000 7.692092} width 3 style dashed
graphics top line {1.100678 4.099588 7.692092} {1.100678 4.099588 12.491353} width 3 style dashed
graphics top line {-3.187756 4.099588 9.598522} {1.100678 4.099588 12.491353} width 3 style dashed
graphics top line {4.288435 0.000000 7.692092} {1.100678 4.099588 12.491353} width 3 style dashed


