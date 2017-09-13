function [ res ] = rule_probability( rules )
%A function to convert the rule matrix to a transition probability matrix.


num_part = size(rules,1);
s = sum(rules,2);
res = zeros(size(rules));

for i = 1:num_part
    if s(i) ~= 0
        res(i,:) = rules(i,:)/s(i);
    else
        res(i,:) = 0;
    end
end
end

