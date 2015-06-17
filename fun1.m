function omega = fun1(I,alpha)
    [x,y] = size(I);
    c_x = ceil(x/2);
    c_y = ceil(y/2);
    dist = zeros(x,y);
    sum = 0;
    circle = zeros(x,y);
    for i = 1:x
        for j = 1:y
            dist(i,j) = ceil(sqrt((i - c_x)^2 + (j - c_y)^2));
            sum = sum + I(i,j);
        end
    end

    w_b = max(max(dist));
    sum_1 = 0; % use to calculate the components within omegac
    for i = 0:w_b
        [c,r] = find(dist > i - 1 & dist <= i);
        num = length(c);
        for j = 1:num
            sum_1 = sum_1 + I(c(j,1),r(j,1));
            circle(c(j,1),r(j,1)) = 1;
        end
        if (sum_1/sum)> alpha
            omega = i;
            return
        end
    end
    omega = 0;
end