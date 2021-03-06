
mol new traj.58.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.818914 -0.394267 4.611052} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {0.263277 2.264034 -0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.611052} width 3 style solid
graphics top color 0
graphics top line {2.818914 -0.394267 4.611052} {3.082191 1.869767 4.611052} width 3 style dashed
graphics top line {0.263277 2.264034 -0.000000} {3.082191 1.869767 4.611052} width 3 style dashed
graphics top line {0.263277 2.264034 -0.000000} {0.263277 2.264034 4.611052} width 3 style dashed
graphics top line {0.000000 0.000000 4.611052} {0.263277 2.264034 4.611052} width 3 style dashed
graphics top line {2.818914 -0.394267 4.611052} {2.818914 -0.394267 9.222105} width 3 style dashed
graphics top line {0.000000 0.000000 4.611052} {2.818914 -0.394267 9.222105} width 3 style dashed
graphics top line {3.082191 1.869767 4.611052} {3.082191 1.869767 9.222105} width 3 style dashed
graphics top line {0.263277 2.264034 4.611052} {3.082191 1.869767 9.222105} width 3 style dashed
graphics top line {2.818914 -0.394267 9.222105} {3.082191 1.869767 9.222105} width 3 style dashed


