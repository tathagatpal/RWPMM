syms x y c_min c_max m_max m_min d1 d2 pause_prob;
syms a b r d d_b m c;

p = [1.25 3.75 3.75 1.25]; q = [1.25 1.25 3.75 3.75]; %Location of LED
a = 2.5; b = 2.5; %Location of PD
r = 0.4; %Blockage radius

% pause_prob = 0.79; %Tp = 10s
% pause_prob = 0.97; %Tp = 100s
% pause_prob = 0.79; %Tp = 300s
pause_prob = 0.95; %Tp = 50s
%Vary pause time

for led_ind = 1:length(p)

m = (b-q(led_ind))/(a-p(led_ind));    
c = -p(led_ind)*(b-q(led_ind))/(a-p(led_ind)) + q(led_ind);

%CD: y = mx+c1
c1 = r/2 * sqrt(1+m^2) + c;
CD = y == m*x + c1;
CD_m = m;
CD_c = c1;

%AB: y = mx+c2
c2 = -r/2 * sqrt(1+m^2) + c;
AB = y == m*x + c2;
AB_m = m;
AB_c = c2;


%Line of minimum of distance (AD)
AD = y == -1/m*x + (24*b)/43 + (19*q(led_ind))/43 ...
    + ((a-p(led_ind))*(24*a/43 + 19*p(led_ind)/43))/(b-q(led_ind));
AD_m = -1/m;
AD_c = 24*b/43 + 19*q(led_ind)/43 + ((a-p(led_ind))*((24*a)/43 + 19*p(led_ind)/43))/(b-q(led_ind));

%Point D
[Dx, Dy] = solve([CD, AD], [x,y]);

%Point A
[Ax, Ay] = solve([AD, AB], [x,y]);

Axc = x == Ax;

%Point F
[Fx, Fy] = solve([CD, Axc],[x, y]);

Dxc = x == Dx;

%Point H (for LED = (3.75,3.75) and (1.25, 3.75))
[Hx, Hy] = solve([AB, Dxc], [x,y]);

%Line EG (variable line)
EG = y == -1/m * x + p(led_ind)/m + q(led_ind) + d;
EG_m = -1/m;
EG_c = p(led_ind)/m + q(led_ind) + d;

%Point E
[Ex, Ey] = solve([CD, EG],[x, y]);

%Point G
[Gx, Gy] = solve([AB, EG], [x,y]);


%1. LED (1.25, 1.25) __________________________________
if (p(led_ind) == 1.25 && q(led_ind) == 1.25)
    prob_left1 = integrate(x,y,pause_prob, AD_m, AD_c, CD_m, CD_c, Dx, Ex);
    prob_mid1 = integrate(x,y, pause_prob, AD_m, AD_c, EG_m, EG_c, Ex, Fx);
    prob_right1 = integrate(x,y, pause_prob, AB_m, AB_c, EG_m, EG_c, Fx, Gx);

    prob_total1 = prob_left1 + prob_mid1 + prob_right1;

    prob_left2 = integrate(x,y,pause_prob, AD_m, AD_c, CD_m, CD_c, Dx, Ax);
    prob_mid2 = integrate(x,y,pause_prob, AB_m, AB_c, CD_m, CD_c, Ax, Ex);
    prob_right2 = integrate(x,y,pause_prob, AB_m, AB_c, EG_m, EG_c, Ex, Gx);

    prob_total2 = prob_left2 + prob_mid2 + prob_right2;

    prob_tot = prob_total1 + prob_total2;
    
    %d value range
    dlA = sqrt((p(led_ind)-a)^2 + (q(led_ind)-b)^2)*(1 - 0.95/2.15);
    d_startA = dlA*sqrt(1+(-1/m)^2);
    d_midA = Fy + Fx/m -p(led_ind)/m - q(led_ind);
    d_endA = b + a/m - p(led_ind)/m - q(led_ind);

    d_plotA = d_startA : 0.001 : d_endA;
    prob_finalA = zeros(1, length(d_plotA));

    for i = 1:length(d_plotA)
        if (d_plotA(i)) >= (d_startA) && (d_plotA(i)) <= (d_midA)
            prob_finalA(i) = subs(prob_total1, d, d_plotA(i));
        elseif (d_plotA(i)) >= (d_midA) && (d_plotA(i)) <= abs(d_endA)
            prob_finalA(i) = subs(prob_total2, d, d_plotA(i));
        else
            prob_finalA(i) = 0;
        end   
    end
    
    dist_plotA = abs(d_plotA)/sqrt(1 + (-1/m)^2);


