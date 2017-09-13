function [ res ] = partition( series, num_part )
%A function to partition the given time series into the number of
%partitions specified as a parameter

mx = max(series);
mn = min(series);

diff = mx-mn;
part_width = diff/num_part;

res = zeros(num_part,2);

temp = mn;

for i = 1:num_part
    res(i,1) = temp;
    temp = temp + part_width;
    res(i,2) = temp;
end
end

