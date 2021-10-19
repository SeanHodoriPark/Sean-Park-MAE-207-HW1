clc
close all
clear all

% some random lower triangular 5x5 matrix
A = tril(rand(7));

Ainv = InvertL(A);

Matlabinv = inv(A);

% see what the norm of the difference between
% InvertL and matlab inv is
NormDiff = norm(Matlabinv-Ainv);

%% After computing Ainv from the InvertL function we find that Ainv*A gives us the 
%% identity matrix. From inspection we see that Ainv is similarly lower triangular
%% and that the diagonal elements of Ainv are the diagonal elements of A. 
%% This corresponds with Fact 2.1 in the textbook. 


function L = InvertL(L)
% This takes lower triangular matrix L and outputs its inverse
n = length(L);
B = eye(n);
for j=1:n
    L(j,:) = (B(j,:) - L(j,1:j-1)*L(1:j-1,:))/L(j,j);
end
end
