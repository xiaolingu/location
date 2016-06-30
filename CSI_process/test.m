clear; clc;
%% csi_data_label matrix formation
gap = 25 ;
input_cap = 100 ;
count_loc = 4 ;
pre_path = './CSI_data/6.29/locations_'
suffix_path = '.dat';
csi_data_label = [] ;
for i=1:count_loc
    label = i ;
    location = sprintf('%s%d%s',pre_path, i, suffix_path);
    [CSI_vector_temp, CSI_vector_label] = CSI_SampleMatrix(location, input_cap, label, gap);
    csi_data_label = [csi_data_label; [CSI_vector_temp, CSI_vector_label]];
end
%% caculate the misclassifying error
csi_train_vector = csi_data_label(:,end-1);
csi_train_label_cell = cellstr(num2str(csi_data_label(:,end)));

%% 10-fold cross validator

class_error = k_nearest(csi_train_vector, csi_train_label_cell);
fprintf('class_error is: %f\n', class_error);
