


function distance = CalculateTotalDistance(cities)
    distance = 0; 
    lat = cities.lat;
    lng = cities.lng;
    for i=1:size(cities, 1)
        if i < size(cities, 1)
            distance = distance + getDistance(lat(i), lng(i), lat(i + 1), lng(i + 1));
        else
            distance = distance + getDistance(lat(1), lng(1), lat(i), lng(i));
        end
    end
end