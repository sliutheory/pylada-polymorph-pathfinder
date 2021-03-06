
mol new traj.12.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.922956 0.000000 4.617379} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {1.179861 2.557306 -0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.617379} width 3 style solid
graphics top color 0
graphics top line {2.922956 0.000000 4.617379} {4.102818 2.557306 4.617379} width 3 style dashed
graphics top line {1.179861 2.557306 -0.000000} {4.102818 2.557306 4.617379} width 3 style dashed
graphics top line {1.179861 2.557306 -0.000000} {1.179861 2.557306 4.617379} width 3 style dashed
graphics top line {0.000000 0.000000 4.617379} {1.179861 2.557306 4.617379} width 3 style dashed
graphics top line {2.922956 0.000000 4.617379} {2.922956 0.000000 9.234758} width 3 style dashed
graphics top line {0.000000 0.000000 4.617379} {2.922956 0.000000 9.234758} width 3 style dashed
graphics top line {4.102818 2.557306 4.617379} {4.102818 2.557306 9.234758} width 3 style dashed
graphics top line {1.179861 2.557306 4.617379} {4.102818 2.557306 9.234758} width 3 style dashed
graphics top line {2.922956 0.000000 9.234758} {4.102818 2.557306 9.234758} width 3 style dashed


