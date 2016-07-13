function [ csi_feature_matrix ] = caculateCSIvector( csi_trace , gap )
% caculateCSIvector include one csi vector and joint csi vectors
    csi_feature_matrix = [];
    start_index = 1;
    for indexofStructure = 1: size(csi_trace)
            csi_vector = [];
            StructureOfparameter = csi_trace{indexofStructure , 1};
            % judge whether the nc and csi_len is proper
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
            
%%            choose value into a vector without average            
%             for i = start_index:gap:subcarrier
%                 csi_vector = [csi_vector , CaculateOneEffect(CSIofMatrix(:,:,i))];
%             end

%%            form a vector in average of csi
            rangenumber = subcarrier / gap ;
            for i = 1:rangenumber
                csi_vector = [csi_vector, avercsi((i-1)*gap+1, i*gap, CSIofMatrix)];
            end
      csi_feature_matrix = [csi_feature_matrix;csi_vector];          
    end  
end


function [CSItemp] = avercsi(s, e, CSIofMatrix)
    CSItemp = 0 ;
    if(s == e)
        CSItemp = CaculateOneaverCSI(CSIofMatrix(:,:,s));
    else
        for i = s:e
            CSItemp = CSItemp + CaculateOneaverCSI(CSIofMatrix(:,:,i));
        end
        CSItemp = CSItemp /(e - s + 1);
    end
    
end
