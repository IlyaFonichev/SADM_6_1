%   t12 t13 t14 t15 t25 t35 t46 t56 t57 t58 t67 t68 t69 t78 t79 t89
A = [1   0   0   0  -1   0   0   0   0   0   0   0   0   0   0   0; % 1
     0   1   0   0   0  -1   0   0   0   0   0   0   0   0   0   0; % 2
     0   0   1   0   0   0  -1   0   0   0   0   0   0   0   0   0; % 3
     0   0   0   1   0   0   0  -1   0   0   0   0   0   0   0   0; % 4
     0   0   0   0   1   0   0  -1   0   0   0   0   0   0   0   0; % 5
     0   0   0   0   0   1   0  -1   0   0   0   0   0   0   0   0; % 6
     0   0   0   1   0   0   0   0  -1   0   0   0   0   0   0   0; % 7
     0   0   0   0   1   0   0   0  -1   0   0   0   0   0   0   0; % 8
     0   0   0   0   0   1   0   0  -1   0   0   0   0   0   0   0; % 9
     0   0   0   0   0   0   0   1   0   0  -1   0   0   0   0   0; % 10
     0   0   0   0   0   0   1   0   0   0  -1   0   0   0   0   0; % 11
     0   0   0   1   0   0   0   0   0  -1   0   0   0   0   0   0; % 12
     0   0   0   0   1   0   0   0   0  -1   0   0   0   0   0   0; % 13
     0   0   0   0   0   1   0   0   0  -1   0   0   0   0   0   0; % 14
     0   0   0   0   0   0   1   0   0   0   0  -1   0   0   0   0; % 15
     0   0   0   0   0   0   0   1   0   0   0  -1   0   0   0   0; % 16
     0   0   0   0   0   0   0   0   1   0   0   0   0  -1   0   0; % 17
     0   0   0   0   0   0   0   0   0   0   1   0   0  -1   0   0; % 18
     0   0   0   0   0   0   1   0   0   0   0   0  -1   0   0   0; % 19
     0   0   0   0   0   0   0   1   0   0   0   0  -1   0   0   0; % 20
     0   0   0   0   0   0   0   0   1   0   0   0   0   0  -1   0; % 21
     0   0   0   0   0   0   0   0   0   0   1   0   0   0  -1   0; % 22
     0   0   0   0   0   0   0   0   0   1   0   0   0   0   0  -1; % 23
     0   0   0   0   0   0   0   0   0   0   0   1   0   0   0  -1; % 24
     0   0   0   0   0   0   0   0   0   0   0   0   0   1   0  -1; % 25
     ];
 
b = -[9; 9; 9; 5; 6; 7; 5; 6; 7; 8; 5; 5; 6; 7; 5; 8; 8; 5; 5; 8; 8; 5; 9; 8; 9];

f = ones(16, 1);
lb = zeros(16, 1);
 
linprog(f, A, b, [], [], lb, []);