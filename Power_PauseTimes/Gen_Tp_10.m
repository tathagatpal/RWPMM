syms x y c_min c_max m_max m_min d1 d2 pause_prob;
syms a b r d d_b m c;

importfile('tp_10');

t_p = 10;
%Pause time = 10 seconds
x_block1 = [4.8514      1.0167      1.0167           0     0.75479      2.0068      2.0068     0.48089     0.48089     0.75808     0.75808           0      0.5389      1.7413      1.7413       1.518      1.4842      1.4842           0     0.28242      1.9778      1.9778      3.6336           5      4.8549      4.8549       4.699      3.6076      3.6076      0.6312      0.6312           0       1.122      2.2455      2.2455     0.72831     0.28716     0.28716      1.6168      3.1055      3.1055      4.7394      4.7394           0      0.9142      0.9142           0      2.2069      3.3889      3.3889           0      2.1063      2.1063           0    0.079618    0.079618           0           5      4.3181      4.3181      4.4188      4.7031      4.7031           5      3.0815      3.0815           5      3.4501      3.4501           5       1.393       1.393      3.6213      3.6213      4.2437      4.2437           5       1.216       1.216     0.73605     0.22208     0.22208           0      2.1146      3.4944      3.4944           0     0.15244     0.15244     0.32944     0.40194     0.40194      2.8016      4.4503      4.4503      2.3197      1.9634      1.9634       2.926       2.926           5      3.4222      3.4222     0.78431     0.78431      2.6199      2.6199           5      3.5807      2.8217      2.8217      4.4692      4.4692      3.7017      3.1447      3.1447      4.4245       4.586       4.586           5      4.6771      2.8799      2.8799      2.5538      1.1278      1.1278      3.5511      3.5511      4.9582      4.9582      4.2167       2.446       2.446      2.4977      2.5602      2.5602     0.78371    0.098748    0.098748           0     0.69213      1.0066      1.0066           5      3.6147      3.6147           5      3.6082      3.4557      3.4557      3.4379      3.1432      3.1432     0.99107     0.99107      1.0338      2.6456      2.6456           5      2.6326      2.6326           5      2.1727      2.1727           5      4.1234      4.1234      4.0335      1.2901      1.2901      1.6145      2.0902      2.0902           5      4.2703      4.2703       1.692       1.692      2.9936      4.3596      4.3596           5      1.0389      1.0389           5      3.6036      3.6036      4.7945      4.7945      4.7365       1.907       1.907      1.3999           0     0.03016     0.03016      1.3748      1.9191      1.9191      1.7041      1.7041      2.3489      3.3009      3.3009      2.9949      2.5729      2.5729           0     0.13919     0.13919       0.386     0.97417     0.97417];
y_block1 = [4.7126       2.259       2.259     0.96252           0      1.5966      1.5966      4.7572      4.7572     0.75181     0.75181     0.31238           0     0.69696     0.69696           5       4.348       4.348      4.8958           5      4.3743      4.3743           5      4.4836      4.4288      4.4288           5      1.0015      1.0015        2.46        2.46      3.3745           5      3.3723      3.3723           5      4.5267      4.5267           5      4.4701      4.4701      3.1712      3.1712      2.9655      2.9259      2.9259      2.0688           0      1.1081      1.1081      2.2821      3.0117      3.0117     0.65104     0.56181     0.56181     0.56766     0.93462     0.98467     0.98467           0      2.7798      2.7798      2.6147      1.5479      1.5479     0.72716    0.064134    0.064134    0.076476      0.1052      0.1052      2.0879      2.0879    0.021543    0.021543     0.31565      1.7872      1.7872           0      1.9139      1.9139       1.732           0      1.1301      1.1301      3.3492       3.446       3.446           5      4.3635      4.3635           5      4.5626      4.5626           0     0.76301     0.76301      2.5564      2.5564      3.4965      4.2117      4.2117     0.92836     0.92836      1.9015      1.9015      3.8425           5       4.381       4.381       2.935       2.935           5      3.5011      3.5011           5      4.8108      4.8108      4.9171           5      4.5386      4.5386           5      2.9821      2.9821      4.2312      4.2312      1.1493      1.1493           0      2.7444      2.7444           5      2.2729      2.2729           5      3.9485      3.9485      3.4555           0      1.5701      1.5701      2.1609      2.3658      2.3658      3.6798           5      4.8554      4.8554           5      2.6079      2.6079    0.098853    0.098853           0       3.725       3.725      3.1966      2.6653      2.6653      2.8734       3.122       3.122      4.4747      4.8941      4.8941           5      1.7664      1.7664           0      2.5905      2.5905      1.7823      1.5796      1.5796      2.5336      2.5336           5      2.4115      2.4115      2.2687      1.3851      1.3851      2.5477      2.9575      2.9575       4.924       4.924           5      1.2912      1.2912           0      3.5642       3.641       3.641           5      4.4499      4.4499      2.0001      2.0001           0      2.9533      2.9533           5      2.1783      2.1783      1.7046       1.679       1.679           0       4.001       4.001];
time_block1 = [0      4.5525123      14.552513       16.20013      17.423302      19.452258      29.452258      32.961913      42.961913      46.976859      56.976859      57.853096       58.47599      59.865753      69.865753      74.174576      74.827455      84.827455      86.409536      86.710576      88.517728      98.517728      100.28778      101.74852      101.90361      111.90361      112.49569      116.64042      126.64042      129.95495      139.95495      141.06611      143.04125      145.01907      155.01907      157.24423      157.89124      167.89124      169.30263      170.88279      180.88279      182.97012      192.97012      197.71402      198.62909      208.62909      209.88218      212.90715      214.52738      224.52738      228.11389      230.34302      240.34302       243.5068      243.62638      253.62638      253.70622      258.71966      259.40341      269.40341      270.39322      273.18754      283.18754      283.52725      285.72239      295.72239      297.80905      299.49477      309.49477      311.04467      314.65179      324.65179       327.6345       337.6345      339.79252      349.79252      350.60398      354.66405      364.66405      366.51458      368.49632      378.49632      378.78339      381.51679      383.30031      393.30031      397.43975      397.62033      407.62033      409.18435      409.82502      419.82502      422.30763       424.0134       434.0134        439.049      439.89111      449.89111      451.92653      461.92653      464.20363        465.936        475.936      480.14772      490.14772      492.22532      502.22532      505.29654      507.12798      508.10741      518.10741      520.29953      530.29953      532.50258      534.10164      544.10164      546.07258      546.32136      556.32136      556.74875      557.08217       558.9376       568.9376       569.5026      571.97356      581.97356      584.69989      594.69989      598.08779      608.08779      609.45557      612.72161      622.72161      624.97782      627.70567      637.70567      640.96037       642.2153       652.2153       652.7181      656.24221      657.84345      667.84345      671.88031      673.28066      683.28066      685.18999      687.10832      687.31848      697.31848      697.46421      699.87444      709.87444      713.18001      723.18001      723.28772      727.34644      737.34644       739.7594      742.18565      752.18565      754.56215      757.40032      767.40032      770.53452      771.50628      781.50628      781.64519      785.88573      795.88573      797.68171      800.31549      810.31549      813.33549      814.09284      824.09284      826.84192      836.84192      839.63066      842.55744      852.55744      853.21358      857.27204      867.27204      871.40021      872.85548      882.85548      885.15448      895.15448      895.25006       899.9149       909.9149      911.30217      915.13146      915.21396      925.21396      927.12572      927.89964      937.89964      940.35879      950.35879      952.46028      955.56324      965.56324      967.63271      970.48582      980.48582      983.10195      983.24348      993.24348      994.94052      998.98452           1000];
pause_block1 = zeros(1,length(time_block1));

