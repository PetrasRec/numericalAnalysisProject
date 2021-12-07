
function [bestCities, distances] = GeneticAlgorithm(cityCount)
    populationSize = 50;
    iterations = 400;
    elites = 10;
    mutationRate = 6.0;
    generations = 0;
   
    population = generateSeedPopulations(populationSize, cityCount);
    population{1}.fitness = intmax;
    bestSolution = population{1};
    
    preAllocatedArrayOfPopulation = cell(populationSize, 1);
    
    function [population, totalDistance, bestDistance] = updateFitness(population)
        totalDistance = 0;
        bestDistance = intmax;
        for i=1:size(population, 1)
           population{i}.fitness = CalculateTotalDistance(population{i}.cities);
           if bestSolution.fitness > population{i}.fitness
              bestSolution = population{i};
              DrawMapSouthKorea(bestSolution.cities, 1, sprintf("Best distance found: %.2f | Generation: %d", population{i}.fitness, generations));
           end
           
           if population{i}.fitness < bestDistance
               bestDistance = population{i}.fitness;
           end
           population{i}.fitness = 1.0 / population{i}.fitness;
           totalDistance = totalDistance + population{i}.fitness;
        end
    end

    function breed = selectBreed(population)
       	index = 1;
	    r = generateRandNumber(0, 99) + 1;
        while (r > 0)
            r = r - population{index}.fitness;
            index = index + 1;
        end
        index = index - 1;

        breed = population{index}; 
    end

    function population = normalizeFitness(population, totalDist)
        for i=1:size(population, 1)
           population{i}.fitness = population{i}.fitness / totalDist * 100;
        end
    end

    function mutatedSpecimen = mutate(specimen, mutationRate)
        citiesSize = size(specimen.cities, 1);
        for i=1:citiesSize
            if generateRandNumber(1, 100) <= mutationRate
                index = floor(generateRandNumber(1, citiesSize));
                specimen.cities([i index], :) = specimen.cities([index i], :);
            end
        end
        mutatedSpecimen = specimen;
    end

    function newBreed = crossOver(a, b)
        citiesCount = size(a.cities, 1);
        
        startIndex = floor(generateRandNumber(1, citiesCount)) + 1;
        l = floor(generateRandNumber(1, citiesCount));
        names = cell(l, 1);

        % From startIndex till startIndex + l is picked from a
        % The rest is picked from b
        aCitiesNames = a.cities.city_ascii;
        idx = 1;
        while l > 0
            names{idx} = char(aCitiesNames(startIndex));
            idx = idx + 1;
            startIndex = mod(startIndex + 1, citiesCount + 1);
            l = l - 1;
            if startIndex == 0
                startIndex = 1;
            end
        end
        
        newBreed = a.cities;
        bCitiesNames = b.cities.city_ascii;
        
        for i=1:citiesCount
            if ~any(strcmp(names, bCitiesNames(i)))
                newBreed(startIndex,:) = b.cities(i,:);
                startIndex = mod(startIndex + 1, citiesCount + 1);
                if startIndex == 0
                    startIndex = 1;
                end
            end
        end
        
    end


    function newPopulation = nextGeneration(population)
        % first x is elites, best breeds
        allFitnesses = zeros(size(population, 1), 1);
        for i=1:populationSize
           allFitnesses(i) = population{i}.fitness; 
        end
        [~, indexes] = sort(allFitnesses, "descend");
        
        for i=1:elites - 1
            preAllocatedArrayOfPopulation{i} = population{indexes};
        end
        
        for i=elites:populationSize
            a = selectBreed(population);
            b = selectBreed(population);

            c = State(crossOver(selectBreed(population), selectBreed(population)));
            % mutate selected breed
            newChild = mutate(c, mutationRate);
            
            preAllocatedArrayOfPopulation{i} = newChild;
        end
        newPopulation = preAllocatedArrayOfPopulation;
    end
    
    distances = zeros(iterations, 1);
    dIndex = 1;
    while iterations > 0
        generations = generations + 1;
        [population, totalDist, bestGenDist] = updateFitness(population);
        population = normalizeFitness(population, totalDist);
        population = nextGeneration(population);
        iterations = iterations - 1;
        distances(dIndex) = bestGenDist;
        dIndex = dIndex + 1;
    end
    
    
    DrawMapSouthKorea(bestSolution.cities, 1, sprintf("Best distance found: %.2f | Generation: %d", bestSolution.fitness, generations));
    bestCities = bestSolution.cities;
end