
mol new traj.38.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.606215 0.000000 3.423976} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.422786 2.457163 -0.545060} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 3.009398} width 3 style solid
graphics top color 0
graphics top line {2.606215 0.000000 3.423976} {1.183429 2.457163 2.878916} width 3 style dashed
graphics top line {-1.422786 2.457163 -0.545060} {1.183429 2.457163 2.878916} width 3 style dashed
graphics top line {-1.422786 2.457163 -0.545060} {-1.422786 2.457163 2.464338} width 3 style dashed
graphics top line {-0.000000 0.000000 3.009398} {-1.422786 2.457163 2.464338} width 3 style dashed
graphics top line {2.606215 0.000000 3.423976} {2.606215 0.000000 6.433373} width 3 style dashed
graphics top line {-0.000000 0.000000 3.009398} {2.606215 0.000000 6.433373} width 3 style dashed
graphics top line {1.183429 2.457163 2.878916} {1.183429 2.457163 5.888313} width 3 style dashed
graphics top line {-1.422786 2.457163 2.464338} {1.183429 2.457163 5.888313} width 3 style dashed
graphics top line {2.606215 0.000000 6.433373} {1.183429 2.457163 5.888313} width 3 style dashed


