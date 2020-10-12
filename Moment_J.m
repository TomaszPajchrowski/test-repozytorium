% Obliczenie momentów bezw³adnoœci na podstawie pomiarów 
% Tomasz Pajchrowski 12-02-2004
%masa ryszaj¹ca uk³ad 600g przy wszystkich p³ytach na ramieniu 0.34
%  MOMENT BEZW£ADNOŒCI 
%
%dla punktu J=m*R^2;
%dla prêta  J=(1/12)*m*L^2;
%dla walu   J=(1/2)*m*R^2;
%dla walu z otworem   J=(1/2)*m*(R^2-r^2);
%dla obracaj¹cej siê plyty J=(1/12)*b*h^3; h dl nacierajaca, b-szerokosc 
% dla obracajacego sie krazka J=(1/4)*(pi*r^4);
%
%
%
%                              _
%                           __|_|__        N1
%                     _____|_______|____   N2
%                    |__________________|  P1
%                    |__________________|  P2
%                        |______________|  P3
%      __                |______________|  P4 
%     |  |           SR9    ||  ||
%     |  |                   |  |
%     |  |                SR8|  |
%     |  |                   |  | 
%     |  | TR                |  | PR
%     |  |                  .|  |
%     |  |                  .|  |
%     |  |                  .|  |
%     |  |               SR1.|  |  
%     |  |__________________|____|_______
%     |  |                               |     
%     |  |           W                   |
%     |  | ___.___ .___.___.___ .___.___.|__ .___.___.___ .___.     
%     |  |                               |  
%     |  |                               |
%     |  |_______________________________| 
%     |  |                 |_|  |_|SR1 
%     |  |                   |  |   .
%     |  |                   |  |   .
%     |  |                   |  |   .
%     |  |                   |  |   
%     |  |                   |  |   
%     |  |                   |  |   
%     |  |                   |  |  SR8 
%     |  |                   |  |
%     |__|                _|_|_ |_|SR9__
%                        |______________| 
%                        |______________|
%                    |__________________|
%                    |__________________|   
%                           |______|
%                             |_| 
%                               
%

%Wymiary P³yt w [m] 
%P1, P2
a_P1=0.3;
b_P1=0.2;
c_P1=0.02;
%P3, P4
a_P3=0.3;
b_P3=0.16;
c_P3=0.02;


%Wymiary tarczy w [m]
d_tr=350e-3;  %Srednica
h_tr=5e-3; %wysokoœc (gruboœæ)

%Wymiary wa³u
d_w=60e-3; %srednica
h_w=115e-3;%wysokoœc

%Wymiary prêta 
d_pr=24e-3; %œrednica
h_pr=640e-3; %dlugosc

%Wymiary nakretki N2
d_N2_z=120e-3; %srednica zew
d_N2_w=24e-3;  %srednica wew
h_N2=20e-3; %grubosc
%                                                               
%                                                                                                            
%Wymiary nakretki N1 nakretka z otworami 6 i wcieciem  
d_wc=25e-3;  %srednica wciecia                         
g_wc=4.5e-3; %gleboosc wciecia
d_otw=6.5e-3;%srednica otworów
d_N1_z=50e-3;%srednica zewnetrzna 
h_N1=10e-3;  %grubosc

%Wygl¹d plyty z góry  
 
%    ________ Pb _________
%   |        |  |        |
%   |     Pa |  |        |
%   |        |__|        |
%   |                    |
%   |                    |
%   |____________________|
%
%
% Wymiary wciecia 
Pb_wc=26e-3;  
Pa_P1=200e-3/2+24e-3/2;
Pa_P3=160e-3/2+24e-3/2;
V_P1_wc=Pb_wc*Pa_P1*c_P1;
V_P3_wc=Pb_wc*Pa_P3*c_P3;

% Wymiary œrub
  d_sr_z=36e-3;
  d_sr_w=21e-3;
  h_sr=18e-3;
  %odleg³oœci œrub od œrodka uk³adu liczone od œrodka uk³adu do œrodka
  %sruby
  h_sr1=39e-3;
  h_sr2=(39+18)*1e-3;
  h_sr3=(39+18+18)*1e-3;
  h_sr4=(39+18+18+18)*1e-3;
  h_sr5=(39+18+18+18+18)*1e-3;
  h_sr6=(39+18+18+18+18+18)*1e-3;
  h_sr7=(39+18+18+18+18+18+18)*1e-3;
  h_sr8=(39+18+18+18+18+18+18+18)*1e-3;
  %9 srube pomijam ze wzgledu na ciagla zmiane pozycji 

