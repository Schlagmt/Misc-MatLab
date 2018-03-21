function [distance] = Point2Line(lineData,pointData) 
% This function determines the distance from a point to a line.  lineData 
% is a 2 element vector containing the slope and intercept of a line. 
% pointData is a 2 element vector containing the x and y coordinates of the 
% point.  distance is the computed distance from the point to the line.  

m1 = lineData(1); 
b1 = lineData(2); 
m2 = -1/m1; 
b2 = pointData(2)-m2*pointData(1);   
A = [-m1 1; -m2 1]; 
b = [b1;b2];   

if det(A) == 0    
    
    error('Distance cannot be found.'); 

else
    
    x = inv(A)*b;     
    distance = sqrt((x(1)-pointData(1))^2 + (x(2)-pointData(2))^2); 

end

end