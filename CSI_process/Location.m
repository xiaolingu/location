function [LocationMap, LocationPure] =  Location(datapath)
    LocationPure = csvread(datapath);
    LocationMap = [] ;
    row = size(LocationPure,1);
    if(row < 1)
        return 
    end
    for i = 1:row
        keyset = i;
        keyvalue = struct('x',LocationPure(i,2),'y',LocationPure(i,3));
        loc_temp = containers.Map(keyset, keyvalue);
        LocationMap = [LocationMap;loc_temp];
    end
end