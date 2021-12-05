% Project


%cities = ["Seoul" "Busan", "Sokcho", "Jeju", "Jeonju", "Incheon", "Daegu", "Andong"];
cities = ["Seoul" "Busan", "Sokcho", "Jeju", "Jeonju", "Incheon", "Daegu", "Andong", "Daejeon", "Gwangju", "Suwon", "Jeosu", "Hanam", "Yeosu", "Paju", "Gimpo", "Pohang", "Osan", "Mokpo"];

cities = ["Seoul" "Busan", "Sokcho", "Jeju", "Jeonju", "Incheon", "Daegu", "Andong", "Daejeon",  "Gwangju", "Suwon", "Jeosu", "Hanam", "Paju", "Gimpo", "Pohang", "Osan", "Mokpo"];

[bestSolution, distances] = GeneticAlgorithm(cities);
figure(1)
plot(distances);
grid
figure(2)
DrawMapSouthKorea(bestSolution)
grid