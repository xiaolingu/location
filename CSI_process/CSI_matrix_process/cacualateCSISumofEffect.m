function [ CSISumofEffect ] = cacualateCSISumofEffect( csi_trace )
% sum of csi in one packet 
    CSISumofEffect = [] ;
    for indexofStructure = 1: size(csi_trace)
            StructureOfparameter = csi_trace{indexofStructure , 1};
            if (getfield(StructureOfparameter, 'nc') ~= 2 ) |...
                    (getfield(StructureOfparameter, 'csi_len') == 0 )
                continue
            else 
                CSIofMatrix = getfield(StructureOfparameter, 'csi');
                CSIeffect = CaculateCSIeffect(CSIofMatrix);
                CSISumofEffect = [CSISumofEffect; CSIeffect];   
            end   
    end  
    
function [ OneCSIeffect ] = CaculateCSIeffect( CSIofMatrix )
    CSIofMatrixTemp = CSIofMatrix ;
    OneCSIeffect = 0.0 ;
    carrier =  size(CSIofMatrixTemp, 2) ;
    for IndexOfCSIofMatrix = 1:carrier ;
        OneCSIeffect = CaculateOneEffect(CSIofMatrixTemp(:,:,IndexOfCSIofMatrix)) + OneCSIeffect;
    end
    


