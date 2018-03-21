clc
clear
Vo =  input ('Insert a value for the Initial Velocity of Projectile (m/s)');
LA = input ('Insert a value for the Launch Angle (degrees)');
Yo = input ('Insert a value for the Initial height of the projectile (m)');
G = 9.81;
T = 0:.001:1.960;
TMAX = Vo * sin(LA)/G;
YMAX = -.5 * G * T.^2 + Vo * sind(LA) * T + Yo;
TIMPACT = (Vo * sind(LA)/ G) + (sqrt((Vo * sind(LA)).^2 * G * Yo) / G)
fprintf('The time of maximum height = %f , The height at maximum height = %f , The time of impact = %f' ,TMAX,YMAX,TIMPACT);

plot (T,YMAX)
xlabel( 'Time (s)' ); 
ylabel( 'Maximum Height (M)' );
title( 'Velocity v. Time' ); 


