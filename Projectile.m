function [MaxH, ImpactT] = Projectile(Vo, Th, yo) 
% This function computes the maximum height reached by a projectile and the
% time to impact.  Inputs are initial velocity, launch angle and initial 
% height % Usage: [MaxH ImpactT] = Projectile(10,45,5) 

if Vo < 0 || Th < 0 || Th > 90 || yo < 0     
    
    error('Inputs cannot be negative and launch angle cannot exceed 90 deg'); 

end 
 
g = 9.81; 
Tmax = Vo*sind(Th)/g; 
MaxH = -1/2*g*Tmax^2 + Vo*sind(Th)*Tmax + yo; 

ImpactT = Vo*sind(Th)/g + 1/g*sqrt((Vo*sind(Th))^2+2*g*yo);   

t = 0:ImpactT/100:ImpactT; 
y = -1/2*g*t.^2 + Vo*sind(Th)*t + yo;   

% Plotting 
plot(t(1),y(1),'k*'); 
xlabel('Time (s)'); 
ylabel('Height (m)'); 
title('Projectile Height'); 
xlim([0 ImpactT]); 
ylim([0 MaxH]); 
hold on 
pause(ImpactT/100);   

for k = 2:length(t)     
    
    plot(t(k),y(k),'k*');     
    pause(ImpactT/100); 

end

end