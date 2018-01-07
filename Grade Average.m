clc
clear
Grades = 0;
NumberOfGrades = input('DUDE, how many Grades will we be averaging today?');

if NumberOfGrades >= 1
    for k = 1:NumberOfGrades;
        Grade = input('What was your grade in a Class? (Out of 100)');
        Grades = Grades + Grade;
    end
    Average = Grades / NumberOfGrades;
    fprintf ('Number of Grades = %f , Total value of Grades = %f , Average value of Grades = %f',NumberOfGrades,Grades,Average);
else
    fprintf ('The responce provided to question "DUDE, how many Grades will we be averaging today?" was not an integer, please restart program and enter a numeric value greater than 0');
end