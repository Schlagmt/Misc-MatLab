clc
clear
close all; 
commandwindow
rng('shuffle');
Number = randi([1 100],1);

k = 1;

while k <= 7;
    GUESS = input ('Guess what you think the number selected is...(1-100) ');
    if GUESS == Number
        fprintf('Congrats you got it right!!!! ');
        k = k + 1000;
    elseif GUESS > Number && k < 7
        fprintf('You were to high, try again. ')
        k = k + 1;
    elseif GUESS < Number && k <7
        fprintf('You were to low, try again. ')
        k = k + 1;
    elseif GUESS < Number && k == 7
        fprintf('You were to low, Game Over. The answer was = %f ',Number);
        k = k + 1;
    elseif GUESS > Number && k == 7
        fprintf('You were to low, Game Over. The answer was = %f ',Number);
        k = k + 1;
    end
end 

