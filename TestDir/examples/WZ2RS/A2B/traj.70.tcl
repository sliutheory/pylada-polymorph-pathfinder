
mol new traj.70.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {3.168150 0.000000 0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.030825 2.863405 -1.263600} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.908430} width 3 style solid
graphics top color 0
graphics top line {3.168150 0.000000 0.000000} {1.137325 2.863405 -1.263600} width 3 style dashed
graphics top line {-2.030825 2.863405 -1.263600} {1.137325 2.863405 -1.263600} width 3 style dashed
graphics top line {-2.030825 2.863405 -1.263600} {-2.030825 2.863405 3.644830} width 3 style dashed
graphics top line {-0.000000 0.000000 4.908430} {-2.030825 2.863405 3.644830} width 3 style dashed
graphics top line {3.168150 0.000000 0.000000} {3.168150 0.000000 4.908430} width 3 style dashed
graphics top line {-0.000000 0.000000 4.908430} {3.168150 0.000000 4.908430} width 3 style dashed
graphics top line {1.137325 2.863405 -1.263600} {1.137325 2.863405 3.644830} width 3 style dashed
graphics top line {-2.030825 2.863405 3.644830} {1.137325 2.863405 3.644830} width 3 style dashed
graphics top line {3.168150 0.000000 4.908430} {1.137325 2.863405 3.644830} width 3 style dashed