%2. LED (3.75, 1.25) __________________________________
elseif (p(led_ind) == 3.75 && q(led_ind) == 1.25)
    prob_left1 = integrate(x,y,pause_prob, AB_m, AB_c, EG_m, EG_c, Gx, Ax);
    prob_mid1 = integrate(x,y, pause_prob, AD_m, AD_c, EG_m, EG_c, Ax, Ex);
    prob_right1 = integrate(x,y, pause_prob, AD_m, AD_c, CD_m, CD_c, Ex, Dx);

    prob_total1 = prob_left1 + prob_mid1 + prob_right1;
    
    prob_left2 = integrate(x,y,pause_prob, AB_m, AB_c, EG_m, EG_c, Gx, Ex);
    prob_mid2 = integrate(x,y,pause_prob, AB_m, AB_c, CD_m, CD_c, Ex, Ax);
    prob_right2 = integrate(x,y,pause_prob, AD_m, AD_c, CD_m, CD_c, Ax, Dx);

    prob_total2 = prob_left2 + prob_mid2 + prob_right2;

    prob_tot = prob_total1 + prob_total2;
    
    dlB = sqrt((p(led_ind)-a)^2 + (q(led_ind)-b)^2)*(1 - 0.95/2.15);
    d_startB = dlB*sqrt(1+(-1/m)^2);
    d_midB = Fy + Fx/m -p(led_ind)/m - q(led_ind);
    d_endB = b + a/m - p(led_ind)/m - q(led_ind);
    
    d_plotB = d_startB : 0.001 : d_endB;
    prob_finalB = zeros(1, length(d_plotB));

    for i = 1:length(d_plotB)
        if d_plotB(i) >= d_startB && d_plotB(i) <= d_midB
            prob_finalB(i) = subs(prob_total1, d, d_plotB(i));
        elseif d_plotB(i) >= d_midB && d_plotB(i) <= d_endB
            prob_finalB(i) = subs(prob_total2, d, d_plotB(i));
        else
            prob_finalB(i) = 0;
        end   
    end
    
    dist_plotB = abs(d_plotB)/sqrt(1 + (-1/m)^2);
  
