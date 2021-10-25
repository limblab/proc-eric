function [M1, I] = zero_nan(M)

I = (1:size(M,1))';
M1 = [M I];
M1(sum(isnan(M1), 2)>0,:)=0;
I = M1(:, end);
M1 = M1(:, 1:end-1);