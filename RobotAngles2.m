function [ Th, N, RMS ] = RobotAngles(xg,yg,L1,L2,Th1,Th2) 
%This function uses the Newton Raphson Algorithm so solve for the base and 
%joint angles which would place the robot gripper at a desired position 
% Inputs: desired gripper position (xg,yg); Link Lengths (L1,L2)  
% Initial guess for base and joint angles (Th1, Th2) 
% Usage: [Th, N] = RobotAngles(2,6,9,3,50,-45) 

close all; 

if sqrt(xg^2+yg^2)> L1+L2 || sqrt(xg^2+yg^2)<abs(L1-L2)     
    
    error('Gripper Position cannot be reached'); 

end   Th = [Th1; Th2]; 

f = [L1*cosd(Th1)+L2*cosd(Th1+Th2)-xg;L1*sind(Th1)+L2*sind(Th1+Th2)-yg]; 
N = 0;   % Iteration Counter 
k = 1;   % Index for Vectors 
RMS = sqrt(sum(f.^2)/2); 
 
while RMS > 0.01 && N < 1000     
    
    J = [-L1*sind(Th(1))-L2*sind(Th(1)+Th(2)) L2*sind(Th(1)+Th(2)); L1*cosd(Th(1))+L2*cosd(Th(1)+Th(2)) L2*cosd(Th(1)+Th(2))]; 
 
    if abs(det(J)) >= 0.1         
        
        Th = Th - inv(J)*f;     
    
    else
        
        Th = Th - 1;     
    
    end
    
    f = [L1*cosd(Th(1))+L2*cosd(Th(1)+Th(2))-xg;L1*sind(Th(1))+L2*sind(Th(1)+Th(2))-yg];     
    k = k + 1;     
    Th1(k) = Th(1);    
    Th2(k) = Th(2);     
    RMS = sqrt(sum(f.^2)/2);     
    N = N + 1;   

end

% Plot 1: Robot Arm at Final Position 
xj = L1*cosd(Th(1));  
yj = L1*sind(Th(1)); 
plot(xg,yg,'r*',[0 xj],[0 yj],'k-',[xj xj + L2*cosd(Th(1)+Th(2));],[yj yj + L2*sind(Th(1)+Th(2))],'k','LineWidth',4); 
title('2-Link Robot')
 
% Plot 2: Base Angle Estimates for each Iteration figure 
plot(0:N,Th1,'k-','LineWidth',2);  
xlabel('Iterations'); 
ylabel('Base Angle (deg)');  
title('Base Angle Estimates') 
 
% Plot 3: Joint Angle Estimates for each Iteration figure 
plot(0:N,Th2,'k-','LineWidth',2);  
xlabel('Iterations'); 
ylabel('Joint Angle (deg)');  
title('Joint Angle Estimates');  

end 