
mol new traj.27.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.173391 0.000000 0.677285} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.782361 4.106301 -4.354869} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.354869} width 3 style solid
graphics top color 0
graphics top line {4.173391 0.000000 0.677285} {0.391030 4.106301 -3.677585} width 3 style dashed
graphics top line {-3.782361 4.106301 -4.354869} {0.391030 4.106301 -3.677585} width 3 style dashed
graphics top line {-3.782361 4.106301 -4.354869} {-3.782361 4.106301 -0.000000} width 3 style dashed
graphics top line {-0.000000 0.000000 4.354869} {-3.782361 4.106301 -0.000000} width 3 style dashed
graphics top line {4.173391 0.000000 0.677285} {4.173391 0.000000 5.032154} width 3 style dashed
graphics top line {-0.000000 0.000000 4.354869} {4.173391 0.000000 5.032154} width 3 style dashed
graphics top line {0.391030 4.106301 -3.677585} {0.391030 4.106301 0.677285} width 3 style dashed
graphics top line {-3.782361 4.106301 -0.000000} {0.391030 4.106301 0.677285} width 3 style dashed
graphics top line {4.173391 0.000000 5.032154} {0.391030 4.106301 0.677285} width 3 style dashed


