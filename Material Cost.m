clc
clear

% The total amount of each material required to make 1000 tons of each alloy
Composition = [4.4,1.5,.6,0,0;0,1,0,.6,0;0,1.4,0,0,4.5;1.6,2.5,0,0,5.6;0,.3,0,7,0]; 
Alloy = 10*ones(1,5); 
Raw_Material = Alloy * Composition

% The total cost for that amount of each material
Cost = [3.17 1.3 1.05 0.77 0.84];
Total_Cost_Per_Material = Cost .* Raw_Material

% The total cost to make the 1000 tons for each alloy
Total_Cost = sum(Total_Cost_Per_Material)

% The most and least expensive alloys
Most_Expensive = max(Total_Cost_Per_Material)
Least_Expensive = min(Total_Cost_Per_Material)


