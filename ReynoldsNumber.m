clc
clear

UNITS = menu('Which unit will the user be using?','CGS','English');

if UNITS == 1
    DISTANCE = input('Enter Value for Distance (cm)');
    DENSITY = input('Enter Value for Density (cm/s)');
    VELOCITY = input('Enter Value for Velocity (g/cm*s)');
    VISCOSITY = input('Enter Value for Viscosity (g/cm^3)');
else
    DISTANCE = input('Enter Value for Distance (ft)');
    DENSITY = input('Enter Value for Density (lb/ft^3)');
    VELOCITY = input('Enter Value for Velocity (ft/s)');
    VISCOSITY = input('Enter Value for Viscosity (lb/ft^5)');
end
RENOLDNUMBER = (DISTANCE * DENSITY * VELOCITY) / (VISCOSITY);

fprintf('The Reynolds Number of the inputted data = %f',RENOLDNUMBER);

