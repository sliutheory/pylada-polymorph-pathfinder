
mol new traj.21.xyz type xyz
mol delrep 0 top
mol rep CPK 0.9 0 150 0
mol addrep top 

mol rep DynamicBonds 3.600000 0.1 100
mol addrep top 

graphics top color 1
graphics top line {0.000000 0.000000 0.000000} {3.192555 0.000000 4.997971} width 3 style solid 
graphics top color 2
graphics top line {0.000000 0.000000 0.000000} {-1.909003 2.848628 4.997971} width 3 style solid
graphics top color 3
graphics top line {0.000000 0.000000 0.000000} {-0.000000 0.000000 4.997971} width 3 style solid
graphics top color 0
graphics top line {3.192555 0.000000 4.997971} {1.283552 2.848628 9.995942} width 3 style dashed
graphics top line {-1.909003 2.848628 4.997971} {1.283552 2.848628 9.995942} width 3 style dashed
graphics top line {-1.909003 2.848628 4.997971} {-1.909003 2.848628 9.995942} width 3 style dashed
graphics top line {-0.000000 0.000000 4.997971} {-1.909003 2.848628 9.995942} width 3 style dashed
graphics top line {3.192555 0.000000 4.997971} {3.192555 0.000000 9.995942} width 3 style dashed
graphics top line {-0.000000 0.000000 4.997971} {3.192555 0.000000 9.995942} width 3 style dashed
graphics top line {1.283552 2.848628 9.995942} {1.283552 2.848628 14.993913} width 3 style dashed
graphics top line {-1.909003 2.848628 9.995942} {1.283552 2.848628 14.993913} width 3 style dashed
graphics top line {3.192555 0.000000 9.995942} {1.283552 2.848628 14.993913} width 3 style dashed


