clc
clear
PS = menu('Is the circuit is series or parallel','Series','Parallel');
R1 = input ('Enter the value of Resistor 1 (Ohms)'); 
R2 = input ('Enter the value of Resistor 2 (Ohms)');
AV = input ('Enter the value for the Applied Voltage (V)');

if PS == 1;
    Rtotal = R1 + R2;
    Current = AV / Rtotal;
    VR1 = R1 * Current;
    VR2 = R2 * Current;
    fprintf ('Total Resistance = %f , Current through the resistors = %f  , Voltage across resistor 1 = %f while resistor 2 = %f',Rtotal,Current,VR1,VR2);
else
    Rtotal = R1 * R2 / (R1 + R2);
    Current1 = AV / R1;
    Current2 = AV / R2;
    VR1 = AV;
    VR2 = AV;
    fprintf ('Total Resistance = %f , Current through the resistor 1 = %f while resistor 2 = %f , Voltage across resistor 1 = %f while resistor 2 = %f',Rtotal,Current1,Current2,VR1,VR2);
end