

function populations = generateSeedPopulations(populationSize, cityCount)
    initialPop = readCityData(cityCount);
   
    populations = cell(populationSize, 1);
    shuffle = @(v) v(randperm(size(v, 1)), :);

    for i=1:populationSize
        initialPop = shuffle(initialPop);
        state = State(initialPop);
        populations{i} = state;
    end
end