clc
clear
C0 = 20;
k1= .0205;
k2= .0347;
k3= .0577;
t = 0:0.01:70; 
C1 = C0.*exp(-k1*t); 
C2 = C0.*exp(-k2*t); 
C3 = C0.*exp(-k3*t); 
plot(t, C1, t, C2, t, C3); 
xlabel( 'time (s)' ); 
ylabel( 'Concentration (M)' );
title( 'Decomposition of Hydrogen Peroxide' ); 
legend( '85 F' , '95 F' , '105 F' );