clc
clear

TypeOfMirror = menu('What type of Mirror is being used in this expariment?','Concave','Convex');
FocalPoint = input('What is the distance between the mirror and the focal point?(cm)');
Information = menu('What information do you have?','Distance from Object','Distance from Image');

Radius = 2 * FocalPoint;

if Information == 1
    DO = input('What is the Distance from Object?(cm)');
    DI = (DO * FocalPoint) /(DO - FocalPoint);
else
    DI = input('What is the Distance from Image?(cm)');
    DO = (DI * FocalPoint) /(DI - FocalPoint);
end

Information2 = menu('What information do you have?','Height of Object','Height of Image');

if Information2 == 1
    HO = input('What is the Height of Object?(cm)');
    HI = (HO * DI)/DO;
else
    HI = input('What is the Height of Image?(cm)');
    HO = (HI * DO)/DI;
end

HOArray = (0:.01:HO);
HIArray = (HOArray .* DI)/DO;

for x 




