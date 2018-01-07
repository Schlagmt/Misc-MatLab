clc
clear

ENCRYPT_Message = input('Enter the message to encrypt:  ','s');
ENCRYPT_Keyword = input('Enter the keyword to be used:  ','s');

ENCRYPT_Keyword = upper(ENCRYPT_Keyword);
ENCRYPT_Key = double(ENCRYPT_Keyword)-65;
ENCRYPT_Message = double(ENCRYPT_Message);
Code = zeros(size(ENCRYPT_Message));
ENCRYPTed_Message_Zeros = zeros(size(ENCRYPT_Message)); 

A = 1;
B = 1;
C = 1;
 
for B = 1:length(ENCRYPT_Message);
    Code(B)=ENCRYPT_Key(A);
    A = A + 1;
    if B == length(ENCRYPT_Keyword)*(C);
        A = 1;
        C = C + 1;
    end
end
 
for B = 1:length(ENCRYPT_Message)
    if ENCRYPT_Message(B) >= 65 && ENCRYPT_Message(B) <= 90
        if (Code(B)+ ENCRYPT_Message(B)) > 90
            ENCRYPTed_Message_Zeros(B) = Code(B) + (ENCRYPT_Message(B) - 26);
        else
            ENCRYPTed_Message_Zeros(B) = Code(B) + ENCRYPT_Message(B);
        end
    elseif ENCRYPT_Message(B) >= 97 && ENCRYPT_Message(B) <= 122;
        if (Code(B)+ENCRYPT_Message(B)) > 122;
            ENCRYPTed_Message_Zeros(B) = Code(B)+(ENCRYPT_Message(B) - 26);
        else
            ENCRYPTed_Message_Zeros(B) = Code(B) + ENCRYPT_Message(B);
        end
    else
        ENCRYPTed_Message_Zeros(B) = ENCRYPT_Message(B);
    end
end
 
Final_Message = char(ENCRYPTed_Message_Zeros);

fprintf('The encrypted message was %s\n',Final_Message)
