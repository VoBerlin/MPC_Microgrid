clear 
clc
close all
%dc voltage
Vdc = 600;
%sample time
Ts = 10e-6;
%nominal frequency
w_nom = 2*pi*50;
%nominal voltage
V_nom = 220*sqrt(2);
%switching ratio, filter req
f_c = 5000;
% droop
%m_p1 = 4.187e-3; %1.5kw, 2% (số liệu Bá Linh)
droopDivide = 1;
droopDivide2 = 10;
m_p1 = 9.4e-5/droopDivide;
m_p2 = 9.4e-5/droopDivide;
m_p3 = 12.5e-5/droopDivide;
m_p4 = 12.5e-5/droopDivide;
%voltage droop %0.5 kvar, 5%
%n_q1 = 0.02; %Số liệu Bá Linh
n_q1 = 1.3e-3/droopDivide2;
n_q2 = 1.3e-3/droopDivide2;
n_q3 = 1.5e-3/droopDivide2;
n_q4 = 1.5e-3/droopDivide2;
w_c_high = 2*pi*50;
kL = 1e-5;
LD_ref1 = 800e-6;

%voltage controller values 
F = 1;
%LC filter (Il max = 1.1 I nom)
R_f = 0.1;
L_f = 1.35e-3;
C_f = 50e-6;
%PI var (k_u = 0.09, tu = 8.116ms, nichols ziegler)
K_p1 = 0.1;
K_i1 = 420;

K_p2 = K_p1;
K_i2 = K_i1;
K_p3 = 0.05;
K_i3 = 390;
K_p4 = K_p3;
K_i4 = K_i3;

UpSatV12 = 100;
LowSatV12 = -100;

%current PI var
K_pi1 = 5;
K_ii1 = 5e3;

K_pi2 = K_pi1;
K_ii2 = K_ii1;
K_pi3 = 10.5;
K_ii3 = 16e3;
K_pi4 = K_pi3;
K_ii4 = K_ii3;

UpSatI12 = 400;
LowSatI12 = -100;

%L_in and R_in
L_in1 = 0.35e-3;
R_in1 = 0.03;
L_in2 = 0.35e-3;
R_in2 = 0.03;
L_in3 = 0.35e-3;
R_in3 = 0.03;
L_in4 = 0.35e-3;
R_in4 = 0.03;

%Pinning gain
b1w = 1;
b2w = 0;
b3w = 0;
b4w = 0;

b1v = 1;
b2v = 0;
b3v = 0;
b4v = 0;

%coupling gain
cf = 60;
cv = 60;

%adjuncancy matrix
a12 = 0;
a21 = 1;
a23 = 0;
a32 = 1;
a14 = 0;
a41 = 1;
a43 = 0;
a34 = 0;

lo_co = 0.2; %0.05
pq_gain = 3/2;
secondary = 1; %for voltage 
secondary2 = 1; %for frequency 
time_thresh = 0.6;
%save mat file
save('init.mat');

%TODO 
%Remove filter
%Anti windup

