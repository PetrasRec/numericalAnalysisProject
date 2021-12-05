

%geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage],'g-*')
%geolimits([45 62],[-149 -123])


function DrawMapSouthKorea(cities)
    finishIndex=(size(cities, 1) - 1) 
    for i=1:finishIndex
        A = cities(i,:);
        B = cities(i + 1,:);
        geoplot([A.lat B.lat], [A.lng B.lng], "g-*")
        text(A.lat, A.lng, A.city_ascii)
        if i == 1
            hold on
        elseif i==finishIndex
            text(B.lat, B.lng, B.city_ascii)
            geoplot([cities(1,:).lat cities(i + 1,:).lat], [cities(1,:).lng cities(i + 1,:).lng], "g-*")
        end
    end
    hold off
end