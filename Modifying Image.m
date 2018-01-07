clc
clear

load HW9_1617; 
[nrows,ncols] = size(Butterfly);
NewPic = uint8(zeros(size(Butterfly)));

for nrows = 1:2571
    for ncols = 1:2101
        if Butterfly(nrows,ncols) > 200
            NewPic(nrows,ncols) = 255;
        elseif 150 < Butterfly(nrows,ncols) && Butterfly(nrows,ncols) <= 200
            NewPic(nrows,ncols) = 175;
        elseif 100 < Butterfly(nrows,ncols) && Butterfly(nrows,ncols) <= 150
            NewPic(nrows,ncols) = 125;
        elseif 50 < Butterfly(nrows,ncols) && Butterfly(nrows,ncols) <= 100
            NewPic(nrows,ncols) = 75;
        elseif 50 > Butterfly(nrows,ncols)
            NewPic(nrows,ncols) = 0;
        end
    end
end

imshow(NewPic)