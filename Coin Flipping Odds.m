clc
clear
rng('shuffle');
NumberOfTimes = input('Input the number of times you want a coin to be flipped');
k = 0;
Heads = 0;
Tails = 0;

for k = 1:NumberOfTimes
    flip = randi([1 2],1);
    if flip == 1
        Heads = Heads + 1;
    else
        Tails = Tails + 1;
    end
end

PercentHeads = (Heads/NumberOfTimes)*100;
PercentTails = (Tails/NumberOfTimes)*100

fprintf ('The number of times Heads occured = %f , for a total percentage of = %f, The number of times Tails occured = %f , for a total percentage of = %f',Heads,PercentHeads,Tails,PercentTails);