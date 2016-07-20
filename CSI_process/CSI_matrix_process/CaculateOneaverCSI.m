function [ averCSIeffect ] = CaculateOneaverCSI( csi_matrix )
%CACULATEONE is to cacluate the average of one subcarrier
    averCSI = mean(csi_matrix(:));
    averCSIeffect = abs(averCSI);   
end

