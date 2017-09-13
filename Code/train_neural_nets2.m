function [ a ] = train_neural_nets2( refined_training_set )
%A function to train the neural networks on the given data.

nn_count = size(refined_training_set,3);
r = size(refined_training_set,1);
num_part = size(refined_training_set,2) - 1;

nn_rc = 0;
for i = 1:nn_count
    tr = refined_training_set(:,:,i);
    idx = 1;
    while idx <= r
        s = sum(tr(idx,1:end-1));
        if s == 0
            break;
        end
        idx = idx + 1;
    end
    if idx >= 5
        nn_rc = nn_rc + 1;
    end
end
nn_count = nn_rc;

for i = 1:nn_count
    %Prepare the training data
    tr = refined_training_set(:,:,i);
    idx = 1;
    while idx <= r
        s = sum(tr(idx,1:end-1));
        if s == 0
            break;
        end
        idx = idx +1;
    end
    tr = tr(1:idx-1,:);
    
    %Code for neural net
    a(i).net = feedforwardnet(num_part+10);
    a(i).net = train(a(i).net,(tr(:,1:end-1))',(tr(:,end))');
end
end

