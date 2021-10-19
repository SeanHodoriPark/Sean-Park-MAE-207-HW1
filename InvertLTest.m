clc
close all
clear all

% some random lower triangular 5x5 matrix
A = tril(rand(5));

Ainv = InvertL(A);

A*Ainv

%% After computing Ainv from the InvertL function we find that Ainv*A gives us the 
%% identity matrix. From inspection we see that Ainv is similarly lower triangular
%% and that the diagonal elements of Ainv are the diagonal elements of A. 
%% This corresponds with Fact 2.1 in the textbook. 


function L = InvertL(L)
% This takes lower triangular matrix L and outputs its inverse
n = length(L);
for j=1:n
    Vect =  zeros(1,n);    % vector for inverse diagonal elements of L
    Vect(1,j) = 1/L(j,j);  % diagonal elements of the inverse are 
                           % just inverse of original diag elemnts of L
    L(j,:) = Vect - Vect(1,j)*L(j,1:j-1)*L(1:j-1,:);
end
end
