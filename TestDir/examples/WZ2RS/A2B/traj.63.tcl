
mol new traj.63.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {3.149168 0.000000 0.000000} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-2.125576 2.874898 -1.558440} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.838787} width 3 style solid
graphics top color 0
graphics top line {3.149168 0.000000 0.000000} {1.023592 2.874898 -1.558440} width 3 style dashed
graphics top line {-2.125576 2.874898 -1.558440} {1.023592 2.874898 -1.558440} width 3 style dashed
graphics top line {-2.125576 2.874898 -1.558440} {-2.125576 2.874898 3.280347} width 3 style dashed
graphics top line {-0.000000 0.000000 4.838787} {-2.125576 2.874898 3.280347} width 3 style dashed
graphics top line {3.149168 0.000000 0.000000} {3.149168 0.000000 4.838787} width 3 style dashed
graphics top line {-0.000000 0.000000 4.838787} {3.149168 0.000000 4.838787} width 3 style dashed
graphics top line {1.023592 2.874898 -1.558440} {1.023592 2.874898 3.280347} width 3 style dashed
graphics top line {-2.125576 2.874898 3.280347} {1.023592 2.874898 3.280347} width 3 style dashed
graphics top line {3.149168 0.000000 4.838787} {1.023592 2.874898 3.280347} width 3 style dashed


