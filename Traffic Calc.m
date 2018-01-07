clc
clear

M = input('The length of the road');
Cars = input('The number of vehicles on the road');
max_vel = input('The maximum speed');
p_slow = input('The probability of a vehicle slowing down');
num_iter =input('The number of iterations in the simulation');
 
rng('shuffle');
Location = randperm(M,Cars);

Location = sort(Location);

Speed = randi(max_vel,[1,Cars]);

Image = 255.*ones(num_iter,M);
Location_New = Location;
 
for x = 1:num_iter
    for y = 1:Cars
        if Speed(y) < max_vel
            Speed(y) = Speed(y) + 1;
        end
        
        if y == Cars && Location(y) > Location(1)
            if Speed(y)+ Location(y)>= M + Location(1)
                    Speed(y) = Location(1) - Location(y) + M - 1;
            end
        elseif y == Cars && Location(Cars) < Location(1)
            Speed(y)= Location(1) - Location(y) - 1;
        elseif Location(y) > Location(y + 1)
                if Speed(y) + Location(y)>= M + Location(y + 1)
                    Speed(y) = Location(y + 1) - Location(y) + M - 1;
                end
        elseif Speed(y)+ Location(y) >= Location(y + 1)
                Speed(y) = Location(y + 1) - Location(y) - 1;
        end
        
        if rand(1) <= p_slow && Speed(y) > 0
            Speed(y) = Speed(y) - 1;
        end

        Location_New(y) = Location(y) + Speed(y);

        if Location_New(y) > M
            Location_New(y) = Location_New(y) - M;
        end
    end
    Location = Location_New;
    Image(x,Location) = 0;
    imshow(uint8(Image));
end
