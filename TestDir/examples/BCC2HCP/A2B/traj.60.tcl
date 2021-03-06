
mol new traj.60.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.864721 0.000000 4.607256} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {0.024266 2.610665 -0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.607256} width 3 style solid
graphics top color 0
graphics top line {2.864721 0.000000 4.607256} {2.888987 2.610665 4.607256} width 3 style dashed
graphics top line {0.024266 2.610665 -0.000000} {2.888987 2.610665 4.607256} width 3 style dashed
graphics top line {0.024266 2.610665 -0.000000} {0.024266 2.610665 4.607256} width 3 style dashed
graphics top line {0.000000 0.000000 4.607256} {0.024266 2.610665 4.607256} width 3 style dashed
graphics top line {2.864721 0.000000 4.607256} {2.864721 0.000000 9.214513} width 3 style dashed
graphics top line {0.000000 0.000000 4.607256} {2.864721 0.000000 9.214513} width 3 style dashed
graphics top line {2.888987 2.610665 4.607256} {2.888987 2.610665 9.214513} width 3 style dashed
graphics top line {0.024266 2.610665 4.607256} {2.888987 2.610665 9.214513} width 3 style dashed
graphics top line {2.864721 0.000000 9.214513} {2.888987 2.610665 9.214513} width 3 style dashed


