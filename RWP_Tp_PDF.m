a = 1;
x = 0:0.1:a;
y = 0:0.1:a;
E_L = 0.521405*a;

% dist = 0:0.1:a;
% f_init = poisspdf(dist, 10);

ps = 0.1;
ps2 = 0.3;
v = 0.01*randi([5 15]);

init_x = makedist('Uniform','lower',0,'upper',a);
f_init_x = pdf(init_x, x);

init_y = makedist('Uniform','lower',0,'upper',a);
f_init_y = pdf(init_y, y);

f_init = f_init_x.*f_init_y;

%f_m = 9/(16*a^6)*(x.^2-a.^2).*(y.^2-a.^2);
%f_m = (-6/a^3*x.^2 + 6/a^2*x).*(-6/a^3*y.^2 + 6/a^2*y);

% tp = makedist('Uniform','lower',0,'upper',3);
% f_tp = pdf(tp,x);
% E_ftp = mean(f_tp);
% 
% tp2 = makedist('Uniform','lower',0,'upper',5);
% f_tp2 = pdf(tp2, x);
% E_ftp2 = mean(f_tp2);

tp = 100;
E_ftp = 100;

tp2 = 300;
E_ftp2 = 300;

pause_prob = 1/(1 + (E_L/(v*E_ftp)));
pause_prob2 = 1/(1 + (E_L/(v*E_ftp2)));

f_t = zeros(length(x),length(y));
f_t2 = zeros(length(x),length(y));
f_ntp = zeros(length(x),length(y));

for i=1:length(x)
    for j=1:length(y)
        f_m = (-6/a^3*x(i)^2 + 6/a^2*x(i))*(-6/a^3*y(j)^2 + 6/a^2*y(j));
        %f_m_ntp = 9/(16*a^6)*(x(i)^2-a^2)*(y(i)^2-a^2);
        f_x_temp = ps*f_init(i) + (1-ps)*pause_prob + (1-ps)*(1-pause_prob)*f_m;
        f_x_temp2 = ps2*f_init(i) + (1-ps2)*pause_prob2 + (1-ps2)*(1-pause_prob2)*f_m;
        f_t(i,j) = f_x_temp;
        f_t2(i,j) = f_x_temp2;
        f_ntp(i,j) = f_m;
    end
end

figure(1);
[X,Y] = meshgrid(x,y);
surf(X,Y,f_ntp);
title('p_s = t_p = 0, v = 0.01');
xlabel('x')
ylabel('y')
zlabel('PDF')

figure(2);
[X,Y] = meshgrid(x,y);
surf(X,Y,f_t);
title('p_s = 0.1, t_p = 100s, v = 0.01');
xlabel('x')
ylabel('y')
zlabel('PDF')

figure(3);
surf(X,Y,f_t2);
title('p_s= 0.3, t_p = 300 s, v = 0.01');
xlabel('x')
ylabel('y')
zlabel('PDF')


