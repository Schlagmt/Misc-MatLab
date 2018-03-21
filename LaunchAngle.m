y0 = 10; 
t = 25; 
g = 9.81; 

syms V0 Th 

y = -1/2*g*t^2 + V0*sin(Th)*t + y0; 
x = V0*cos(Th)*t; 
Soln = solve(y == 250, x == 2000,V0,Th); 
InitialVelocity = double(Soln.V0) ;
LaunchAngle = double(Soln.Th)*180/pi;

fprintf ('Initial Velocity = %f',InitialVelocity);
fprintf ('Launch Angle = %f',LaunchAngle);

