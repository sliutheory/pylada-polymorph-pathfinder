
mol new traj.71.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.453969 -0.000000 0.211139} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.258815 2.142495 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 -0.000000 6.087735} width 3 style solid
graphics top color 0
graphics top line {2.453969 -0.000000 0.211139} {1.195154 2.142495 0.211139} width 3 style dashed
graphics top line {-1.258815 2.142495 0.000000} {1.195154 2.142495 0.211139} width 3 style dashed
graphics top line {-1.258815 2.142495 0.000000} {-1.258815 2.142495 6.087735} width 3 style dashed
graphics top line {0.000000 -0.000000 6.087735} {-1.258815 2.142495 6.087735} width 3 style dashed
graphics top line {2.453969 -0.000000 0.211139} {2.453969 -0.000000 6.298874} width 3 style dashed
graphics top line {0.000000 -0.000000 6.087735} {2.453969 -0.000000 6.298874} width 3 style dashed
graphics top line {1.195154 2.142495 0.211139} {1.195154 2.142495 6.298874} width 3 style dashed
graphics top line {-1.258815 2.142495 6.087735} {1.195154 2.142495 6.298874} width 3 style dashed
graphics top line {2.453969 -0.000000 6.298874} {1.195154 2.142495 6.298874} width 3 style dashed


