function [average_Matrix] = winSample( CSI_feature_matrix, win )
%WINSAMPLE : select Matrix in n size by setting WindowSize
    average_Matrix = [];
    [csi_height, csi_width] = size(CSI_feature_matrix);
    if csi_height < win
        error('window is larger than csi_width, error');
    end
    
    counts = fix(csi_height / win) ;
  
    for i = 1:counts
        average_Matrix = [average_Matrix; sum(CSI_feature_matrix((i-1)*win + 1:i*win,:))/win];
    end
    
    if mod(csi_height, win) == 0
    
    else
        ret = csi_height - win * counts ;
        average_matrix = [average_Matrix; sum(CSI_feature_matrix(counts*win + 1:end,:), 1)/ret];
    end
    
end