%3. LED (3.75, 3.75)__________________________________    
elseif (p(led_ind) == 3.75 && q(led_ind) == 3.75)
    
    prob_left1 = integrate(x,y,pause_prob, EG_m, EG_c, CD_m, CD_c, Ex, Dx);
    prob_mid1 = integrate(x,y, pause_prob, EG_m, EG_c, AD_m, AD_c, Dx, Gx);
    prob_right1 = integrate(x,y, pause_prob, AB_m, AB_c, AD_m, AD_c, Gx, Ax);

    prob_total1 = prob_left1 + prob_mid1 + prob_right1;
    
    prob_left2 = integrate(x,y,pause_prob, EG_m, EG_c, CD_m, CD_c, Ex, Gx);
    prob_mid2 = integrate(x,y,pause_prob, AB_m, AB_c, CD_m, CD_c, Gx, Dx);
    prob_right2 = integrate(x,y,pause_prob, AB_m, AB_c, AD_m, AD_c, Dx, Ax);

    prob_total2 = prob_left2 + prob_mid2 + prob_right2;

    dlC = sqrt((p(led_ind)-a)^2 + (q(led_ind)-b)^2)*(1 - 0.95/2.15);
    d_startC = -dlC*sqrt(1+(-1/m)^2); % -2.0651
    d_midC = Hy + Hx/m -p(led_ind)/m - q(led_ind); % -2.5567
    d_endC = b + a/m - p(led_ind)/m - q(led_ind); % -3.7
    
    d_plotC = (d_endC) : 0.001 : (d_startC);
    prob_finalC = zeros(1, length(d_plotC));

    for i = 1:length(d_plotC)
        if abs(d_plotC(i)) >= abs(d_startC) && abs(d_plotC(i)) <= abs(d_midC)
            prob_finalC(i) = subs(prob_total1, d, d_plotC(i));
        elseif abs(d_plotC(i)) > abs(d_midC) && abs(d_plotC(i)) <= abs(d_endC)
            prob_finalC(i) = subs(prob_total2, d, d_plotC(i));
        else
            prob_finalC(i) = 0;
        end   
    end
    
    dist_plotC = abs(d_plotC)/sqrt(1 + (-1/m)^2);
    
    
%4. LED (1.25, 3.75)__________________________________
elseif (p(led_ind) == 1.25 && q(led_ind) == 3.75)
    
    prob_left1 = integrate(x,y,pause_prob, AB_m, AB_c, AD_m, AD_c, Ax, Gx);
    prob_mid1 = integrate(x,y, pause_prob, EG_m, EG_c, AD_m, AD_c, Gx, Dx);
    prob_right1 = integrate(x,y, pause_prob, EG_m, EG_c, CD_m, CD_c, Dx, Ex);

    prob_total1 = prob_left1 + prob_mid1 + prob_right1;
    
    prob_left2 = integrate(x,y,pause_prob, AB_m, AB_c, AD_m, AD_c, Ax, Dx);
    prob_mid2 = integrate(x,y,pause_prob, AB_m, AB_c, CD_m, CD_c, Dx, Gx);
    prob_right2 = integrate(x,y,pause_prob, EG_m, EG_c, CD_m, CD_c, Gx, Ex);

    prob_total2 = prob_left2 + prob_mid2 + prob_right2;
    
    dlD = sqrt((p(led_ind)-a)^2 + (q(led_ind)-b)^2)*(1 - 0.95/2.15);
    d_startD = -dlD*sqrt(1+(-1/m)^2); % -2.0651
    d_midD = Hy + Hx/m -p(led_ind)/m - q(led_ind); % -2.5567
    d_endD = b + a/m - p(led_ind)/m - q(led_ind); % -3.7

    d_plotD = (d_endD) : 0.001 : (d_startD);
    prob_finalD = zeros(1, length(d_plotD));

    for i = 1:length(d_plotD)
        if abs(d_plotD(i)) >= abs(d_startD) && abs(d_plotD(i)) <= abs(d_midD)
            prob_finalD(i) = subs(prob_total1, d, d_plotD(i));
        elseif abs(d_plotD(i)) > abs(d_midD) && abs(d_plotD(i)) <= abs(d_endD)
            prob_finalD(i) = subs(prob_total2, d, d_plotD(i));
        else
            prob_finalD(i) = 0;
        end   
    end
    
    dist_plotD = abs(d_plotD)/sqrt(1 + (-1/m)^2);


end


end


coord_PD = sprintf(' (%.2f, %.2f) ', a, b);
text_PD1 = sprintf(' Coordinate of PD: ');
text_PD = strcat(text_PD1, coord_PD);

figure(1);
subplot(2,2,3);
    plot(dist_plotA, prob_finalA, 'linewidth', 1.5);
    coord_LEDA = sprintf(' (%.2f, %.2f) ', p(1), q(1));
    text_LEDA = sprintf('Coordinate of LED: ');
    text_titleA1 = strcat(text_LEDA, coord_LEDA);
    text_titleA = strcat(text_titleA1, text_PD);
    title(text_titleA);
    xlabel('Distance from base of LED (in m)');
    ylabel('Blockage probability P_B(d)');