x_block2 = [2.7282           0     0.47968     0.47968      1.8326      1.8326           5      4.5228      4.5228           5      3.8372      3.8372           5      3.5688      3.5688      3.8191      3.8191      4.3059           5      1.9069      1.9069      2.7074      3.6601      3.6601           5       3.764       3.764      4.4986           5      2.4444      2.4444      3.2076      3.4653      3.4653           5      2.4192      2.4192           0     0.66975     0.77628     0.77628           0     0.22811      3.7279      3.7279      4.7587      4.7587      3.6206        2.88        2.88      1.4096           0     0.11789     0.11789           0      1.2093       1.467       1.467       1.735      2.8378      2.8378      2.6842       2.471       2.471      3.5735      4.1558      4.1558           5      4.1951      4.1951      1.9966      1.9966     0.32686           0     0.54454     0.54454      1.0009       3.503       3.503      0.5432      0.5432       2.996       2.996      3.0082      4.1863      4.1863      4.0626      3.9857      3.9857           0     0.21624     0.40169     0.40169           5      4.9266      4.9266      3.0176      3.0176      2.3545           0      1.7212      1.7212      4.8465           5      4.1653      4.1653      2.5746      2.5746      2.2704      1.4088      1.4088           0      3.1414      3.1414           5      3.8158      3.8158           5       3.047       3.047           5      2.6661      2.6661      2.4378     0.18211     0.18211           0      2.2619      2.2619      4.4854      4.4854      4.8957           5      4.9502      4.9502           5           0     0.48134     0.48134      2.4966      2.4966           5      4.6916      4.6916      2.2659      2.2659    0.074164    0.074164      1.3034      2.9922      2.9922           5      3.1843      3.1843      2.4823      2.3638      2.3638      4.8377      4.8377      4.8449           5      4.6166      4.5398      4.5398           5      4.9062       2.846       2.846   0.0070678   0.0070678           0     0.75714      2.8727      2.8727      4.3185      4.6166      4.6166      3.2886      3.2886           5      4.4029      2.0847      2.0847      2.5501      2.5501      4.3731           5      3.9001      3.9001     0.11453     0.11453     0.43233     0.64724     0.64724           0      4.1274      4.1274           5      2.7689      2.7689      3.6459           5      4.9161      4.9161      2.4906      2.4906      2.6047      2.6047           0     0.20681     0.20681      3.2295      3.2295      2.4005      1.3778      1.3778           0      1.7892      1.7892];
y_block2 = [1.2756      1.0082     0.96118     0.96118       2.477       2.477      2.8186        2.87        2.87      2.4277      1.3499      1.3499      2.1787       3.199       3.199     0.29364     0.29364           0     0.41863      2.2843      2.2843           0      2.7187      2.7187      3.5585      4.3332      4.3332           5      4.5449       2.225       2.225           5      4.0633      4.0633      3.5216      2.6108      2.6108     0.56607           0    0.090031    0.090031    0.020447           0     0.31371     0.31371      2.3056      2.3056           5      3.2468      3.2468           5      3.3193      3.1787      3.1787      3.3405           5      4.6463      4.6463           5      3.5447      3.5447           5        2.98        2.98           0       1.574       1.574      2.4473      3.2799      3.2799     0.77308     0.77308           0     0.15133     0.40345     0.40345           0      2.2119      2.2119      4.3351      4.3351      4.9804      4.9804           5      3.1156      3.1156           0       1.939       1.939      4.8425           5      4.8649      4.8649      3.7114       3.693       3.693      0.4322      0.4322           0      1.5347      2.6565      2.6565           5      4.8849       4.259       4.259      1.5054      1.5054           0      4.2644      4.2644       3.929       3.181       3.181      3.5561       3.795       3.795      3.0881      1.9223      1.9223       3.235      4.8037      4.8037           5      3.0602      3.0602      3.1182      3.8386      3.8386      1.3994      1.3994           0     0.35575     0.52549     0.52549     0.53604      1.5962      1.6983      1.6983      1.4022      1.4022      1.7261       1.766       1.766      2.4761      2.4761      1.2473      1.2473           0      1.7138      1.7138      3.2128      4.5685      4.5685           0     0.77147     0.77147      4.9332      4.9332           5      3.5596           0     0.71252     0.71252      0.1207           0      2.6496      2.6496      1.2103      1.2103      1.1991           0      3.3506      3.3506           5        4.66        4.66      1.6841      1.6841     0.43556           0      1.6912      1.6912      4.4735      4.4735           5      4.8189      4.5012      4.5012      3.7654      3.7654           5      4.1652      4.1652      3.9263      2.4029      2.4029      2.7195      3.5289      3.5289           5      2.7285      2.5878      2.5878      3.9297      3.9297      1.5723      1.5723      2.1197      2.1631      2.1631     0.77758     0.77758           0     0.95935     0.95935      2.0357      3.4334      3.4334];
time_block2 = [0      2.7413179      3.223294      13.223294      15.255056      25.255056      28.440811      28.920741      38.920741      39.571374      41.156896      51.156896      52.584881      54.342499      64.342499       67.25859       77.25859      77.827114      78.637648      82.249859      92.249859      94.670348      97.551142      107.55114      109.13251       110.5912       120.5912      121.58333      122.26048      125.71197      135.71197         138.59      139.56151      149.56151      151.18902      153.92579      163.92579      167.09338      167.97031      168.10978      178.10978      178.88917      179.11819      182.63199      192.63199      194.87483      204.87483      207.79973      209.70294      219.70294      221.99113      224.18471      224.36816      234.36816      234.56834      236.62172      237.05933      247.05933      247.50308      249.32898      259.32898      260.79232      262.82353      272.82353      276.00095      277.67918      287.67918      288.89384      290.05189      300.05189      303.38621      313.38621      315.22625      315.58644      316.18651      326.18651      326.79565      330.13524      340.13524      343.77782      353.77782      356.31406      366.31406      366.33718      368.55958      378.55958       381.6776      383.61814      393.61814      398.54922      398.81675       399.0462       409.0462      413.78697      413.86268      423.86268      427.64118      437.64118       438.4327      441.24319      443.29775      453.29775      457.20403      457.39591      458.43925      468.43925      471.61929      481.61929      483.15508      487.50566      497.50566      498.95387      502.18312      512.18312      514.07915      515.28727      525.28727      526.66646      528.94093      538.94093      541.29407      544.10622      554.10622      554.40723      557.38232      567.38232      567.57345       569.9473       579.9473      583.24787      593.24787      594.70615      595.07688      595.25377      605.25377      605.30465      610.41581      610.90785      620.90785      622.94477      632.94477      635.46901      635.77999      645.77999      648.30745      658.30745      660.82013      670.82013      672.57137      674.97745      684.97745      687.48309      689.74909      699.74909      704.37116      705.15168      715.15168      719.99321      729.99321      730.06038      731.50909       735.0893      735.80593      745.80593      746.55559      746.70848      750.06478      760.06478      763.24775      773.24775      773.26099      774.67913      778.64171      788.64171      790.83512       791.2873       801.2873       804.5461       814.5461      816.66452      817.40358      820.27315      830.27315       833.0941       843.0941      844.99163      845.64411      846.78902      856.78902       860.6454       870.6454      871.92021      872.78227      882.78227      883.47218       887.8717       897.8717      898.79999      901.17337      911.17337      912.88601       915.5305      915.69427      925.69427      928.46626      938.46626      940.82646      950.82646      953.48804      953.69936      963.69936      967.02447      977.02447      978.16103      979.56329      989.56329      991.31167      993.58215           1000];
pause_block2 = zeros(1, length(time_block2));

