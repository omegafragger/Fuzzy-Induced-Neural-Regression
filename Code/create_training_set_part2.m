function [ ts ] = create_training_set_part2( train_series, partitions )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

l = length(train_series);
num_part = size(partitions,1);

ts = zeros(l-1, num_part+1);

for i = 1:l-1
    mv = gauss_mf(partitions,train_series(i));
    ts(i,1:end-1) = mv;
    ts(i,end) = train_series(i+1);
end

end

