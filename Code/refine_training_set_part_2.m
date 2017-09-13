function [ res ] = refine_training_set_part_2( ref_training_set, partitions )
%A function to produce a training set for training a neural net using fuzzy
%membership values of the input time-series value.

nn_count = size(ref_training_set,3);
rows = size(ref_training_set,1);
num_part = size(partitions,1);
res = zeros(rows,num_part+1,nn_count);

for i = 1:nn_count
    tr = ref_training_set(:,:,i);
    for j = 1:rows
        if tr(j,1) ~= 0
            res(j,1:end-1,i) = (gauss_mf(partitions,tr(j,1)))';
            res(j,end,i) = tr(j,2);
        end
    end
end
end

