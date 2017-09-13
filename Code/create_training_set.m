function [ res ] = create_training_set( rules )
%From the extracted rules of the time-series, this function produces the
%training set to train the neural networks.

r2 = rules;
num_part = size(rules,1);

%Count of neural networks required to train based on the given rules
nn_count = 1;
flag = 0;

while flag == 0
    index = 1;
    flag = 1;
    for i = 1:num_part
        for j = 1:num_part
            if (r2(i,j) ~= 0)
                res(index,1,nn_count) = i;
                res(index,2,nn_count) = j;
                r2(i,j) = 0;
                index = index + 1;
                flag = 0;
                break;
            end
        end
    end
    nn_count = nn_count + 1;
end
end

