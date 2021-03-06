
mol new traj.55.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.810442 -0.422429 4.610420} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {0.386993 2.244039 -0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.610420} width 3 style solid
graphics top color 0
graphics top line {2.810442 -0.422429 4.610420} {3.197436 1.821610 4.610420} width 3 style dashed
graphics top line {0.386993 2.244039 -0.000000} {3.197436 1.821610 4.610420} width 3 style dashed
graphics top line {0.386993 2.244039 -0.000000} {0.386993 2.244039 4.610420} width 3 style dashed
graphics top line {0.000000 0.000000 4.610420} {0.386993 2.244039 4.610420} width 3 style dashed
graphics top line {2.810442 -0.422429 4.610420} {2.810442 -0.422429 9.220840} width 3 style dashed
graphics top line {0.000000 0.000000 4.610420} {2.810442 -0.422429 9.220840} width 3 style dashed
graphics top line {3.197436 1.821610 4.610420} {3.197436 1.821610 9.220840} width 3 style dashed
graphics top line {0.386993 2.244039 4.610420} {3.197436 1.821610 9.220840} width 3 style dashed
graphics top line {2.810442 -0.422429 9.220840} {3.197436 1.821610 9.220840} width 3 style dashed