subplot(2,2,4);
    plot(dist_plotB, prob_finalB, 'linewidth', 1.5);
    coord_LEDB = sprintf(' (%.2f, %.2f) ', p(2), q(2));
    text_LEDB = sprintf('Coordinate of LED: ');
    text_titleB1 = strcat(text_LEDB, coord_LEDB);
    text_titleB = strcat(text_titleB1, text_PD);
    title(text_titleB);
    xlabel('Distance from base of LED (in m)');
    ylabel('Blockage probability P_B(d)');
subplot(2,2,2);
    plot(dist_plotC, prob_finalC, 'linewidth', 1.5);
    coord_LEDC = sprintf(' (%.2f, %.2f) ', p(3), q(3));
    text_LEDC = sprintf('Coordinate of LED: ');
    text_titleC1 = strcat(text_LEDC, coord_LEDC);
    text_titleC = strcat(text_titleC1, text_PD);
    title(text_titleC);
    xlabel('Distance from base of LED (in m)');
    ylabel('Blockage probability P_B(d)');
subplot(2,2,1);
    plot(dist_plotD, prob_finalD, 'linewidth', 1.5);
    coord_LEDD = sprintf(' (%.2f, %.2f) ', p(4), q(4));
    text_LEDD = sprintf('Coordinate of LED: ');
    text_titleD1 = strcat(text_LEDD, coord_LEDD);
    text_titleD = strcat(text_titleD1, text_PD);
    title(text_titleD);
    xlabel('Distance from base of LED (in m)');
    ylabel('Blockage probability P_B(d)');

%Power Calculation_________________________________________________________

theta =70;

I2 = 0.562; % Noise-bandwidth factor 
Rb = 115200; % Data rate (Bit per second)
Iamb = 7E-8; % Ambient light power (Ampere) %
R = 0.55; % Photodiode responsivity (A/W )%
q = 1.60E-19; % Electron charge (C)
% Amplifier bandwidth (Hz)%
Ba = 4.5E6;
% Amplifier noise density (Ampere/Hz^0.5)%
Iamf = 5e-12 ;
% semi-angle at half power
ml=-log10(2)/log10(cosd(theta)); %Lambertian order of emission
P_LED=20; %transmitted optical power by individual LED
nLED=60; % number of LED array nLED*nLED
P_total=nLED*nLED*P_LED; %Total transmitted power
Adet=10^-4; %detector physical area of a PD
Ts=1; %gain of an optical filter; ignore if no filter is used
index=1.5; %refractive index of a lens at a PD; ignore if no lens is used
FOV=70; %FOV of a receiver
G_Con=(index^2)/(sind(FOV).^2); %Gain of an optical concentrator; ignore if no lens is used

lx=5; ly=5; lz=3; %Room dimension
h=2.15; % dist b/w source and receiver plane

[XT,YT]=meshgrid([lx/4 3*lx/4],[ly/4 3*ly/4]);
Nx=lx*5; Ny=ly*5;
x_coord = linspace(0,lx,Nx);
y_coord = linspace(0,ly,Ny);
[XR,YR] = meshgrid(x_coord,y_coord);
D1 = sqrt((XR-XT(1,1)).^2+(YR-YT(1,1)).^2+h^2);
D2 = sqrt((XR-XT(1,2)).^2+(YR-YT(1,2)).^2+h^2);
D4 = sqrt((XR-XT(2,1)).^2+(YR-YT(2,1)).^2+h^2);
D3 = sqrt((XR-XT(2,2)).^2+(YR-YT(2,2)).^2+h^2);

% D1 = sqrt((p(1)-a)^2 + (q(1)-b)^2);
cosphi_A1=h./D1;
receiver_angle=acosd(cosphi_A1);

