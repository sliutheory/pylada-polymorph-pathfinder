
mol new traj.72.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.175739 0.000000 3.661569} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.770226 4.106164 4.363938} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.363938} width 3 style solid
graphics top color 0
graphics top line {4.175739 0.000000 3.661569} {0.405513 4.106164 8.025507} width 3 style dashed
graphics top line {-3.770226 4.106164 4.363938} {0.405513 4.106164 8.025507} width 3 style dashed
graphics top line {-3.770226 4.106164 4.363938} {-3.770226 4.106164 8.727877} width 3 style dashed
graphics top line {-0.000000 0.000000 4.363938} {-3.770226 4.106164 8.727877} width 3 style dashed
graphics top line {4.175739 0.000000 3.661569} {4.175739 0.000000 8.025507} width 3 style dashed
graphics top line {-0.000000 0.000000 4.363938} {4.175739 0.000000 8.025507} width 3 style dashed
graphics top line {0.405513 4.106164 8.025507} {0.405513 4.106164 12.389446} width 3 style dashed
graphics top line {-3.770226 4.106164 8.727877} {0.405513 4.106164 12.389446} width 3 style dashed
graphics top line {4.175739 0.000000 8.025507} {0.405513 4.106164 12.389446} width 3 style dashed


