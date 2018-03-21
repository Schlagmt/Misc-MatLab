clc
clear
T = 0:0.0001:.2;
A = input('Insert a value for the Initial Displacement of Mass (m) (how much spring is compressed initially)');
K =	input('Insert a value for the Spring Constant (N/m)');
M =	input('Insert a value for the Mass of suspended mass and spring (kg)');
f = sqrt(K/M)/2*pi;
fprintf  ('The frequency of oscillation = %f (Hz)', f)
V = -A * sqrt(K/M) * sin(sqrt(K/M) * T);
P = A * cos(sqrt(K/M) * T);
KE = (1/2) * M * V.^2;
PE = (1/2) * K * P.^2;

subplot(2,2,1)
plot(T,V)
xlabel( 'Time (s)' ); 
ylabel( 'Velocity (m/s)' );
title( 'Velocity v. Time' ); 

subplot(2,2,2)
plot(T,P)
xlabel( 'Time (s)' ); 
ylabel( 'Position (M)' );
title( 'Position v. Time' ); 

subplot(2,2,3)
plot(T,KE)
xlabel( 'Time (s)' ); 
ylabel( 'Kenetic Energy (J)' );
title( 'Time v. Kenetic Energy (J)' ); 

subplot(2,2,4)
plot(T,PE)
xlabel( 'Time (s)' ); 
ylabel( 'Potential Energy (J)' );
title( 'Time v. Potential Energy (J)' ); 

