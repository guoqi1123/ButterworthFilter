function y = butterworthfunc(p_x,p_y,w_c) %p represents the poles,w_c represents the cut off frequency
[n_x,n_y] = size(x);
m_x = length(p_x);
m_y = length(p_y);
y = zeros(n,1);

for i = 1:n_x
    for j = 1:n_y
        temp = 1;
        for k = 1:m_x
            temp = temp * (i - p_x(k));
        end
        for k = 1:m_y
            temp = temp * (j - p_y(k));
        end
        temp = 
        
    end
end
end 