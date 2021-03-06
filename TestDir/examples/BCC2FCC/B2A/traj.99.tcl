
mol new traj.99.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.907606 0.000000 2.053151} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {1.450159 2.519739 -2.053151} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 3.086037} width 3 style solid
graphics top color 0
graphics top line {2.907606 0.000000 2.053151} {4.357765 2.519739 0.000000} width 3 style dashed
graphics top line {1.450159 2.519739 -2.053151} {4.357765 2.519739 0.000000} width 3 style dashed
graphics top line {1.450159 2.519739 -2.053151} {1.450159 2.519739 1.032886} width 3 style dashed
graphics top line {0.000000 0.000000 3.086037} {1.450159 2.519739 1.032886} width 3 style dashed
graphics top line {2.907606 0.000000 2.053151} {2.907606 0.000000 5.139188} width 3 style dashed
graphics top line {0.000000 0.000000 3.086037} {2.907606 0.000000 5.139188} width 3 style dashed
graphics top line {4.357765 2.519739 0.000000} {4.357765 2.519739 3.086037} width 3 style dashed
graphics top line {1.450159 2.519739 1.032886} {4.357765 2.519739 3.086037} width 3 style dashed
graphics top line {2.907606 0.000000 5.139188} {4.357765 2.519739 3.086037} width 3 style dashed


