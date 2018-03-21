clc
clear

Pick = menu ('What would you like to do?','Find friction force, given mass and coefficient of friction','Find Coefficent of static friction, given mass and force','Find Displacement, given Coefficent of Friction and initial velocity','Static Frictional Constant, Friction, Normal Force at angle; given mass and angle','Find Coefficent of Friction, given Displacement and initial velocity','Show how Coefficient_of_Friction changes') ;

% Find friction force, given mass and coefficient of friction
if Pick == 1

    M = input('Input the mass of the object sliding(kg)');
    Coefficient_of_static_friction = input('Input the Coefficient of static friction');

    Fn = M * (9.81);
    Minimum_Initial_Applied_Force = Fn * Coefficient_of_static_friction;
    fprintf('Minimum_Initial_Applied_Force = %f',Minimum_Initial_Applied_Force);

% Find Coefficent of static friction, given mass and force
elseif Pick == 2

    M = input('Input the weight of the object sliding(kg)');
    Force = input('Input the force on the object sliding(N)');

    N = M * (9.81);
    Coefficent_of_Static_Friction = Force / N;
    fprintf('Coefficent of static friction = %f',Coefficent_of_Static_Friction);

%  Find Displacement, given Coefficent of Friction and initial velocity
elseif Pick == 3

    Coefficient_of_Friction = input('Input the Coefficient of friction');
    Velocity_Initial = input('Input the intial Velocity(m/s)');

    Distance = ((1/2) * (Velocity_Initial^2)) / ((9.81) * Coefficient_of_Friction);
    fprintf('Distance = %f',Distance);

% Static Frictional Constant, Friction, Normal Force at angle; given mass and angle
elseif Pick == 4

    Mass = input('Input Mass(kg)');
    Angle = input('Input angle of surface');

    Force = Mass * (9.81) * sin(Angle);
    N = Mass * (9.81) * cos(Angle);
    Static_Frictional_Constant = tan(angle);
    fprintf('Static Frictional Constant = %f , Friction = %f , Normal force = %f',Static_Frictional_Constant,Force,Normal);

%  Find Coefficent of Friction, given Displacement and initial velocity
elseif Pick == 5

    Displacement = input('Input the Displacement');
    Velocity_Initial = input('Input the intial Velocity(m/s)');

    Coefficient_of_Friction = ((1/2) * (Velocity_Initial^2)) / ((9.81) * Displacement);
    fprintf('Coefficient of Friction = %f',Coefficient_of_Friction);

% Show how Coefficient_of_Friction changes
elseif Pick == 6
    
    Displacement = 0.1:.1:3.0;
    Velocity_Initial = 0.1:.1:3.0;

    z = 1;

    for x = 1:30;
        for y = 1:30;
            Coefficient_of_Friction(z) = ((1/2) * (Velocity_Initial(x)^2)) / ((9.81) * Displacement(y));
            z = z + 1;
        end
    end

    plot(Coefficient_of_Friction)
    xlabel ('Coefficient of Friction')
    title('Showing Coefficient of Friction as displacement and Velocity Initail rise')

end



