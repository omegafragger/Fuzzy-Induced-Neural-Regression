function [ res ] = rmse( vec1, vec2 )
%Find the rmse of vec1 and vec2

v = abs(vec1 - vec2);
v = v.^2;
m = mean(v);
res = sqrt(m);


end

