


function d = getDistance(a_lat, a_lng, b_lat, b_lng)
    d = deg2km(distance('gc', [a_lat a_lng], [b_lat b_lng]));

    %{
    R = 6378.137;
    % pi - 180
    % x  - deg
    % x = pi * deg / 180
    toRadians = @(angle) (pi * angle) / 180;
    
    a_lat = toRadians(a_lat);
    a_lng = toRadians(a_lng);

    b_lat = toRadians(b_lat);
    b_lng = toRadians(b_lng);

    d_lat = b_lat - a_lat;
    d_lng = b_lng - a_lng;

    a = sin(d_lat / 2)^2 + ...
        cos(a_lat) * cos(b_lat) + ...
        sin(d_lng / 2)^2;

    c = 2 * atan2(sqrt(a), sqrt(1-a));

    d = c * R;
%}
end


%{

function d = getDistance(a_lat, a_lng, b_lat, b_lng)
    R = 6371;
    toRadians = @(angle) (pi / 180) * angle;
    
    a_lat = toRadians(a_lat);
    a_lng = toRadians(a_lng);

    b_lat = toRadians(b_lat);
    b_lng = toRadians(b_lng);

    x = (b_lat - a_lat) * cos((a_lng + b_lng) / 2);
    y = b_lng - a_lng;
    d = sqrt(x*x + y*y) * R;
end
%}