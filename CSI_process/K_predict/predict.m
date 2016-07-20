    clc;clear;
    %% csi_data_label matrix formation
    while 1
        gap = input('please input the gap of subcarriers: ');
        win = input('please input the window of samples: ');
        input_cap = input('please input the sample capacity: ');
        count_loc = input('please input the number of location: ');
        ap_n = input('please input the number of ap');
        if(isempty(gap&win&input_cap) == 0)
            break
        end
        fprintf('----------please input the data again----------');
    end
    pre_path = './CSI_data/7.16/AP_'
    suffix_path = '.dat';
    
    csi_data = [];
    csi_vector_label = [];
    for j=1:ap_n
        csi_data_t = [] ;
        for i=1:count_loc
            label = i ;
            location = sprintf('%s%d/locations_%d%s',pre_path, j, i,suffix_path);
            [CSI_vector_temp, CSI_vector_label_t] = CSI_SampleMatrix(location, input_cap, label, gap ,win);
            csi_data_t = [csi_data_t; CSI_vector_temp];
            %form a corresponding label list
            if(j == 1)
                csi_vector_label = [csi_vector_label; CSI_vector_label_t];
            end
        end
        csi_data = [csi_data,csi_data_t];
    end
    %% caculate the misclassifying error
    csi_train_vector = csi_data(:,1);
    csi_train_label_cell = cellstr(num2str(csi_vector_label));

    %% 10-fold cross validator

    class_error = k_nearest(csi_train_vector, csi_train_label_cell);
    fprintf('class_error is: %f\n', class_error);

