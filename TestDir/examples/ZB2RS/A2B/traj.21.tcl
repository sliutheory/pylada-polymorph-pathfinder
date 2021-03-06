
mol new traj.21.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.413413 -0.654225 2.108268} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.225751 3.147688 2.266303} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 2.916381} width 3 style solid
graphics top color 0
graphics top line {2.413413 -0.654225 2.108268} {0.187661 2.493462 4.374572} width 3 style dashed
graphics top line {-2.225751 3.147688 2.266303} {0.187661 2.493462 4.374572} width 3 style dashed
graphics top line {-2.225751 3.147688 2.266303} {-2.225751 3.147688 5.182684} width 3 style dashed
graphics top line {0.000000 0.000000 2.916381} {-2.225751 3.147688 5.182684} width 3 style dashed
graphics top line {2.413413 -0.654225 2.108268} {2.413413 -0.654225 5.024649} width 3 style dashed
graphics top line {0.000000 0.000000 2.916381} {2.413413 -0.654225 5.024649} width 3 style dashed
graphics top line {0.187661 2.493462 4.374572} {0.187661 2.493462 7.290953} width 3 style dashed
graphics top line {-2.225751 3.147688 5.182684} {0.187661 2.493462 7.290953} width 3 style dashed
graphics top line {2.413413 -0.654225 5.024649} {0.187661 2.493462 7.290953} width 3 style dashed


