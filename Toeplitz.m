function R=Toeplitz(top,left)
% builds an nxn Toeplitz matrix with specified top row and left column
n = length(top);
for row=1:n
    R(row,:) = [flip(left(2:row)) top(1:n+1-row)];
end
end
