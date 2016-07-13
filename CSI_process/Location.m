function [LocationMap, LocationPure] =  Location(datapath)
    LocationPure = csvread(datapath);
    [row, col] = size(LocationPure)
        keyset = [LocationPure(1,1)];
        keyvalue = struct('x',LocationPure(1,2),'y',LocationPure(1,3));
        LocationMap = containers.Map(keyset, keyvalue);
    if(row <= 1)
        return 
    end
    for i = 2:row
        keyset = [i];
        keyvalue = struct('x',LocationPure(i,2),'y',LocationPure(i,3));
        loc_temp = containers.Map(keyset, keyvalue);
        LocationMap = [LocationMap;loc_temp];
    end
end