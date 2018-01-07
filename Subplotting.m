clc
clear
t = [-5:.1:5];

y1 = t.^2 - 4.*t+3;
subplot(2,2,1)
plot (y1,t,'r')
title ('Subplot A')

y2 = cos(4.*t);
subplot(2,2,2)
plot (y2,t,'--')
title ('Subplot B')

y3 = exp(-12.*t);
subplot(2,2,3)
plot (y3,t,'m')
title ('Subplot C')

y4 = sin(2.*pi.*t).*sin(2.*pi.*(20.*t));
subplot(2,2,4)
plot (y4,t,'b')
title ('Subplot D')