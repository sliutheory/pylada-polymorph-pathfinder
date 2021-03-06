
mol new traj.46.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.590497 0.000000 3.167252} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.346056 2.442344 -0.659810} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 2.991248} width 3 style solid
graphics top color 0
graphics top line {2.590497 0.000000 3.167252} {1.244440 2.442344 2.507443} width 3 style dashed
graphics top line {-1.346056 2.442344 -0.659810} {1.244440 2.442344 2.507443} width 3 style dashed
graphics top line {-1.346056 2.442344 -0.659810} {-1.346056 2.442344 2.331438} width 3 style dashed
graphics top line {-0.000000 0.000000 2.991248} {-1.346056 2.442344 2.331438} width 3 style dashed
graphics top line {2.590497 0.000000 3.167252} {2.590497 0.000000 6.158500} width 3 style dashed
graphics top line {-0.000000 0.000000 2.991248} {2.590497 0.000000 6.158500} width 3 style dashed
graphics top line {1.244440 2.442344 2.507443} {1.244440 2.442344 5.498691} width 3 style dashed
graphics top line {-1.346056 2.442344 2.331438} {1.244440 2.442344 5.498691} width 3 style dashed
graphics top line {2.590497 0.000000 6.158500} {1.244440 2.442344 5.498691} width 3 style dashed


