function [] = task_5_1()
    times = [1 2 3 4 5 6 7 8 9];
    conds = [
        1 2 -9
        1 3 -9
        1 4 -9
        1 5 -16
        2 5 -7
        3 5 -7
        4 6 -15
        5 6 -8
        5 7 -13
        5 8 -22
        6 7 -5
        6 8 -14
        6 9 -23
        7 8 -9
        7 9 -18
        8 9 -9
    ];
    f = ones(length(times), 1);
    A = zeros(length(conds), length(times));
    b = zeros(1, length(conds));
    for i = 1:length(conds)
        t1 = find(times == conds(i, 1));
        t2 = find(times == conds(i, 2));
        A(i, t1) = 1;
        A(i, t2) = -1;
        b(1, i) = conds(i, 3);
    end

    lb = zeros(length(times), 1);

    t = linprog(f, A, b, [], [], lb);
    disp(t)
end