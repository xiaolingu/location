function [ CSI_of_Seq ] = CacluateCSIFieldSeq( csi_trace,field )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    CSI_of_Seq= [] ;
    for indexofStructure = 1: size(csi_trace)
        StructureOfparameter = csi_trace{indexofStructure , 1};
        CSI_of_field = getfield(StructureOfparameter, field);
        CSI_of_Seq = [CSI_of_Seq; CSI_of_field];
    end   
end


