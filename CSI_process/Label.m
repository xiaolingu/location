function [ CSI_data_label ] = Label(input_cap, CSI_data, label )
%LABEL Summary of this function goes here
%   Detailed explanation goes here
%% csi_data is array of input_cap * n    
    length = size(CSI_data);
    if(input_cap > length)
        error('input cap is larger than length, please input the smaller');
    end
    for x = 1:input_cap
        CSI_data_label(x,1) = label ;
    end
end

