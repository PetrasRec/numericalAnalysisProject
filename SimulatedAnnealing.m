

function bestDistance = SimulatedAnnealing(cityCount) 
    [ graph ]  = createGraph(cityCount);
    nVar = graph.n;
    A.position = randperm(nVar);
    A.cost = fitnessFunction ( [A.position,  A.position(1)]  , graph);

    figure 
    set(gcf,'position' , [50,50,700,700])
    subplot(2,2,1)
    drawGraph( graph); 

    T0=1;    
    T=T0;
    alphaa=0.99;  
    maxIteration = 1000;
    figure(2);
    bestFitness = inf;
    bestTour = [];
    fitness_hist = 0;
    bestDistance = inf;
    for t = 1 : maxIteration

        fitness_hist(t) = A.cost;

        B.position=createNeighbour(A.position);
        B.cost = fitnessFunction ( [B.position,  B.position(1)] , graph);

        Delta = A.cost - B.cost;
        if Delta < 0  % uphill move (good move)
            A.cost = B.cost;
            A.position = B.position;
        else % downhill move (bad move)
            P=exp(-Delta/T);
            if rand<=P
                A.cost = B.cost;
                A.position = B.position;
            end
        end

        T=alphaa*T;


        outmsg = [ 'Iteration #' , num2str(t) , ' Shortest length = ' , num2str(A.cost)  ];
        disp(outmsg)
        subplot(2,2,2)
        title(['Iteration #' , num2str(t) ])

        cla
        drawBestTour( A.position, graph );


        subplot(2,2,[3 4]);
        plot(fitness_hist)
        xlabel('Iteration')
        ylabel(sprintf('-Best tour length %.2f', A.cost))

       drawnow
       if A.cost < bestDistance
           bestDistance = A.cost;
       end
    end
end
