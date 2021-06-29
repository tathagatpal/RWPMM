a = 5;
x = 0:0.5:a;
y = 0:0.5:a;
E_L = 0.521405*a;

ps = [0.1 0.3];
v = unifrnd(1,2);

init_x = makedist('Uniform','lower',0,'upper',a);
f_init_x = pdf(init_x, x);

init_y = makedist('Uniform','lower',0,'upper',a);
f_init_y = pdf(init_y, y);

f_init = f_init_x.*f_init_y;

f_tp = unifrnd(0,100);
E_ftp = mean(f_tp);

f_tp2 = unifrnd(100,300);
E_ftp2 = mean(f_tp2);

pause_prob = 1/(1 + (E_L/(v*E_ftp)));
pause_prob2 = 1/(1 + (E_L/(v*E_ftp2)));

f_t = zeros(length(x),length(y));
f_t2 = zeros(length(x),length(y));
f_ntp = zeros(length(x),length(y));

f_m_2D = (-6/a^3*x.^2 + 6/a^2.*x).*(-6/a^3*y.^2 + 6/a^2.*y);
f_t_2D = ps(1).*f_init + (1-ps(1)).*pause_prob + (1-ps(1)).*(1-pause_prob).*f_m_2D;
f_t_2D2 = ps(1).*f_init + (1-ps(1)).*pause_prob2 + (1-ps(1)).*(1-pause_prob2).*f_m_2D;

for i=1:length(x)
    for j=1:length(y)
        f_m = (-6/a^3*x(i)^2 + 6/a^2*x(i))*(-6/a^3*y(j)^2 + 6/a^2*y(j));
        %f_m_ntp = 9/(16*a^6)*(x(i)^2-a^2)*(y(i)^2-a^2);
        f_x_temp = ps(1)*f_init(i) + (1-ps(1))*pause_prob + (1-ps(1))*(1-pause_prob)*f_m;
        %f_x_temp = 0.692 + 0.308*f_m;
        f_x_temp2 = ps(1)*f_init(i) + (1-ps(1))*pause_prob2 + (1-ps(1))*(1-pause_prob2)*f_m;
        %f_x_temp2 = 0.896 + 0.104*f_m;
        f_t(i,j) = f_x_temp;
        f_t2(i,j) = f_x_temp2;
        f_ntp(i,j) = f_m;
    end
end


% A1_inti= integral2(f_init, 0,5, 0,5);
%A0 = trapz(x, f_init);
A0 = trapz(x, f_init_x);
A1 = trapz(x, f_t);
A2 = trapz(x, f_t2);

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
title('p_s = 0.1, t_p = unifrnd(0,100), v = 0.01');
xlabel('x')
ylabel('y')
zlabel('PDF')

figure(3);
surf(X,Y,f_t2);
title('p_s= 0.1, t_p = unifrnd(100,300), v = 0.01');
xlabel('x')
ylabel('y')
zlabel('PDF')

figure(4);
plot(x, f_t_2D, x, f_t_2D2, 'linewidth', 1.5);
xlabel('position');
ylabel('PDF');

text_legend_1 = sprintf('t_p %.1f',f_tp);
text_legend_2 = sprintf('t_p %.1f', f_tp2);
legend(text_legend_1, text_legend_2);
title('p_s= 0.1, t_p = 300 s, v = 0.01');

