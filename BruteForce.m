

function [bestCities, distances] = BruteForce(cityNames)
    cities = readCityData(cityNames);
   
    bestDistance = intmax;
    bestCities = [];
    iteration = 0;
    
    allIterations = factorial(size(cities, 1));
    distances = zeros(allIterations, 1);
    
    function DFS(leftOptions, currentPath)
        optionSize = size(leftOptions, 2);
        if optionSize == 0
           % Evaluate the solution
            currentSolution = cities(currentPath,:);
            totalDistance = CalculateTotalDistance(currentSolution);
            distances(iteration + 1) = totalDistance;
            if totalDistance < bestDistance
                bestDistance = totalDistance;
                bestCities = currentSolution;
                DrawMapSouthKorea(bestCities, 1, sprintf("distance: %.2f | %d/%d", bestDistance, iteration, allIterations));
            end
            iteration = iteration + 1;
        else
            for i=1:optionSize
                newPath = [currentPath leftOptions(i)];
                newOptions = leftOptions;
                newOptions(i) = [];
                DFS(newOptions, newPath);
            end
        end
        
    end
    
    DFS(1:size(cities, 1), []);
    disp("heehehe");
    DrawMapSouthKorea(bestCities, 1, sprintf("distance: %.2f | %d/%d", bestDistance, iteration, allIterations));
end