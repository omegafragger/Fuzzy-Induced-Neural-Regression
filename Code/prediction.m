function [ s1,s2 ] = prediction( point, rule_prob, nets, partitions )
%Given a time-series data point, the function uses the trained neural nets
%to make a future prediction.

nn_count = size(nets,2);
prev_part = part_data_pt(partitions,point);
num_part = size(partitions,1);
s = 0;

preds = zeros(nn_count,1);
preds2 = zeros(nn_count,1);
probs = zeros(nn_count,1);

% fprintf ('----------------------------------------------------------------------\n');
% fprintf('Input given: %f\n',point);
% fprintf('Input partition: %d\n',prev_part);
for i = 1:nn_count
    %fprintf ('Output for neural network %d\n',i);
    pred = nets(i).net(point);
    preds2(i) = pred;
    if (pred > partitions(num_part,2))
        pred = partitions(num_part,2);
    end
    if (pred < partitions(1,1))
        pred = partitions(num_part,1);
    end
    %fprintf('Prediction: %f\n',pred);
    next_part = part_data_pt(partitions,pred);
    %fprintf('Output partition: %d\n',next_part);
    prob = rule_prob(prev_part, next_part);
    %fprintf('Probability of transition: %f\n',prob);
    %s = s + (pred * prob);
    %fprintf('current value of overall prediction: %f\n', s);
    preds(i) = pred;
    probs(i) = prob;
end

%Process the prob vector%
mx = sum(probs);
if mx ~= 0
    probs = probs/mx;
else
    for i = 1:nn_count
        probs(i) = 1/nn_count;
    end
end

% for i = 1:nn_count
%     fprintf ('Output for neural network %d\n',i);
%     fprintf('Prediction: %f\n',preds(i));
%     fprintf('Probability of transition: %f\n',probs(i));
% end

s1 = preds .* probs;
s1 = sum(s1);
s2 = mean(preds2);
% fprintf ('Value of overall prediction by weightage : %f\n', s1);
% fprintf('Value of overall prediction by simple average: %f\n', s2);
%pause(1);
end

