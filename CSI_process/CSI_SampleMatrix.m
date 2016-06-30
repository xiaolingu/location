function [selectedMatrix ,selectedMatrixlabel] = CSI_SampleMatrix( filepath, input_cap ,label ,gap )
%load the csi to file    
%   output CSI_data
    disp(filepath);
    csi_data = read_log_file(filepath);
    clc;
    selectedMatrix = caculateCSIvector(csi_data, gap);
    selectedMatrix = selectedMatrix(1:input_cap,:);
    selectedMatrixlabel = Label(input_cap, csi_data, label);
end

