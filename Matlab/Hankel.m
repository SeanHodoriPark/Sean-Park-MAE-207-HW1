function R=Hankel(top,right)
% builds an nxn Hankel matrix with specified top row and right column
n = length(top); 
for row=1:n
    R(row,:) = [top(row:n) right(2:row)];
end
end
