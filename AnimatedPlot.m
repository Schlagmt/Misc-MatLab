function [] = AnimatedPlot(t,y,tinc) 
% This function plots the data points (t,y) one at a time with a pause between points = tinc 
% Inputs: t is a vector of values for the x-axis, y is the corresponding vector of values for the y-axis 
% tinc is the amount of time to pause between plotting individual data points 
% Usage:  >> AnimatedPlot(t,y,tinc) 

XAxis = input('Enter the x-axis label: ','s'); 
YAxis = input('Enter the y-axis label: ','s'); 
Title = input('Enter the title: ','s'); 

plot(t(1),y(1),'k*') xlim([min(t) max(t)]); 
ylim([min(y) max(y)]); 
xlabel(XAxis); 
ylabel(YAxis); title(Title); 
hold on 
pause(tinc) 

for k = 2:length(t)     

    plot(t(k),y(k),'k*');     
    pause(tinc) 

end

end

