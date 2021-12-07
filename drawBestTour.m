function [ ] = drawBestTour(currentSolution , graph)
currentSolution = [currentSolution , currentSolution(1)];
hold on
for i = 1 : length(currentSolution) - 1
    
    currentNode = currentSolution(i);
    nextNode =  currentSolution(i+1);
    
    x1 = graph.node(currentNode).lng;
    y1 = graph.node(currentNode).lat;
    
    x2 = graph.node(nextNode).lng;
    y2 = graph.node(nextNode).lat;
    
    X = [x1 , x2];
    Y = [y1, y2];
    plot (X, Y, '-r');
end
for i = 1 : graph.n
    
    X = [graph.node(:).lng];
    Y = [graph.node(:).lat];
    
    plot(X, Y, 'ok', 'markerSize' , 10 , 'MarkerEdgeColor' , 'r' , 'MarkerFaceColor', [1, 0.6, 0.6]);
end
title('Best tour')
box('on');