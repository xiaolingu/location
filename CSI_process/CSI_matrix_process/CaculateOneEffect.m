function [CSIeffect] = CaculateOneEffect(MinMatrix)
    MinMatrixTemp = MinMatrix ;
    MagnitudeMatrix = abs(MinMatrixTemp);
    CSIeffect = sum(sum((MagnitudeMatrix.^2))) ;
