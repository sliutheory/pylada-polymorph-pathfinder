
mol new traj.51.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {3.116629 0.000000 0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.288006 2.894600 -2.063880} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.719399} width 3 style solid
graphics top color 0
graphics top line {3.116629 0.000000 0.000000} {0.828622 2.894600 -2.063880} width 3 style dashed
graphics top line {-2.288006 2.894600 -2.063880} {0.828622 2.894600 -2.063880} width 3 style dashed
graphics top line {-2.288006 2.894600 -2.063880} {-2.288006 2.894600 2.655519} width 3 style dashed
graphics top line {-0.000000 0.000000 4.719399} {-2.288006 2.894600 2.655519} width 3 style dashed
graphics top line {3.116629 0.000000 0.000000} {3.116629 0.000000 4.719399} width 3 style dashed
graphics top line {-0.000000 0.000000 4.719399} {3.116629 0.000000 4.719399} width 3 style dashed
graphics top line {0.828622 2.894600 -2.063880} {0.828622 2.894600 2.655519} width 3 style dashed
graphics top line {-2.288006 2.894600 2.655519} {0.828622 2.894600 2.655519} width 3 style dashed
graphics top line {3.116629 0.000000 4.719399} {0.828622 2.894600 2.655519} width 3 style dashed


