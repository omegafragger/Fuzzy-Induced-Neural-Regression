function [ rms, ms, nms ] = error_metrics( actual, pred )
%Function to compute the MSE, RMSE and NMSE errors.

rms = rmse(actual, pred);
ms = rms^2;
nms = nmse(pred, actual);

end

