function [Magnitude,Angle] = ResultantForce(N) 
% This function takes any number of forces entered by the user and computes 
% the resultant force.  Forces can be in polar or rectangular form or a mix 
% Useage [Magnitude Angle] = ResultantForce(N) where N = Number of Forces 

clc;
commandwindow; 

X = zeros(1,N); % X component vector 
Y = zeros(1,N); % Y component vector   

% Prompt for Forces 

for k = 1:N     
    
    Form = menu('Force is in:','Rectangular Form','Polar Form');     
    switch Form         
        case 1 % Rectangular Form             
            
            X(k) = input('Enter the x-component: ');             
            Y(k) = input('Enter the y-component: ');             
            fprintf('X-Component = %0.5f and Y-Component = %0.5f \n',X(k),Y(k));             
            correct = input('Is this correct?  1 = Yes and 0 = No ');             
            
            while correct == 0                 
                
                X(k) = input('Enter the x-component: ');                 
                Y(k) = input('Enter the y-component: ');                 
                fprintf('X-Component = %0.5f and Y-Component = %0.5f \n',X(k),Y(k));                 
                correct = input('Is this correct?  1 = Yes and 0 = No ');                          
            
            end
            
        case 2 % Polar Form             
            
            Mag = input('Enter the magnitude of the Force: ');             
            Ang = input('Enter the angle of the Force (deg): ');             
            fprintf('Magnitude = %0.5f and Angle = %0.5f \n',Mag,Ang);             
            correct = input('Is this correct?  1 = Yes and 0 = No ');             
            
            while correct == 0                 
                
                Mag = input('Enter the magnitude of the Force: ');                 
                Ang = input('Enter the angle of the Force (deg): ');                 
                fprintf('Magnitude = %0.5f and Angle = %0.5f \n',Mag,Ang);                 
                correct = input('Is this correct?  1 = Yes and 0 = No ');             
            
            end
            
            X(k) = Mag*cosd(Ang);             
            Y(k) = Mag*sind(Ang);                 
    
    end
    
end

% Calculate Resultant Force 
X_Total = sum(X); 
Y_Total = sum(Y); 
Magnitude = sqrt(X_Total^2+Y_Total^2); 

if X_Total < 0
    
    Angle = atand(Y_Total/X_Total)+180; 

else
    
    Angle = atand(Y_Total/X_Total); 

end

% Now Plot the Forces 

plot([0 X_Total],[0 Y_Total],'k-')  % Resultant Force 
title('Individual Forces and Resultant Force'); 
xlim([min([X_Total X]) max([X_Total X])]); 
ylim([min([Y_Total Y]) max([Y_Total Y])]); 
hold on 

for k = 1:N     
    
    plot([0 X(k)],[0 Y(k)],'r--')    

end

end