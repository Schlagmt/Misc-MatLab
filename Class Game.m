clc
clear

fprintf ('You have 7 classes \n')
fprintf ('Yo bro you got a quiz tomorrow, i dont know what class its in but u should proly \n study everything..., but you wont. lol')

Days = 0;

while Days < 1000;
    S4C = menu('What class u not gonna study for bro?','a','b','c','d','e','f','g');
    CWQ = randi(7,1,3,'double');
    if S4C ~= CWQ;       
        fprintf('\n dude, nice you did not have a quiz in that class');        
        Days = Days + 1;
    else
        fprintf('\n dude you picked the wrong class, you failed, looks like a dropped class');
        Days = Days + 1;
        while Days < 1000;
            S4C = menu('What class u not gonna study for bro?','a','b','c','d','e','f');
            CWQ1 = randi(6,1,3,'double');
            if S4C ~= CWQ1;        
                fprintf('\n dude, nice you did not have a quiz in that class'); 
                Days = Days + 1;
            else
                fprintf('\n Again man,killin me, you were droped');
                Days = Days + 1;
                while Days < 1000;
                    S4C = menu('What class u not gonna study for bro?','a','b','c','d','e');
                    CWQ2 = randi(5,1,2,'double');
                    if S4C ~= CWQ2;       
                        fprintf('\n dude, nice you did not have a quiz in that class');         
                        Days = Days + 1;
                    else
                        fprintf('\n Man you are bad at this, you were droped');
                        Days = Days + 1;
                        while Days < 1000;
                            S4C = menu('What class u not gonna study for bro?','a','b','c','d');
                            CWQ3 = randi(4,1,2,'double');
                            if S4C ~= CWQ3;      
                                fprintf('\n dude, nice you did not have a quiz in that class');         
                                Days = Days + 1;
                            else
                                fprintf('\n Mr. Pinks not gonna like this,you failed, you were droped');
                                Days = Days + 1;
                                while Days < 1000;
                                    S4C = menu('What class u not gonna study for bro?','a','b','c');
                                    CWQ4 = randi(3);
                                    if S4C ~= CWQ4;      
                                        fprintf('\n dude, nice you did not have a quiz in that class');         
                                        Days = Days + 1;
                                    else
                                        fprintf('\n Failed AGAIN, you were droped');
                                        Days = Days + 1;
                                        while Days < 1000;
                                            S4C = menu('What class u not gonna study for bro?','a','b');
                                            CWQ5 = randi(2);
                                            if S4C ~= CWQ5;        
                                                fprintf('\n dude, nice you did not have a quiz in that class');         
                                                Days = Days + 1;
                                            else
                                                fprintf('\n Thats IT, you are down to one class get out!!')
                                                fprintf('\n Number of days you made it in College %f',Days)
                                                Days = 1001;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
        
