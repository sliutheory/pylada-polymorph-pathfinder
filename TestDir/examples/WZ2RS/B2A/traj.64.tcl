
mol new traj.64.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {3.075954 0.000000 4.570164} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.491044 2.919227 4.570164} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.570164} width 3 style solid
graphics top color 0
graphics top line {3.075954 0.000000 4.570164} {0.584910 2.919227 9.140328} width 3 style dashed
graphics top line {-2.491044 2.919227 4.570164} {0.584910 2.919227 9.140328} width 3 style dashed
graphics top line {-2.491044 2.919227 4.570164} {-2.491044 2.919227 9.140328} width 3 style dashed
graphics top line {-0.000000 0.000000 4.570164} {-2.491044 2.919227 9.140328} width 3 style dashed
graphics top line {3.075954 0.000000 4.570164} {3.075954 0.000000 9.140328} width 3 style dashed
graphics top line {-0.000000 0.000000 4.570164} {3.075954 0.000000 9.140328} width 3 style dashed
graphics top line {0.584910 2.919227 9.140328} {0.584910 2.919227 13.710492} width 3 style dashed
graphics top line {-2.491044 2.919227 9.140328} {0.584910 2.919227 13.710492} width 3 style dashed
graphics top line {3.075954 0.000000 9.140328} {0.584910 2.919227 13.710492} width 3 style dashed