%Odleg³oœci plyt od œrodka uk³adu liczone od œrodka uk³adu do srodka
%gruboœci p³yty
hh_N1=345e-3;
hh_N2=330e-3;
h_P1=310e-3;
h_P2=290e-3;
h_P3=270e-3;
h_P4=250e-3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE MASY W£ASCIWEJ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pi=3.1415;
m_N1=120e-3; %[kg] z pomiaru
V_N1_c   = pi*(d_N1_z/2)^2*h_N1; %ca³kowita objetosc
V_N1_dz  = pi*(d_wc/2)^2*g_wc; %objetosc wciêcia
V_N1_otw = pi*(d_otw/2)^2*h_N1; %objetosc otworu

V_N1=V_N1_c-6*V_N1_otw-V_N1_dz;  %objetoœæ kr¹zka N1

ro=m_N1/V_N1;  %masa w³aœciwa

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI PRETA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V_pr=pi*(d_pr/2)^2*h_pr;
m_pr=ro*V_pr;
J_pr=1/12*m_pr*(h_pr)^2;   % J preta

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI TARCZY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V_tr=pi*(d_tr/2)^2*h_tr;
m_tr=ro*V_tr;
J_tr=(1/2)*m_tr*(d_tr/2)^2;  % J tarczy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI WA£U
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V_w=pi*(d_w/2)^2*h_w;
m_w=ro*V_w;
J_w=(1/2)*m_w*(d_w/2)^2;   % J walu

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI PLYT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V_P1_c=a_P1*b_P1*c_P1;  
V_P1=V_P1_c-V_P1_wc; 

m_P1=ro*V_P1;
m_P2=m_P1;

J_P1=m_P1*h_P1^2;  % J plyty P1

J_P2=m_P2*h_P2^2;   % J plyty P2


V_P3_c=a_P3*b_P3*c_P3;  
V_P3=V_P3_c-V_P3_wc; 

m_P3=ro*V_P3;
m_P4=m_P3;

J_P3=m_P3*h_P3^2;   % J plyty P3

J_P4=m_P4*h_P4^2;   % J plyty P4


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI NAKRETKI N2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V_N2_c=pi*(d_N2_z/2)^2*h_N2;
V_N2_otw=pi*(d_N2_w/2)^2*h_N2;
V_N2=V_N2_c-V_N2_otw;
m_N2=ro*V_N2;

J_N2=(1/2)*m_N2*hh_N2^2; %J kr¹zka N2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI OBRACAJACYCH SIE PLYT WOKOL
%WLASNEJ OSI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b=200e-3;
h_P1=300e-3;
h_P3=160e-3;

J_P1_o=(1/12)*b*h_P1^3;
J_P2_o=J_P1_o;


J_P3_o=(1/12)*b*h_P3^3;
J_P4_o=J_P3_o; 

J_P_w=2*J_P1_o+2*J_P3_o;   % J wirujacych p³yt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI OBRACAJACYCH SIE KR¥¯KA WOKÓ£
%WLASNEJ OSI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

J_N2_o=(1/4)*pi*(d_N2_z)^4;
J_N2_w=2*J_N2_o;               % J wiruj¹cych kr¹¿ków


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI SIE KR¥¯KA N1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

J_N1=m_N1*(hh_N1)^2;         % J wiruj¹cych kr¹¿ków

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE OBJETOŒCI I MOMENTU BEZW£ADNOŒCI SRUB NAKRÊCONYCH (Pominiêto ostatni¹ dociskow¹)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V_sr_c=pi*(d_sr_z)^2*h_sr;
V_sr_o=pi*(d_sr_w)^2*h_sr;
V_sr=V_sr_c-V_sr_o;

m_sr=ro*V_sr;

J_sr1=m_sr*h_sr1^2;               
J_sr2=m_sr*h_sr2^2;
J_sr3=m_sr*h_sr3^2;
J_sr4=m_sr*h_sr4^2;
J_sr5=m_sr*h_sr6^2;
J_sr6=m_sr*h_sr6^2;
J_sr7=m_sr*h_sr7^2;
J_sr8=m_sr*h_sr8^2;

J_sr=2*(J_sr1+J_sr2+J_sr3+J_sr4+J_sr5+J_sr6+J_sr7);   % J srub



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WYZNACZENIE CA£KOWITEGO MOMENTU BEZW£ADNOŒCI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  J_s=0.046;
  J_pr;  % J prêta
  J_tr;  % J tarczy
  J_w;   % J wa³u
  J_P1;  % J plyty 1
  J_P2;  % J plyty 2
  J_P3;  % J plyty 3
  J_P4;  % J plyty 4
  J_N2;  % J kr¹¿ka N2
  J_P_w; % J plyt wiruj¹cych 
  J_N2_w; %J kr¹zka wiruj¹cego
  J_sr;   % J œrub

 J_st=J_s+J_pr+J_tr+J_w+J_N1+J_N2+J_N2_w+J_sr;
 %J_zm=2*(J_P1+J_P2+J_P3+J_P4+J_P_w);
 J_zm=2*(J_P1+J_P2+J_P3+J_P4+J_P_w);
 
 J=J_st+J_zm;







