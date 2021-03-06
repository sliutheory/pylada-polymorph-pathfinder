
mol new traj.62.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.255565 0.000000 1.555246} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.357643 4.101506 -4.672292} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.672292} width 3 style solid
graphics top color 0
graphics top line {4.255565 0.000000 1.555246} {0.897922 4.101506 -3.117046} width 3 style dashed
graphics top line {-3.357643 4.101506 -4.672292} {0.897922 4.101506 -3.117046} width 3 style dashed
graphics top line {-3.357643 4.101506 -4.672292} {-3.357643 4.101506 -0.000000} width 3 style dashed
graphics top line {-0.000000 0.000000 4.672292} {-3.357643 4.101506 -0.000000} width 3 style dashed
graphics top line {4.255565 0.000000 1.555246} {4.255565 0.000000 6.227538} width 3 style dashed
graphics top line {-0.000000 0.000000 4.672292} {4.255565 0.000000 6.227538} width 3 style dashed
graphics top line {0.897922 4.101506 -3.117046} {0.897922 4.101506 1.555246} width 3 style dashed
graphics top line {-3.357643 4.101506 -0.000000} {0.897922 4.101506 1.555246} width 3 style dashed
graphics top line {4.255565 0.000000 6.227538} {0.897922 4.101506 1.555246} width 3 style dashed


