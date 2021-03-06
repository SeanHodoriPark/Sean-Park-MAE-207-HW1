clc 
clear all
close all

%% MAE 207 HW#1 Exercises 1.1 to 1.5 and 2.1 to 2.2 %%
% Sean Park
% A14633485

%% Exercise 1.1

A = [1 2; 3 4; 5 6];
B = [6 5 4; 3 2 1];

AB = A*B;
BA = B*A;

%% Exercise 1.2

RT = Toeplitz([1 2 3 4 5],[1 6 7 8 9]);
RCH = circHankel([1 2 3 4 5]);
RCT = circToeplitz([1 2 3 4 5]);
RH = Hankel([1 2 3],[3 4 5]);


%% Exercise 1.3
w = [0 1 0]';
H= eye(3) - 2*(w*w');
x = [3 6 2]';
HTx = H'*x;

wb = (x+norm(x)*[1 0 0]')/norm(x+norm(x)*[1 0 0]');
Hb = eye(3) -2*(wb*wb');
HbTx = Hb'*x;

%% Exercise 1.5
G = [0 1 0;-1 0 0;0 0 1];
x = [3 4 1]';
GTx= G'*x;

Theta = atan(-4/3);
Gb = [cos(Theta) sin(Theta) 0;-sin(Theta) cos(Theta) 0;0 0 1];
GbTx = Gb'*x;

%% Exercise 2.2
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

%% Exercise 1.2 Functions

function R=Toeplitz(top,left)
% builds an nxn Toeplitz matrix with specified top row and left column
n = length(top);
for row=1:n
    R(row,:) = [flip(left(2:row)) top(1:n+1-row)];
end
end

function R=circHankel(top)
%builds an nxn circulant Hankel matrix with specified top row
n = length(top);
for row=1:n
    ftop = flip(top); % flipped top
    R(row,:) = [top(row:n) flip(ftop(n+2-row:n))];
end
end

function R=circToeplitz(top)
% builds an nxn circulant Toeplitz matrix with specified top row
n = length(top);
for row = 1:n
   R(row,:) = [top(n+2-row:n) top(1:n+1-row)];
end
end


function R=Hankel(top,right)
% builds an nxn Hankel matrix with specified top row and right column
n = length(top); 
for row=1:n
    R(row,:) = [top(row:n) right(2:row)];
end
end



