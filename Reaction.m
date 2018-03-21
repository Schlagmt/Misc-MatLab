function [ ReactionRate DecompTime ] = Reaction( A, Ea, T, Co ) 
% This function calculates the reaction rate and decomposition time for a 1st % order reaction given the frequency factor, A (Hz), activation energy,  
% Ea (J/mol), absolute temperature, T (K). % Function also plots concentration vs. time based on initial % concentration, Co (M).   
% USAGE:  >> [ReactionRate DecompTime] = Reaction(1e11,7.5e4,325,10)   

ReactionRate = A*exp(-Ea/(8.314*T)); 
DecompTime = 5/ReactionRate;  

t = 0:DecompTime/100:DecompTime; 
Conc = Co*exp(-ReactionRate*t); 

plot(t,Conc,'k-','LineWidth',2);  
xlabel('time (sec)'); 
ylabel('Concentration (M)'); 
title('Concentration of Hydrogen Peroxide'); 

end