for ind=2:length(time_block1)
    if(time_block1(ind) - time_block1(ind-1) == t_p)
        pause_block1(ind-1) = 1;
    else
        pause_block1(ind-1) = 0;
    end
end

for ind=2:length(time_block2)
    if(time_block2(ind) - time_block2(ind-1) == t_p)
        pause_block2(ind-1) = 1;
    else
        pause_block2(ind-1) = 0;
    end
end

p = [1.25 3.75 3.75 1.25]; 
q = [1.25 1.25 3.75 3.75]; %Location of LED
a = 2.5; b = 2.5; %Location of PD
r = 0.4; %Blockage radius

pause_prob = 0.79; %Tp = 10s
% pause_prob = 0.97; %Tp = 100s
% pause_prob = 0.79; %Tp = 300s
% pause_prob = 0.95; %Tp = 50s
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

    prob_totA = prob_total1 + prob_total2;
    
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
    
    %Calculation of probability blockage #Simulation
%     prob_block_A1 = zeros(1,length(dist_LEDA1));
%     for ind = 1:length(dist_LEDA1)
%         if(dist_LEDA1(ind) ~= 0)
% %             prob_block_A1(ind) = subs(prob_totA, d, dist_LEDA1(ind));
%             if(dist_LEDA1(ind) >= d_startA && dist_LEDA1(ind) <= d_midA)
%               prob_block_A1(ind) = subs(prob_total1, d, dist_LEDA1(ind));  
%             elseif(dist_LEDA1(ind) >= d_midA && dist_LEDA1(ind) <= d_endA)
%               prob_block_A1(ind) = subs(prob_total2, d, dist_LEDA1(ind));  
%             end
%         else
%             prob_block_A1(ind) = 0;
%         end
%     end
%     
%     prob_block_A2 = zeros(1,length(dist_LEDA2));
%     for ind = 1:length(dist_LEDA2)
%         if(dist_LEDA2(ind) ~= 0)
%             if(dist_LEDA2(ind) >= d_startA && dist_LEDA2(ind) <= d_midA)
%               prob_block_A2(ind) = subs(prob_total1, d, dist_LEDA2(ind));  
%             elseif(dist_LEDA2(ind) >= d_midA && dist_LEDA2(ind) <= d_endA)
%               prob_block_A2(ind) = subs(prob_total2, d, dist_LEDA2(ind));  
%             end
%         else
%             prob_block_A2(ind) = 0;
%         end
%     end
    
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

    prob_totB = prob_total1 + prob_total2;
    
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
    
    
    %Calculation of probability blockage #Simulation
