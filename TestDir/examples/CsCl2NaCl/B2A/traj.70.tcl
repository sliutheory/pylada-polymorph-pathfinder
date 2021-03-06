
mol new traj.70.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {4.180435 0.000000 3.629538} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-3.745956 4.105890 4.382077} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.382077} width 3 style solid
graphics top color 0
graphics top line {4.180435 0.000000 3.629538} {0.434478 4.105890 8.011615} width 3 style dashed
graphics top line {-3.745956 4.105890 4.382077} {0.434478 4.105890 8.011615} width 3 style dashed
graphics top line {-3.745956 4.105890 4.382077} {-3.745956 4.105890 8.764154} width 3 style dashed
graphics top line {-0.000000 0.000000 4.382077} {-3.745956 4.105890 8.764154} width 3 style dashed
graphics top line {4.180435 0.000000 3.629538} {4.180435 0.000000 8.011615} width 3 style dashed
graphics top line {-0.000000 0.000000 4.382077} {4.180435 0.000000 8.011615} width 3 style dashed
graphics top line {0.434478 4.105890 8.011615} {0.434478 4.105890 12.393692} width 3 style dashed
graphics top line {-3.745956 4.105890 8.764154} {0.434478 4.105890 12.393692} width 3 style dashed
graphics top line {4.180435 0.000000 8.011615} {0.434478 4.105890 12.393692} width 3 style dashed


