function [ ] = DampedHarmonic(deltaT) 
% Estimates velocity and acceleration from position measurements 
% Usage: DampedHarmonic(0.5) uses a deltaT of 0.5 seconds 
% Position Data and Plot close all; 

t_meas = 0:deltaT:20; 
pos_meas = exp(-0.25*t_meas).*cos(4*t_meas); 
t_act = 0:0.001:20; 
pos_act = exp(-0.25*t_act).*cos(4*t_act); 

plot(t_meas,pos_meas,'r*',t_act,pos_act,'k-'); 
xlabel('Time (sec)');  
ylabel('Position (cm)'); 
title('Position of Object'); 
legend('Position Data','Actual Position');   

% Velocity Estimate using 2PT Reverse 
vel_est = zeros(1,length(pos_meas)); 

for k = 2:length(pos_meas)     

    vel_est(k) = (pos_meas(k)-pos_meas(k-1))/deltaT; 

end

vel_act = -0.25*exp(-0.25*t_act).*cos(4*t_act)-4*exp(0.25*t_act).*sin(4*t_act); 

figure; 
plot(t_meas,vel_est,'r*',t_act,vel_act,'k-'); 
xlabel('Time (sec)');  
ylabel('Velocity (cm/s)'); 
title('Velocity of Object'); 
legend('Velocity Estimates (2PT)','Actual Velocity');   

% Acceleration Estimate 

acc_est = zeros(1,length(pos_meas)-1); 

for k = 2:length(pos_meas)-1     
    
    acc_est(k) = (pos_meas(k+1)-2*pos_meas(k)+pos_meas(k1))/deltaT^2;

end

acc_act = -255/16*exp(-0.25*t_act).*cos(4*t_act) + 2*exp(0.25*t_act).*sin(4*t_act); 

figure; 
plot(t_meas(1:end-1),acc_est,'r*',t_act,acc_act,'k-'); 
xlabel('Time (sec)');  
ylabel('Acceleration (cm/s^2)'); 
title('Acceleration of Object'); 
legend('Acceleration Estimate','Actual Acceleration');   

end
