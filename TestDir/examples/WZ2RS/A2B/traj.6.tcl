
mol new traj.6.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.994604 0.000000 0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.897119 2.968483 -3.959280} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.271694} width 3 style solid
graphics top color 0
graphics top line {2.994604 0.000000 0.000000} {0.097485 2.968483 -3.959280} width 3 style dashed
graphics top line {-2.897119 2.968483 -3.959280} {0.097485 2.968483 -3.959280} width 3 style dashed
graphics top line {-2.897119 2.968483 -3.959280} {-2.897119 2.968483 0.312414} width 3 style dashed
graphics top line {-0.000000 0.000000 4.271694} {-2.897119 2.968483 0.312414} width 3 style dashed
graphics top line {2.994604 0.000000 0.000000} {2.994604 0.000000 4.271694} width 3 style dashed
graphics top line {-0.000000 0.000000 4.271694} {2.994604 0.000000 4.271694} width 3 style dashed
graphics top line {0.097485 2.968483 -3.959280} {0.097485 2.968483 0.312414} width 3 style dashed
graphics top line {-2.897119 2.968483 0.312414} {0.097485 2.968483 0.312414} width 3 style dashed
graphics top line {2.994604 0.000000 4.271694} {0.097485 2.968483 0.312414} width 3 style dashed


