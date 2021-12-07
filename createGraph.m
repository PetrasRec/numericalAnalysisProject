function [ graph ]  = createGraph(cityCount)
    cities = readCityData(cityCount);
    lat = cities.lat;
    lng = cities.lng;
    city_ascii = cities.city_ascii;
    graph.n = size(cities, 1);
    for i = 1 : graph.n
        graph.node(i).lat = lat(i);
        graph.node(i).lng = lng(i);
        graph.node(i).city_ascii = city_ascii(i);
    end
    graph.edges = zeros(  graph.n , graph.n );
    for i = 1 : graph.n
        for j = 1: graph.n
            lat1 = graph.node(i).lat;
            lat2 = graph.node(j).lat;
            lng1 = graph.node(i).lng;
            lng2 = graph.node(j).lng;

            graph.edges(i,j) = getDistance(lat1, lng1, lat2, lng2);

        end
    end
end