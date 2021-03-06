
mol new traj.33.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.187478 0.000000 0.827792} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.709552 4.105479 -4.409284} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.409284} width 3 style solid
graphics top color 0
graphics top line {4.187478 0.000000 0.827792} {0.477926 4.105479 -3.581492} width 3 style dashed
graphics top line {-3.709552 4.105479 -4.409284} {0.477926 4.105479 -3.581492} width 3 style dashed
graphics top line {-3.709552 4.105479 -4.409284} {-3.709552 4.105479 -0.000000} width 3 style dashed
graphics top line {-0.000000 0.000000 4.409284} {-3.709552 4.105479 -0.000000} width 3 style dashed
graphics top line {4.187478 0.000000 0.827792} {4.187478 0.000000 5.237077} width 3 style dashed
graphics top line {-0.000000 0.000000 4.409284} {4.187478 0.000000 5.237077} width 3 style dashed
graphics top line {0.477926 4.105479 -3.581492} {0.477926 4.105479 0.827792} width 3 style dashed
graphics top line {-3.709552 4.105479 -0.000000} {0.477926 4.105479 0.827792} width 3 style dashed
graphics top line {4.187478 0.000000 5.237077} {0.477926 4.105479 0.827792} width 3 style dashed


