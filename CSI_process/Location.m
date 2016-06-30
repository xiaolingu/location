function [LocationStruct, LocationPure] =  Location(datapath)
    LocationPure = csvread(datapath);
    [row, col] = size(LocationPure)
    for i = 1:row
        for j = 1:col
            if(j == 1)
                LocationStruct(i).x = LocationPure(i, j); 
            end
            
            if(j == 2)
                LocationStruct(i).y = LocationPure(i, j);
            end
            
            if(j == 3)
                LocationStruct(i).label = LocationPure(i, j);
            end
        end
    end
end