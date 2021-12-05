
classdef State
    properties
       cities = []
       fitness = 0;
    end
    methods
        function obj = State(cities)
            obj.cities = cities;
        end
    end
end
