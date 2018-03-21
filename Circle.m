function [center, radius] = Circle(pointData) 
% This function determines the center and radius of a circle defined by 
% three points.  pointData is an array containing 2 rows: the first row 
% contains the x values for the three points, the second row contains the y 
% values for the three points.  center is a 2 element vector containing the 
% x and y coordinates of the center and radius is a single value containing 
% the radius of the circle.  

x1 = pointData(1,1); 
x2 = pointData(1,2); 
x3 = pointData(1,3); 

y1 = pointData(2,1); 
y2 = pointData(2,2); 
y3 = pointData(2,3);   

midx1 = (x1+x2)/2; 
midy1 = (y1+y2)/2; 
midx2 = (x2+x3)/2;

midy2 = (y2+y3)/2;   

m1 = -(x2-x1)/(y2-y1); 
m2 = -(x3-x2)/(y3-y2);   

b1 = midy1 - m1*midx1; 
b2 = midy2 - m2*midx2;   

A = [-m1 1; -m2 1]; 
b = [b1;b2];   

if det(A) == 0     
    
    error('Points do not form a circle.'); 

else
    
    x = inv(A)*b;     
    center = [x(1) x(2)];     
    radius = sqrt((x(1)-x1)^2 + (x(2)-y1)^2); 

end

end