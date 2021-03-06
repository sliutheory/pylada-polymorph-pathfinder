
mol new traj.11.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.686193 -0.835470 4.601141} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {2.201503 1.950776 -0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.601141} width 3 style solid
graphics top color 0
graphics top line {2.686193 -0.835470 4.601141} {4.887696 1.115306 4.601141} width 3 style dashed
graphics top line {2.201503 1.950776 -0.000000} {4.887696 1.115306 4.601141} width 3 style dashed
graphics top line {2.201503 1.950776 -0.000000} {2.201503 1.950776 4.601141} width 3 style dashed
graphics top line {0.000000 0.000000 4.601141} {2.201503 1.950776 4.601141} width 3 style dashed
graphics top line {2.686193 -0.835470 4.601141} {2.686193 -0.835470 9.202282} width 3 style dashed
graphics top line {0.000000 0.000000 4.601141} {2.686193 -0.835470 9.202282} width 3 style dashed
graphics top line {4.887696 1.115306 4.601141} {4.887696 1.115306 9.202282} width 3 style dashed
graphics top line {2.201503 1.950776 4.601141} {4.887696 1.115306 9.202282} width 3 style dashed
graphics top line {2.686193 -0.835470 9.202282} {4.887696 1.115306 9.202282} width 3 style dashed


