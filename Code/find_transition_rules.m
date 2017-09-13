function [ res ] = find_transition_rules( series, partitions )
% Finds the transition rules given the time-series and its partitions

num_part = size(partitions,1);
len = length(series);

res = zeros(num_part,num_part);

for i = 1:len-1
    prev_part = part_data_pt(partitions,series(i));
    next_part = part_data_pt(partitions,series(i+1));
    res(prev_part,next_part) = res(prev_part,next_part) + 1;
end
end

