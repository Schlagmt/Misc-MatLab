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

HOArray = (0:.1:HO);
HIArray = (HOArray .* DI)/DO;

[sz, sz1] = size(HOArray);
[sz2, sz3] = size(HIArray); 

Pic = zeros(sz1,sz3);

for x = 1:sz1
    for y = 1:sz3
        Pic(x,y) = abs(HOArray(x) * HIArray(y));
        if Pic(x,y) >= 256
            Pic(x,y) = Pic(x,y) / 5.23456;
        end
    end
end

info3 = menu('Do you want to see an image that means nothing or a plot that means nothing','Image!!','Plot!!');

if info3 == 1
    imshow(Pic, [0 255])
else
    plot(HOArray,HIArray)
end

fprintf ('Infomation: Focal Point = %f , Distance to Object = %f , Distance to Image = %f , Height of Object = %f , Height to Image = %f',FocalPoint,DI,DO,HI,HO);