%     prob_block_B1 = zeros(1,length(dist_LEDB1));
%     for ind = 1:length(dist_LEDB1)
%         if(dist_LEDB1(ind) ~= 0)
%             if(dist_LEDB1(ind) >= d_startB && dist_LEDB1(ind) <= d_midB)
%               prob_block_B1(ind) = subs(prob_total1, d, dist_LEDB1(ind));  
%             elseif(dist_LEDB1(ind) >= d_midB && dist_LEDB1(ind) <= d_endB)
%               prob_block_B1(ind) = subs(prob_total2, d, dist_LEDB1(ind));  
%             end
%         else
%             prob_block_B1(ind) = 0;
%         end
%     end
%     
%     prob_block_B2 = zeros(1,length(dist_LEDB2));
%     for ind = 1:length(dist_LEDB2)
%         if(dist_LEDB2(ind) ~= 0)
%             if(dist_LEDB2(ind) >= d_startB && dist_LEDB2(ind) <= d_midB)
%               prob_block_B2(ind) = subs(prob_total1, d, dist_LEDB2(ind));  
%             elseif(dist_LEDB2(ind) >= d_midB && dist_LEDB2(ind) <= d_endB)
%               prob_block_B2(ind) = subs(prob_total2, d, dist_LEDB2(ind));  
%             end
%         else
%             prob_block_B2(ind) = 0;
%         end
%     end
    
  
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
    
    prob_totC = prob_total1 + prob_total2;

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
    
    %Calculation of probability blockage #Simulation
