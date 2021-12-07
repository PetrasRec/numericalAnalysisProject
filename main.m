% Project

set(groot,'defaultfigureposition',[400 250 900 750])

%{
%cities = ["Seoul" "Busan", "Sokcho", "Jeju", "Jeonju", "Incheon", "Daegu", "Andong"];
cities = ["Seoul" "Busan", "Sokcho", "Jeju", "Jeonju", "Incheon", "Daegu", "Andong", "Daejeon", "Gwangju", "Suwon", "Jeosu", "Hanam", "Yeosu", "Paju", "Gimpo", "Pohang", "Osan", "Mokpo"];

cities = ["Seoul" "Busan", "Sokcho", "Jeju", "Jeonju", "Incheon", "Daegu", "Andong", "Daejeon",  "Gwangju", "Suwon", "Jeosu", "Hanam", "Paju", "Gimpo", "Pohang", "Osan", "Mokpo"];


[bestSolution, distances] = GeneticAlgorithm(cities);

figure(2)
plot(distances);
grid
%}
[~, distances] = BruteForce([]);

figure(3)
plot(distances);
grid

[bestSolution, distances] = GeneticAlgorithm([]);


figure(4)
plot(distances);
grid