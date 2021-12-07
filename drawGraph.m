function [   ]  = drawGraph( graph )

hold on 
for i = 1 : graph.n - 1
    for j =  i+1 : graph.n
    
        x1 = graph.node(i).lat;
        y1 = graph.node(i).lng;
        
        x2 = graph.node(j).lat;
        y2 = graph.node(j).lng;
        
        X = [x1 , x2]; 
        Y = [y1 , y2];
        
        plot( X , Y , '-k');
    end
end
for i = 1 : graph.n
    X = [graph.node(:).lat];
    Y = [graph.node(:).lng ];
    plot(X,Y, 'ok', 'MarkerSize', 10, 'MarkerEdgeColor' , 'r' , 'MarkerFaceColor' , [ 1, 0.6 , 0.6]);
end
title ('Al nodes and edges')
box('on')
end