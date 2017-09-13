close all; clear; clc;

%% Loading data and preparing the training set %%

load 'data.txt';
run = ceil(size(data)/1000);
data_sets = zeros(length(data),run);
j = 1;
% for i = 1:run
%     data_sets(:,i) = data(j:j+999);
%     j = j + 1000;
% end
data_sets(:,1) = data;
%% Train the neural network %%

num_part = 40;
rmse_val = zeros(run,1);

for i = 1:run
    %Separate the series into training and testing periods
    dt = data_sets(:,i);
    l = floor(0.8*length(dt));
    train_series = dt(1:l);
    test_series = dt(l+1:end);
    partitions = main_0(dt,num_part);
    
    ts = create_training_set_part2(train_series, partitions);
    net = train_part2(ts);
    
    %Prediction phase
    preds = zeros(length(dt)-l,1);
    
    for j = l:(length(dt)-1)
        fprintf('--------Iteration %d-------------------\n',j-l+1);
        inp = dt(j);
        preds(j-l+1) = predict_part2(net,inp,partitions);
    end
    
    %Calculate rmse and plot%
    rmse_val(i) = rmse(test_series, preds);
    figure;
    plot((1:(length(dt)-l))',test_series,'k*-');
    hold on;
    plot((1:(length(dt)-l))',preds,'r*-');
end
