
mol new traj.16.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {3.021720 0.000000 0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.761760 2.952064 -3.538080} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.371184} width 3 style solid
graphics top color 0
graphics top line {3.021720 0.000000 0.000000} {0.259960 2.952064 -3.538080} width 3 style dashed
graphics top line {-2.761760 2.952064 -3.538080} {0.259960 2.952064 -3.538080} width 3 style dashed
graphics top line {-2.761760 2.952064 -3.538080} {-2.761760 2.952064 0.833104} width 3 style dashed
graphics top line {-0.000000 0.000000 4.371184} {-2.761760 2.952064 0.833104} width 3 style dashed
graphics top line {3.021720 0.000000 0.000000} {3.021720 0.000000 4.371184} width 3 style dashed
graphics top line {-0.000000 0.000000 4.371184} {3.021720 0.000000 4.371184} width 3 style dashed
graphics top line {0.259960 2.952064 -3.538080} {0.259960 2.952064 0.833104} width 3 style dashed
graphics top line {-2.761760 2.952064 0.833104} {0.259960 2.952064 0.833104} width 3 style dashed
graphics top line {3.021720 0.000000 4.371184} {0.259960 2.952064 0.833104} width 3 style dashed


