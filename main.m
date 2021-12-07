% Project

set(groot,'defaultfigureposition',[400 250 900 750])

Run_SA_vs_GA();

%Run_GA_vs_Bruteforce();

function Run_GA_vs_Bruteforce()
    [~, distances] = GeneticAlgorithm(8);
    
    figure(2)
    plot(distances);
    grid
    
    distances = BruteForce(8);
    
    figure(4)
    plot(distances);
    grid

end

function Run_SA_vs_GA()
    [~, distances] = GeneticAlgorithm(20);
    
    SimulatedAnnealing(20);
    
    figure(3)
    plot(distances);
    grid
end