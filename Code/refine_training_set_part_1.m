function [ res ] = refine_training_set_part_1( training_set, partitions )
% Function refines the training set to form mid value to mid value mapping.

num_part = size(partitions,1);
mid_vals = zeros(num_part, 1);

for i = 1:num_part
    mid_vals(i) = (partitions(i,1) + partitions(i,2))/2;
end

nn_count = size(training_set,3);
rows = size(training_set,1);
res = zeros(size(training_set));

for i = 1:nn_count
    train = training_set(:,:,i);
    for j = 1:rows
        if train(j,1) ~= 0
            prev = train(j,1);
            next = train(j,2);
            train(j,1) = mid_vals(prev);
            train(j,2) = mid_vals(next);
        end
    end
    res(:,:,i) = train;
end
end

