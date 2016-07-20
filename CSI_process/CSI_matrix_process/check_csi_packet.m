function [ flag ] = check_csi_packet(csi_packet)
%CHECK_CSI_PACKET is to judge whether a packet is correct
    flag = false ;
    % judge whether the nc and csi_len is proper
    if (getfield(csi_packet, 'nc') ~= 2 ) |...
            (getfield(csi_packet, 'csi_len') == 0 )
        return ;
    else 
        CSIofMatrix = getfield(csi_packet, 'csi');
    end
        subcarrier = size(CSIofMatrix, 3);
    % judge if the subcarrier is correct
    if(subcarrier ~= 114)
        return ;
    end
    flag = true ;
end

