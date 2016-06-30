function [ csi_feature_matrix ] = caculateCSIvector( csi_trace , gap )
% caculateCSIvector include one csi vector and joint the csi vectors
    csi_feature_matrix = [];
    for indexofStructure = 1: size(csi_trace)
            csi_vector = [];
            StructureOfparameter = csi_trace{indexofStructure , 1};
            if (getfield(StructureOfparameter, 'nc') ~= 2 ) |...
                    (getfield(StructureOfparameter, 'csi_len') == 0 )
                continue
            else 
                CSIofMatrix = getfield(StructureOfparameter, 'csi');
            end
                subcarrier = size(CSIofMatrix, 3);
            % judge if the subcarrier is correct
            if(subcarrier ~= 114)
                continue
            end
            for i = 1:gap:subcarrier
                csi_vector = [csi_vector , CaculateOneEffect(CSIofMatrix(:,:,i))];
            end
      csi_feature_matrix = [csi_feature_matrix;csi_vector];          
    end  
end

