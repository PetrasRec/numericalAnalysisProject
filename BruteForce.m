

function [bestCities, distances] = BruteForce(cities)

    function DFS(leftOptions, currentPath)
        optionSize = size(leftOptions, 1);
        if optionSize == 0
           % Evaluate the solution
        
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
end