function L = InvertL(L)
% This takes lower triangular matrix L and outputs its inverse
n = length(L);
for j=1:n
    Vect =  zeros(1,n);    % vector for inverse diagonal elements of L
    Vect(1,j) = 1/L(j,j);  % diagonal elements of the inverse are 
                           % just inverse of original diag elemnts of L
    L(j,:) = Vect - Vect(1,j)*L(j,1:j-1)*L(1:j-1,:);
end