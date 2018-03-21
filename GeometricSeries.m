function [N P_Sum] = GeometricSeries(r) 
% This function computes the partial sums for the geometric series: 1 + r + 
% r^2 + ... and determines the number of terms required to converge within 
% 0.001 of the final sum which is 1/(1-r) 
% Usage: [N P_Sum] = GeometricSeries(0.5)   

if abs(r) >=1      
    
    error('The Series does not converge for your r-value'); 

end 
 
Final_Sum = 1/(1-r); Sum_Vector(1) = 1; N = 1; 
 
while abs(Sum_Vector(N)-Final_Sum) >= 0.001     
    
    Sum_Vector(N+1) = Sum_Vector(N) + r^N;     
    N = N + 1; 

end

P_Sum = Sum_Vector(N);   

end