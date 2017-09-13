function [ mem_val ] = gauss_mf( partitions, point )
%A function to take a point and return the membership values in all the
%membership functions.

num_part = size(partitions,1);
mem_val = zeros(num_part,1);

for i = 1:num_part
    mean = (partitions(i,1) + partitions(i,2))/2;
    sig = partitions(i,2) - mean;
    mem_val(i) = gaussmf(point,[sig mean]);
end
end

