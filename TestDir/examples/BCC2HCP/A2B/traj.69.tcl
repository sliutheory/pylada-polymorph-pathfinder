
mol new traj.69.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {2.853802 0.000000 4.605359} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-0.192408 2.620670 0.000000} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {0.000000 0.000000 4.605359} width 3 style solid
graphics top color 0
graphics top line {2.853802 0.000000 4.605359} {2.661393 2.620670 4.605359} width 3 style dashed
graphics top line {-0.192408 2.620670 0.000000} {2.661393 2.620670 4.605359} width 3 style dashed
graphics top line {-0.192408 2.620670 0.000000} {-0.192408 2.620670 4.605359} width 3 style dashed
graphics top line {0.000000 0.000000 4.605359} {-0.192408 2.620670 4.605359} width 3 style dashed
graphics top line {2.853802 0.000000 4.605359} {2.853802 0.000000 9.210717} width 3 style dashed
graphics top line {0.000000 0.000000 4.605359} {2.853802 0.000000 9.210717} width 3 style dashed
graphics top line {2.661393 2.620670 4.605359} {2.661393 2.620670 9.210717} width 3 style dashed
graphics top line {-0.192408 2.620670 4.605359} {2.661393 2.620670 9.210717} width 3 style dashed
graphics top line {2.853802 0.000000 9.210717} {2.661393 2.620670 9.210717} width 3 style dashed


