function [ refined_training_set1, refined_training_set2, rule_prob ] = main_2( rules, partitions )
%A main function to prepare the training set and refine them for the neural
%net training.

training_set = create_training_set(rules)
refined_training_set1 = refine_training_set_part_1(training_set,partitions);
refined_training_set2 = refine_training_set_part_2(refined_training_set1,partitions);
rule_prob = rule_probability(rules);
end

