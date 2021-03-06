
mol new traj.25.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.725727 -0.704048 4.604093} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {1.624159 2.044087 -0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.604093} width 3 style solid
graphics top color 0
graphics top line {2.725727 -0.704048 4.604093} {4.349886 1.340039 4.604093} width 3 style dashed
graphics top line {1.624159 2.044087 -0.000000} {4.349886 1.340039 4.604093} width 3 style dashed
graphics top line {1.624159 2.044087 -0.000000} {1.624159 2.044087 4.604093} width 3 style dashed
graphics top line {0.000000 0.000000 4.604093} {1.624159 2.044087 4.604093} width 3 style dashed
graphics top line {2.725727 -0.704048 4.604093} {2.725727 -0.704048 9.208186} width 3 style dashed
graphics top line {0.000000 0.000000 4.604093} {2.725727 -0.704048 9.208186} width 3 style dashed
graphics top line {4.349886 1.340039 4.604093} {4.349886 1.340039 9.208186} width 3 style dashed
graphics top line {1.624159 2.044087 4.604093} {4.349886 1.340039 9.208186} width 3 style dashed
graphics top line {2.725727 -0.704048 9.208186} {4.349886 1.340039 9.208186} width 3 style dashed


