function R=circHankel(top)
%builds an nxn circulant Hankel matrix with specified top row
n = length(top);
for row=1:n
    ftop = flip(top); % flipped top
    R(row,:) = [top(row:n) flip(ftop(n+2-row:n))];
end
end
