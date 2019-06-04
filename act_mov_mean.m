function [y_out] = act_mov_mean(x_in, k)

den = 1/(2*k + 1);

N = length(x_in);

y_out = [];
for t=1:N
    num = 0;
    for j = -k:k
        if(t+j >=1 && t+j <= N)
            num =  num + x_in(t+j);
        end
    end
    y_out(t) = den*num;
end
