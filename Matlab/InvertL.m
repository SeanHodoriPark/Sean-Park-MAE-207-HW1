function L = InvertL(L)
% This takes lower triangular matrix L and outputs its inverse
n = length(L);
B = eye(n);
for j=1:n
    L(j,:) = (B(j,:) - L(j,1:j-1)*L(1:j-1,:))/L(j,j);
end
end