%     prob_block_C1 = zeros(1,length(dist_LEDC1));
%     for ind = 1:length(dist_LEDC1)
%         if(dist_LEDC1(ind) ~= 0)
%             if(dist_LEDC1(ind) >= abs(d_startC) && dist_LEDC1(ind) <= abs(d_midC))
%               prob_block_C1(ind) = subs(prob_total1, d, dist_LEDC1(ind));  
%             elseif(dist_LEDC1(ind) >= abs(d_midC) && dist_LEDC1(ind) <= abs(d_endC))
%               prob_block_C1(ind) = subs(prob_total2, d, dist_LEDC1(ind));  
%             end
%         else
%             prob_block_C1(ind) = 0;
%         end
%     end
%     
%     prob_block_C2 = zeros(1,length(dist_LEDC2));
%     for ind = 1:length(dist_LEDC2)
%         if(dist_LEDC2(ind) ~= 0)
%             if(dist_LEDC2(ind) >= abs(d_startC) && dist_LEDC2(ind) <= abs(d_midC))
%               prob_block_C2(ind) = subs(prob_total1, d, dist_LEDC2(ind));  
%             elseif(dist_LEDC2(ind) >= abs(d_midC) && dist_LEDC2(ind) <= abs(d_endC))
%               prob_block_C2(ind) = subs(prob_total2, d, dist_LEDC2(ind));  
%             end
%         else
%             prob_block_C2(ind) = 0;
%         end
%     end
   
    
    
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
    
    prob_totD = prob_total1 + prob_total2;
    
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
    
    %Calculation of probability blockage #Simulation
