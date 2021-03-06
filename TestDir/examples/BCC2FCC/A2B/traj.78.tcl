
mol new traj.78.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {1.886393 0.000000 1.156004} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {0.714720 1.738924 -1.156004} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 2.129738} width 3 style solid
graphics top color 0
graphics top line {1.886393 0.000000 1.156004} {2.601113 1.738924 0.000000} width 3 style dashed
graphics top line {0.714720 1.738924 -1.156004} {2.601113 1.738924 0.000000} width 3 style dashed
graphics top line {0.714720 1.738924 -1.156004} {0.714720 1.738924 0.973734} width 3 style dashed
graphics top line {0.000000 0.000000 2.129738} {0.714720 1.738924 0.973734} width 3 style dashed
graphics top line {1.886393 0.000000 1.156004} {1.886393 0.000000 3.285741} width 3 style dashed
graphics top line {0.000000 0.000000 2.129738} {1.886393 0.000000 3.285741} width 3 style dashed
graphics top line {2.601113 1.738924 0.000000} {2.601113 1.738924 2.129738} width 3 style dashed
graphics top line {0.714720 1.738924 0.973734} {2.601113 1.738924 2.129738} width 3 style dashed
graphics top line {1.886393 0.000000 3.285741} {2.601113 1.738924 2.129738} width 3 style dashed