cosphi_A2=h./D2;
receiver_angle2=acosd(cosphi_A2);

cosphi_A3=h./D3;
receiver_angle3=acosd(cosphi_A3);

cosphi_A4=h./D4;
receiver_angle4=acosd(cosphi_A4);

H_A1=(ml+1)*Adet.*cosphi_A1.^(ml+1)./(2*pi.*D1.^2);
H_A2=(ml+1)*Adet.*cosphi_A2.^(ml+1)./(2*pi.*D2.^2);
H_A3=(ml+1)*Adet.*cosphi_A3.^(ml+1)./(2*pi.*D3.^2);
H_A4=(ml+1)*Adet.*cosphi_A4.^(ml+1)./(2*pi.*D4.^2);


H_A1_blockageA = H_A1.*(1-0-0);
H_A1_blockageB = H_A2.*(1-0-0.158);
H_A1_blockageC = H_A3.*(1-0-0.209);
H_A1_blockageD = H_A4.*(1- 0 - 0.027);


P_rec_A1 = P_total.*H_A1_blockageA.*Ts.*G_Con;
P_rec_A2 = P_total.*H_A1_blockageB.*Ts.*G_Con;
P_rec_A3 = P_total.*H_A1_blockageC.*Ts.*G_Con;
P_rec_A4 = P_total.*H_A1_blockageD.*Ts.*G_Con;

P_rec_A1(abs(receiver_angle)>FOV)=0;
P_rec_A2(abs(receiver_angle2)>FOV)=0;
P_rec_A3(abs(receiver_angle3)>FOV)=0;
P_rec_A4(abs(receiver_angle4)>FOV)=0;
P_rec_total = P_rec_A1 + P_rec_A2 + P_rec_A3 + P_rec_A4;
P_rec_dBm=10*log10(P_rec_total);
Var_power = var(P_rec_dBm);

Bn = I2 * Rb; % Noise-bandwidth (Sec^-1)%
Pamb = Iamb / R; % Ambient light power (W) %
% Shot-noise variance ( Ampere^2 )%
omega_shot = 2 * q * R * (P_rec_total + Pamb) * Bn; 
% Amplifier noise variance ( Ampere^2 )%
omega_amplifier = Iamf^2 * Ba; 
%Thermal noise variance
omega_thermal = (8*pi*295*112E-8*1E-3*.562*1E6*1.38E-23)+((16*pi^2*1.38E-23*295*1.5*(112E-8)^2*1E-8*.56281E12)/.03);
% Total noise variance ( Ampere^2 )%
omega_total = omega_amplifier + omega_shot+omega_thermal; 
% SNR %
SNR = (( R * P_rec_total ).^2)./ 10^-11;
SNRdB = 10*log10(SNR);
figure(2);
surfc(x_coord,y_coord,P_rec_dBm);
xlabel('x (m)');
ylabel('y (m)');
zlabel('Received Power (dBm)');
title('Number of blockages = 2, Pause time = 50 s');
colormap('jet')
colorbar;


function [prob_block] = integrate(x,y,pause_prob, m_min, c_min, m_max, c_max, x_min, x_max)
    ymin = m_min*x + c_min;
    ymax = m_max*x + c_max;
%     display(ymin);
%     display(ymax);
    fxy(x,y) = (pause_prob + (1-pause_prob)*(-6/5^3*y^2 + 6/5^2*y)*(-6/5^3*x^2 + 6/5^2*x));
   
    dy = int(fxy, y);
    dy1 = subs(dy, y, ymin);
    dy2 = subs(dy, y, ymax);
  
    fy = dy2 - dy1;
    
    dydx(x) = fy;
    
    dx = int(dydx);

    dx1 = subs(dx, x, x_min);
    dx2 = subs(dx, x, x_max);
    
    prob_block = dx2-dx1;
    
%     display(prob_block);

end

