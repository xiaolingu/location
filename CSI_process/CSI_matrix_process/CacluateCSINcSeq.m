function [ CSIofNcSeq ] = CacluateCSINcSeq( csi_trace )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    CSIofNcSeq = [] ;
    for indexofStructure = 1: size(csi_trace)
        StructureOfparameter = csi_trace{indexofStructure , 1};
        CSIofNc = getfield(StructureOfparameter, 'nc');
        CSIofNcSeq = [CSIofNcSeq; CSIofNc];
    end   
end


