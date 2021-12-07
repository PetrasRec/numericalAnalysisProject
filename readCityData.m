

function [T] = readCityData(cityCount)
    T = readtable("worldcities.csv");
    % Filter table
    %  & ismember(T.city_ascii, filterCities)
    T = T(T.country == "Korea, South" , 2:4);
    T = T(1:cityCount, :);
    size(T)
end