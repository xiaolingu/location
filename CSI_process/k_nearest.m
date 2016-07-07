function [ kloss ] = k_nearest( CSI_data, label )
%train and predict the location
%   CSI_data is a summary of all CSI_data, label is a cell
    md1 = fitcknn(CSI_data, label, 'NumNeighbors',1,'Standardize', 1);
    rng('shuffle');
    CVMd1 = crossval(md1);
    kloss = kfoldLoss(CVMd1);
end

