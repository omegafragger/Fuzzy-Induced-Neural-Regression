function [ net ] = train_part2( ts )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

num_part = size(ts,2) - 1;

net = feedforwardnet(num_part + 10);
net = train(net, (ts(:,1:end-1))',(ts(:,end))');

end

