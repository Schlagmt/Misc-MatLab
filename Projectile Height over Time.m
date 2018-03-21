clc
clear
datacursormode on
Vo = 90;
A = 10;
A1 = 25;
A2 = 45;
A3 = 65;
A4 = 85;
T = [0:.1:20];
G = 9.81;
Yo = 0;
X = (Vo * cos(A))*T;
Y = -1/2*G*T.^2 +(Vo * sind(A))*T+Yo;
Y1 = -1/2*G*T.^2 +(Vo * sind(A1))*T+Yo;
Y2 = -1/2*G*T.^2 +(Vo * sind(A2))*T+Yo;
Y3 = -1/2*G*T.^2 +(Vo * sind(A3))*T+Yo;
Y4 = -1/2*G*T.^2 +(Vo * sind(A4))*T+Yo;

plot (T,Y, T,Y1, T,Y2, T,Y3, T,Y4)
xlabel( 'Time (s) ' ); 
ylabel( 'Projectile Height' );
title( 'Projectile Height over Time' );
legend( '10 Degrees' , '25 Degrees' , '45 Degrees','65 Degrees','85 Degrees' )
ylim ([0 500])