%     prob_block_D1 = zeros(1,length(dist_LEDD1));
%     for ind = 1:length(dist_LEDD1)
%         if(dist_LEDD1(ind) ~= 0)
%             if(dist_LEDD1(ind) >= abs(d_startD) && dist_LEDD1(ind) <= abs(d_midD))
%               prob_block_D1(ind) = subs(prob_total1, d, dist_LEDD1(ind));  
%             elseif(dist_LEDD1(ind) > abs(d_midD) && dist_LEDD1(ind) <= abs(d_endD))
%               prob_block_D1(ind) = subs(prob_total2, d, dist_LEDD1(ind));  
%             end
%         else
%             prob_block_D1(ind) = 0;
%         end
%     end
%     
%     prob_block_D2 = zeros(1,length(dist_LEDD2));
%     for ind = 1:length(dist_LEDD2)
%         if(dist_LEDD2(ind) ~= 0)
%             if(dist_LEDD2(ind) >= abs(d_startD) && dist_LEDD2(ind) <= abs(d_midD))
%               prob_block_D2(ind) = subs(prob_total1, d, dist_LEDD2(ind));  
%             elseif(dist_LEDD2(ind) >= abs(d_midD) && dist_LEDD2(ind) <= abs(d_endD))
%               prob_block_D2(ind) = subs(prob_total2, d, dist_LEDD2(ind));  
%             end
%         else
%             prob_block_D2(ind) = 0;
%         end
%     end


end %end if


end %end for


% p_desired = interp1(dist_plotA, prob_finalA, 1.6)


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
    
prob_blockA1 = zeros(1, length(dist_LEDA1));    
for index = 1:length(dist_LEDA1)
    if (dist_LEDA1(index) ~= 0)
        prob_blockA1(index) = interp1(dist_plotA, prob_finalA, dist_LEDA1(index));
    else
        prob_blockA1(index) = 0;
    end
end

prob_blockB1 = zeros(1, length(dist_LEDB1));    
for index = 1:length(dist_LEDB1)
    if (dist_LEDB1(index) ~= 0)
        prob_blockB1(index) = interp1(dist_plotB, prob_finalB, dist_LEDB1(index));
    else
        prob_blockB1(index) = 0;
    end
end

