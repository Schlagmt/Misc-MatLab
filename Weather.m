clc
clear

Velocity = [2 5 12 20];
Temperature = [10 15 20 25 30 35 40];

NumTemps  = length(Temperature);
NumSpeeds = length(Velocity);

WCF = zeros(NumTemps,NumSpeeds);


for M = 1:NumTemps
   for N = 1:NumSpeeds
       WCF(M,N) = 35.7 + 0.6 * Temperature(M)- 35.7 * (Velocity(N) ^0.16) + 0.43 * Temperature(M) * (Velocity(N) ^0.16);
   end
end
 
plot(Temperature,WCF)
xlabel( 'Temperature(F)' ); 
ylabel( 'Wind Chill Factor(F)' );
title( 'Temperature v. WCF' );
legend('2 MPH Wind','5 MPH Wind','12 MPH Wind','20 MPH Wind','Location','northwest')