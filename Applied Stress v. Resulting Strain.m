clc
clear
A = pi * .2^2;
F = [0;1650;3400;5200;6850;7750;8150;8500;8750;9000];
AS = F/A;
L = [2; 2.003; 2.006; 2.009; 2.012; 2.015; 2.03; 2.06; 2.09; 2.12];
OL = 2;
S = (L - OL)/OL;
plot (AS,S,'black')
xlabel( 'Applied Stress (lbf/in2) ' ); 
ylabel( 'Resulting Strain (in/in)' );
title( 'Applied Stress v. Resulting Strain' ); 
