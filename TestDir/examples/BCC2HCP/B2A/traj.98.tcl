
mol new traj.98.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.931868 -0.018775 4.619488} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.386277 2.530636 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.619488} width 3 style solid
graphics top color 0
graphics top line {2.931868 -0.018775 4.619488} {1.545590 2.511861 4.619488} width 3 style dashed
graphics top line {-1.386277 2.530636 0.000000} {1.545590 2.511861 4.619488} width 3 style dashed
graphics top line {-1.386277 2.530636 0.000000} {-1.386277 2.530636 4.619488} width 3 style dashed
graphics top line {0.000000 0.000000 4.619488} {-1.386277 2.530636 4.619488} width 3 style dashed
graphics top line {2.931868 -0.018775 4.619488} {2.931868 -0.018775 9.238976} width 3 style dashed
graphics top line {0.000000 0.000000 4.619488} {2.931868 -0.018775 9.238976} width 3 style dashed
graphics top line {1.545590 2.511861 4.619488} {1.545590 2.511861 9.238976} width 3 style dashed
graphics top line {-1.386277 2.530636 4.619488} {1.545590 2.511861 9.238976} width 3 style dashed
graphics top line {2.931868 -0.018775 9.238976} {1.545590 2.511861 9.238976} width 3 style dashed


