a = 1;
x = 0:0.1:a;
y = 0:0.1:a;
E_L = 0.521405*a;

ps = 0.1;
ps2 = 0.3;
v = 0.01;

init_x = makedist('Uniform','lower',0,'upper',a);
f_init_x = pdf(init_x, x);

f_init = f_init_x;
% dist = 0:0.1:a;
% f_init = poisspdf(dist, 10);

tp = 100;
E_ftp = 100;

tp2 = 300;
E_ftp2 = 300;

pause_prob = 1/(1 + (E_L/(v*E_ftp)));
pause_prob2 = 1/(1 + (E_L/(v*E_ftp2)));

f_t = zeros(length(x));
f_t2 = zeros(length(x));


for i=1:length(x)
        f_m = (-6/a^3*x(i).^2 + 6/a^2*x(i));
        f_x_temp = ps*f_init(i) + (1-ps)*pause_prob + (1-ps)*(1-pause_prob)*f_m;
        f_x_temp2 = ps2*f_init(i) + (1-ps2)*pause_prob2 + (1-ps2)*(1-pause_prob2)*f_m;
        f_t(i) = f_x_temp;
        f_t2(i) = f_x_temp2;
end

figure(1);

plot(x, f_t);
title('p_s = 0.1, t_p = 100s, v = 0.01');

figure(2);
plot(x, f_t2);
title('p_s = 0.3, t_p = 300s, v = 0.01');
