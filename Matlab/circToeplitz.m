function R=circToeplitz(top)
% builds an nxn circulant Toeplitz matrix with specified top row
n = length(top);
for row = 1:n
   R(row,:) = [top(n+2-row:n) top(1:n+1-row)];
end
end
