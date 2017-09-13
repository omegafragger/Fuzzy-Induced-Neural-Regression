function [ res ] = predict_part2( net, point, partitions )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

mv = gauss_mf(partitions, point);
res = net(mv);
end

