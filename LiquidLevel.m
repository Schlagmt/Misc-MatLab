clear; close all; clc; commandwindow; 

DeltaT = input('Value for DeltaT: '); 
r = 5; 
D = 0.2; 

Level(1) = 12;  % Initial Liquid Level 

Volume = pi*r^2*Level(1); % Initial Volume in ft^3 

Flow_Out = pi*(D/2)^2*sqrt(2*32.2*(Level(1)- D/2)); % Initial Flow Rate ft^3/sec 

k = 1; 

while Level(k) > D     
    
    Volume = Volume - Flow_Out*DeltaT;     
    Level(k + 1) = Volume/(pi*r^2);     
    Flow_Out = pi*(D/2)^2*sqrt(2*32.2*(Level(k + 1)- D/2));       
    k = k + 1; 

end

t = 0:DeltaT:(length(Level)-1)*DeltaT; 

plot(t,Level,'k-','LineWidth',2); 
xlabel('time (sec)'); 
ylabel('Liquid Level (ft)'); 
title('Liquid Level in Tank') 

fprintf('Final Time:  %0.1f seconds \n',t(end)); 
fprintf('Final Liquid Level: %0.2f ft \n',Level(end));