prob_blockC1 = zeros(1, length(dist_LEDC1));    
for index = 1:length(dist_LEDC1)
    if (dist_LEDC1(index) ~= 0)
        prob_blockC1(index) = interp1(dist_plotC, prob_finalC, dist_LEDC1(index));
    else
        prob_blockC1(index) = 0;
    end
end

prob_blockD1 = zeros(1, length(dist_LEDD1));    
for index = 1:length(dist_LEDD1)
    if (dist_LEDD1(index) ~= 0)
        prob_blockD1(index) = interp1(dist_plotD, prob_finalD, dist_LEDD1(index));
    else
        prob_blockD1(index) = 0;
    end
end


prob_blockA2 = zeros(1, length(dist_LEDA2));    
for index = 1:length(dist_LEDA2)
    if (dist_LEDA2(index) ~= 0)
        prob_blockA2(index) = interp1(dist_plotA, prob_finalA, dist_LEDA2(index));
    else
        prob_blockA2(index) = 0;
    end
end

prob_blockB2 = zeros(1, length(dist_LEDB2));    
for index = 1:length(dist_LEDB2)
    if (dist_LEDB2(index) ~= 0)
        prob_blockB2(index) = interp1(dist_plotB, prob_finalB, dist_LEDB2(index));
    else
        prob_blockB2(index) = 0;
    end
end

prob_blockC2 = zeros(1, length(dist_LEDC2));    
for index = 1:length(dist_LEDC2)
    if (dist_LEDC2(index) ~= 0)
        prob_blockC2(index) = interp1(dist_plotC, prob_finalC, dist_LEDC2(index));
    else
        prob_blockC2(index) = 0;
    end
end

prob_blockD2 = zeros(1, length(dist_LEDD2));    
for index = 1:length(dist_LEDD2)
    if (dist_LEDD2(index) ~= 0)
        prob_blockD2(index) = interp1(dist_plotD, prob_finalD, dist_LEDD2(index));
    else
        prob_blockD2(index) = 0;
    end
end


prob_blockA2(214:221) = 0;
prob_blockB2(214:221) = 0;
prob_blockC2(214:221) = 0;
prob_blockD2(214:221) = 0;

prob_blockA = prob_blockA1 + prob_blockA2;
prob_blockB = prob_blockB1 + prob_blockB2;
prob_blockC = prob_blockC1 + prob_blockC2;
prob_blockD = prob_blockD1 + prob_blockD2;

%Power Calculation_________________________________________________________

theta =70;

I2 = 0.562; % Noise-bandwidth factor 
Rb = 115200; % Data rate (Bit per second)
Iamb = 7E-8; % Ambient light power (Ampere) %
R = 0.55; % Photodiode responsivity (A/W )%
q_c = 1.60E-19; % Electron charge (C)
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

% [XT,YT]=meshgrid([lx/4 3*lx/4],[ly/4 3*ly/4]);
% Nx=lx*5; Ny=ly*5;
% x_coord = linspace(0,lx,Nx);
% y_coord = linspace(0,ly,Ny);
% [XR,YR] = meshgrid(x_coord,y_coord);
% D1 = sqrt((XR-XT(1,1)).^2+(YR-YT(1,1)).^2+h^2);
% D2 = sqrt((XR-XT(1,2)).^2+(YR-YT(1,2)).^2+h^2);
% D4 = sqrt((XR-XT(2,1)).^2+(YR-YT(2,1)).^2+h^2);
% D3 = sqrt((XR-XT(2,2)).^2+(YR-YT(2,2)).^2+h^2);

D1 = sqrt((p(1)-a)^2 + (q(1)-b)^2 + h^2);
D2 = sqrt((p(2)-a)^2 + (q(2)-b)^2 + h^2);
D3 = sqrt((p(3)-a)^2 + (q(3)-b)^2 + h^2);
D4 = sqrt((p(4)-a)^2 + (q(4)-b)^2 + h^2);

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


