function [  ] = plot_partitions( series, partitions )
%Plots the time-series and its partitions

plot([1:length(series)]',series,'k*-');
hold on;

for i = 1:(size(partitions,1))
    line([1,length(series)],[partitions(i,1),partitions(i,1)]);
end

n = size(partitions,1);
line([1,length(series)],[partitions(n,2),partitions(n,2)]);

end

