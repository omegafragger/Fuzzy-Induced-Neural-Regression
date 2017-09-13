function [ rules ] = main_1( time_series, partitions )
%Given a time-series and number of partitions provides the transition rules using sub
%functions.

%plot_partitions(time_series,partitions);
rules = find_transition_rules(time_series, partitions);

end

