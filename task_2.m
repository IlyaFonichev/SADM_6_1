function [] = task_2()
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
    x0 = ones(length(works) * 2 - 1, 1);
    lb = zeros(length(works) * 2 - 1, 1);
    
    fun = @(x) sum(x(1:length(works)));
    
    res = fmincon(fun, x0, [], [], [], [], lb, [], @funs);
    
    function [c, ceq] = funs(x)
        c = [];
        for i = 1:length(conds)
            t1 = find(works == conds(i, 1));
            t2 = find(works == conds(i, 2));
            q = conds(i, 3);
            m = length(works) + t2;
            c(end + 1) = -x(t1(1)) + x(t2(1)) + q / x(m);
        end
        ceq = sum(x(length(works) + 1:end)) - 0.75 * (length(works) - 1);
    end

    t_res = res(1:length(works));
    m_res = res(length(works) + 1:end);
    sum_m_res = sum(m_res);
    mean_m_res = mean(m_res);

    disp(t_res);
    disp(m_res);
    disp(sum_m_res);
    disp(mean_m_res);
end