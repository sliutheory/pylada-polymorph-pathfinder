
mol new traj.53.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.234435 0.000000 1.329484} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.466856 4.102739 -4.590669} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.590669} width 3 style solid
graphics top color 0
graphics top line {4.234435 0.000000 1.329484} {0.767578 4.102739 -3.261184} width 3 style dashed
graphics top line {-3.466856 4.102739 -4.590669} {0.767578 4.102739 -3.261184} width 3 style dashed
graphics top line {-3.466856 4.102739 -4.590669} {-3.466856 4.102739 -0.000000} width 3 style dashed
graphics top line {-0.000000 0.000000 4.590669} {-3.466856 4.102739 -0.000000} width 3 style dashed
graphics top line {4.234435 0.000000 1.329484} {4.234435 0.000000 5.920153} width 3 style dashed
graphics top line {-0.000000 0.000000 4.590669} {4.234435 0.000000 5.920153} width 3 style dashed
graphics top line {0.767578 4.102739 -3.261184} {0.767578 4.102739 1.329484} width 3 style dashed
graphics top line {-3.466856 4.102739 -0.000000} {0.767578 4.102739 1.329484} width 3 style dashed
graphics top line {4.234435 0.000000 5.920153} {0.767578 4.102739 1.329484} width 3 style dashed


