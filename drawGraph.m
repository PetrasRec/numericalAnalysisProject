function [   ]  = drawGraph( graph )

hold on 
for i = 1 : graph.n - 1
    for j =  i+1 : graph.n
    
        x1 = graph.node(i).lng;
        y1 = graph.node(i).lat;
        
        x2 = graph.node(j).lng;
        y2 = graph.node(j).lat;
        
        X = [x1 , x2]; 
        Y = [y1 , y2];
        
        plot( X , Y , '-k');
    end
end
for i = 1 : graph.n
    X = [graph.node(:).lng];
    Y = [graph.node(:).lat ];
    plot(X,Y, 'ok', 'MarkerSize', 10, 'MarkerEdgeColor' , 'r' , 'MarkerFaceColor' , [ 1, 0.6 , 0.6]);
end
title ('Al nodes and edges')
box('on')
end