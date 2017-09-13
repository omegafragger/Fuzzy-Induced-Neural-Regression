function [ res ] = part_data_pt( partitions, point )
%A function to find the partition to which a data point belongs.

res = 0;
num_part = size(partitions, 1);

for i = 1:num_part
    if ((point >= partitions(i,1)) && (point <= partitions(i,2)))
        res = i;
        break;
    end
end

end