H_A1_blockageA = H_A1.*(1-prob_blockA);
H_A1_blockageB = H_A2.*(1-prob_blockB);
H_A1_blockageC = H_A3.*(1-prob_blockC);
H_A1_blockageD = H_A4.*(1-prob_blockD);


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
omega_shot = 2 * q_c * R .* (P_rec_total + Pamb) * Bn; 
% Amplifier noise variance ( Ampere^2 )%
omega_amplifier = Iamf^2 * Ba; 
%Thermal noise variance
omega_thermal = (8*pi*295*112E-8*1E-3*.562*1E6*1.38E-23)+((16*pi^2*1.38E-23*295*1.5*(112E-8)^2*1E-8*.56281E12)/.03);
% Total noise variance ( Ampere^2 )%
omega_total = omega_amplifier + omega_shot+omega_thermal; 
% SNR %
SNR = (( R * P_rec_total ).^2)./ 10^-11;
SNRdB = 10*log10(SNR);

time_block1 = [0      1.8762318        4.19374       14.19374      17.581305      27.581305      30.476803      31.706301      41.706301      42.157283      45.702783      55.702783      59.018168       59.49452       69.49452      72.171628      73.315017      83.315017      84.951433      85.767306      95.767306      98.362292      99.154844      109.15484      110.56267      111.56161       114.7752       124.7752      127.33971      127.57347      130.45025      140.45025      142.53915      152.53915      153.66291      157.31345      167.31345      170.99071      171.54134      181.54134      181.99101      185.42806      195.42806       197.5827      199.04618      209.04618      210.50809      213.25564      223.25564      226.07459      226.61839      228.59625      238.59625      240.66238      243.32675      253.32675      256.39622      256.73808      266.73808      270.36402      280.36402      282.49607      292.49607      294.88974      298.24423      308.24423      310.97626      312.10171      313.23031      323.23031       324.6625      325.26885      335.26885      336.64224      337.49601      347.49601      348.41302      351.26002      361.26002      364.56074      364.70401      374.70401      374.90559      379.67651      389.67651      391.73165      392.37388      402.37388      404.27591      406.58433      407.72703      417.72703       418.8374      420.76491      430.76491      433.21806      443.21806      447.53464      448.95973      458.95973      463.13679      464.33654      474.33654      475.71471       477.4029       487.4029      489.48175      489.86211      492.09888      502.09888      505.58392      505.75557      515.75557      516.43986      518.39548      519.14091      529.14091      532.27249      542.27249      544.91794      554.91794      556.69773      557.25206      557.89642      567.89642      568.90929      573.17994      573.34606      583.34606      588.22507      588.47158      598.47158       598.7181      602.89588      612.89588      613.84792       616.3424      618.77407      628.77407      629.93942      631.46706      641.46706      642.85121      643.63239      644.24321      654.24321      655.48028      658.03182      668.03182      671.07146      671.19266      672.59659      682.59659         684.09      684.79231      694.79231      695.35489      698.64165      708.64165      710.63121      711.92742      713.00928      723.00928      725.11102      735.11102      735.88404      739.84118      749.84118      753.64666      755.84054      765.84054      766.69723      770.75875      780.75875      782.09422       784.6996       794.6996      795.11505      796.54177      797.26424      807.26424        807.499       811.4986       821.4986      822.62553      822.68966      825.40519      835.40519      837.77618      847.77618      850.99909      860.99909      866.02938      866.76888      876.76888      880.31983      880.57754      890.57754      893.44981      894.46532      904.46532      906.96321      916.96321      919.09836      929.09836      930.78465      931.97212      941.97212      946.11965      946.44871      947.13478      957.13478      960.20074      970.20074      972.23886      973.54752      974.18882      984.18882      984.69821      990.17359           1000];

figure(2);
plot(time_block1, P_rec_dBm, 'linewidth', 1.5);
xlabel('Time (s)'); ylabel('Power (dBm)');
title('Received Power (dBm), Simulation time = 1000s, Pause time = 10s');


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

