clc
clear
datacursormode on 
D = 0.4;
L = [.4:.1:10];
FlowRateOut = pi*(D/2).^2 * sqrt(2*32.2*(L-D/2))
plot (L,FlowRateOut)
title ('Flow Rate of Water vs Liquid Level')
xlabel ('Liquid Level')
ylabel ('Flow Rate Out')