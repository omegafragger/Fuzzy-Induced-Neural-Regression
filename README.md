# Fuzzy-Induced-Neural-Regression

In this project, a new grouping scheme of first-order transition rules obtained from a partitioned time-series
for fuzzy-induced neural regression has been explored. The transition rules represent precedence relationships
between a pair of partitions containing consecutive data points in the time-series. The project has two neural network ensemble
models. The first model represents a set of transition rules, each with a distinct partition in the antecedent. During the
prediction phase, a certain number of pre-selected neural networks trained on the partition containing the current timeseries
data point are triggered. In this model, the partitions are described by their respective mid-point values during
training. This induces an approximation error, as all data points lying in a partition are effectively represented by a
single value. In the second model, this problem is resolved by representing each partition as a fuzzy set. This
modification allows us to evaluate the degree of belongingness of a data point in each partition. Extensive experiments
undertaken on the Sunspot time-series as well as on the TAIEX economic close-price time-series reveal a high
prediction accuracy outperforming competitive models, thus indicating the applicability of the proposed methods to
real life time-series forecasting.
