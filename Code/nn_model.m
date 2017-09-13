%% Script to create, execute and test the neural net model. %%
%% Creating the data sets and partitioning it into sets of 1000 data points %%
clear; close all; clc;
load 'sunspot.txt';
data = sunspot(:,4);
run = ceil(size(data)/1000);
data_sets = zeros(length(data),run);
j = 1;
% for i = 1:run
%     data_sets(:,i) = data(j:j+999);
%     j = j + 1000;
% end
data_sets(:,1) = data;

%% Training neural net and predicting for each test run of the data %%

num_part = 20;
rmse_val = zeros(run,1);
%TODO: Convert the second 1 to run !!!!
for i = 1:1
    %Separate the series into training and testing periods
    dt = data_sets(:,i);
    l = floor(0.5*length(dt));
    train_series = dt(1:l);
    test_series = dt(l+1:end);
    partitions = main_0(dt,num_part);
    plot_partitions(train_series, partitions);
    rules = main_1(train_series, partitions);
    [rts1, rts2, rule_prob] = main_2(rules, partitions);
    fprintf('Training the neural networks for part 1\n');
    nets1 = train_neural_nets(rts1);
   % fprintf('Training the neural networks for part 2\n');
   % nets2 = train_neural_nets2(rts2);
    
    %Prediction phase
    pred11 = zeros(length(dt)-l,1);
    pred12 = zeros(length(dt)-l,1);
    %pred2 = zeros(200,1);
    fprintf('Running test cases ..................\n');
    for j = l:(length(dt)-1)
        fprintf('--------Iteration %d-------------------\n',j-l+1);
        inp = dt(j);
        [out11,out12] = prediction(inp,rule_prob,nets1,partitions);
        %out2 = prediction2(inp,rule_prob,nets2,partitions);
        pred11(j-l+1) = out11;
        pred12(j-l+1) = out12;
        %pred2(j-799) = out2;
    end
    rmse_val(i) = rmse(test_series, pred11);
    %Plot the predictions
     figure;
     plot((1:(length(dt)-l))',test_series,'k*-');
     hold on;
     plot((1:(length(dt)-l))',pred11,'r*-');
    %plot((1:100)',pred12,'b*-');
    %plot((1:200)',pred2,'b*-');
end
