function [] = task_3_1()
    works = [12 13 14 15 25 35 46 56 57 58 67 68 69 78 79 89 99];
    conds = [
        25 12 9
        35 13 9
        46 14 9
        56 15 5
        56 25 6
        56 35 7
        57 15 5
        57 25 6
        57 35 7
        67 56 8
        67 46 5
        58 15 5
        58 25 6
        58 35 7
        68 46 5
        68 56 8
        78 57 8
        78 67 5
        69 46 5
        69 56 8
        79 57 8
        79 67 5
        89 58 9
        89 68 8
        89 78 9
        99 69 9
        99 79 7
        99 89 9
        ];

    pairs = [
        15 57 5 8
        13 35 9 7
        14 46 9 5
        46 67 5 5
    ];
    cond_len = length(conds) + 2 * length(pairs);
    x_len = length(works) + 2 * length(pairs);
    f = ones(x_len, 1);
    f(length(works) + 1:end) = 0;
    A = zeros(cond_len, x_len);
    b = zeros(1, cond_len);
    for i = 1:length(conds)
        t1 = find(works == conds(i, 1));
        t2 = find(works == conds(i, 2));
        A(i, t1) = -1;
        A(i, t2) = 1;
        b(1, i) = -conds(i, 3);
    end

    Aeq = zeros(length(pairs), x_len);
    beq = ones(1, length(pairs));

    for i = 1:length(pairs)
        t1 = find(works == pairs(i, 1));
        t2 = find(works == pairs(i, 2));
        tau1 = pairs(i, 3);
        tau2 = pairs(i, 4);
        Y1 = length(works) + 2 * i - 1;
        Y2 = length(works) + 2 * i;
        M = 1000;

        idx = length(conds) + 2 * i - 1;
        A(idx, Y1) = -(M + tau2);
        A(idx, t1) = -1;
        A(idx, t2) = 1;
        b(1, idx) = -tau2;

        idx = idx + 1;
        A(idx, Y2) = -(M + tau1);
        A(idx, t1) = 1;
        A(idx, t2) = -1;
        b(1, idx) = -tau1;

        Aeq (i, Y1) = 1;
        Aeq (i, Y2) = 1;
    end

    lb = zeros(x_len, 1);

    x = intlinprog(f, (length(works) + 1):x_len, A, b, Aeq, beq, lb);

    disp(x)
end