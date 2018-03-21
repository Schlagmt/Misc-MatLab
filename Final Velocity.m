clc
clear

M1 = input('Input value of the Mass of object 1 - ');
V1 = input('Input value of the Velocity of object 1 - ');
M2 = input('Input value of the Mass of object 2 - ');
V2 = input('Input value of the Velocity of object 2 - ');

KE1 = (1/2) * (M1) * (V1.^2);
KE2 = (1/2) * (M2) * (V2.^2);
fprintf ('The value of kinetic energy for Object 1 = %f (J), The value of kinetic energy for Object 2 = %f (J)',KE1,KE2);

if KE1 > 0 && KE2 < 0 %both objects move to right
    if V1<V2
        COLLIDE = 1;
        fprintf('Object 1 and Object 2 are both moving the the right, however they will collide');
    else
        COLLIDE = 0;
        fprintf('Object 1 and Object 2 are both moving the the right');
    end
elseif KE1 > 0 && KE2 < 0 % collide
    COLLIDE = 1;
    fprintf('Object 1 and Object 2 will collide')
elseif KE1 < 0 && KE2 > 0 % oppisite directions
    COLLIDE = 0;
    fprintf('Object 1 and Object 2 are moving in different directions, they will not collide')
else %both objects move to left
    if V1>V2
        COLLIDE = 1;
        fprintf('Object 1 and Object 2 are both moving the the left, however they will collide');
    else
        COLLIDE = 0;
        fprintf('Object 1 and Object 2 are both moving the the left');
    end
end

if COLLIDE == 1;
    X = menu('What type of collsion is the collision between Object 1 and Object 2','Inelastic','Elastic');
    if X == 1
        VF = (M1 * V1 + M2 * V2)/(M1 + M2);
        TOTALKE = (1/2) * (M1 + M2) * (VF.^2);
        fprintf ('The final velocity = %f (m/s), The total kinetic energy = %f (J)',VF,TOTALKE);
    else
        VF1 = ((M1 - M2)/(M1 + M2)) * V1 + ((2 * M2)/(M1 + M2))* V2;
        VF2 = ((2 * M1)/(M1 + M2)) * V1 + ((M2 - M1)/(M1 + M2))* V2;
        TOTALKE1 = (1/2) * (M1) * (VF1.^2);
        TOTALKE2 = (1/2) * (M2) * (VF2.^2);
        fprintf ('Final Velocity for Object 1 = %f m/s, Final Velocity for Object 2 = %f m/s, Final kenetic energy for Object 1 = %f J, Final kenetic energy for Object 2 = %f J',VF1,VF2,TOTALKE1,TOTALKE2 );
    end
else
end
        
    
    
    
    