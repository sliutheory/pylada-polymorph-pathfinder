
mol new traj.74.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.592850 -0.215315 3.809061} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.931567 2.731648 0.745872} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 3.036622} width 3 style solid
graphics top color 0
graphics top line {2.592850 -0.215315 3.809061} {0.661283 2.516333 4.554933} width 3 style dashed
graphics top line {-1.931567 2.731648 0.745872} {0.661283 2.516333 4.554933} width 3 style dashed
graphics top line {-1.931567 2.731648 0.745872} {-1.931567 2.731648 3.782494} width 3 style dashed
graphics top line {-0.000000 0.000000 3.036622} {-1.931567 2.731648 3.782494} width 3 style dashed
graphics top line {2.592850 -0.215315 3.809061} {2.592850 -0.215315 6.845683} width 3 style dashed
graphics top line {-0.000000 0.000000 3.036622} {2.592850 -0.215315 6.845683} width 3 style dashed
graphics top line {0.661283 2.516333 4.554933} {0.661283 2.516333 7.591555} width 3 style dashed
graphics top line {-1.931567 2.731648 3.782494} {0.661283 2.516333 7.591555} width 3 style dashed
graphics top line {2.592850 -0.215315 6.845683} {0.661283 2.516333 7.591555} width 3 style dashed


