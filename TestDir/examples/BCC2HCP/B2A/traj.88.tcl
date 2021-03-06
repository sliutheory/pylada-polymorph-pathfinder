
mol new traj.88.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.903629 -0.112648 4.617379} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-0.973889 2.463985 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.617379} width 3 style solid
graphics top color 0
graphics top line {2.903629 -0.112648 4.617379} {1.929740 2.351338 4.617379} width 3 style dashed
graphics top line {-0.973889 2.463985 0.000000} {1.929740 2.351338 4.617379} width 3 style dashed
graphics top line {-0.973889 2.463985 0.000000} {-0.973889 2.463985 4.617379} width 3 style dashed
graphics top line {0.000000 0.000000 4.617379} {-0.973889 2.463985 4.617379} width 3 style dashed
graphics top line {2.903629 -0.112648 4.617379} {2.903629 -0.112648 9.234758} width 3 style dashed
graphics top line {0.000000 0.000000 4.617379} {2.903629 -0.112648 9.234758} width 3 style dashed
graphics top line {1.929740 2.351338 4.617379} {1.929740 2.351338 9.234758} width 3 style dashed
graphics top line {-0.973889 2.463985 4.617379} {1.929740 2.351338 9.234758} width 3 style dashed
graphics top line {2.903629 -0.112648 9.234758} {1.929740 2.351338 9.234758} width 3 style dashed


