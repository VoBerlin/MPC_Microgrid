clear 
clc
close all
%dc voltage
Vdc = 600;
%sample time simulation
Ts = 10e-6;
%nominal frequency
w_nom = 2*pi*50;
%nominal voltage
V_nom = 220*sqrt(2);
%sampling frequency
f_c = 50e3;
%fd_s = 100e3;s
% droop
%m_p1 = 4.187e-3; %1.5kw, 2% (số liệu Bá Linh)
droopDivide = 1;
droopDivide2 = 20;
m_p1 = 9.4e-5/droopDivide;
m_p2 = 9.4e-5/droopDivide;
m_p3 = 11.4e-5/droopDivide;
m_p4 = 11.4e-5/droopDivide;
%voltage droop %0.5 kvar, 5%
%n_q1 = 0.02; %Số liệu Bá Linh
n_q1 = 1.3e-3/droopDivide2;
n_q2 = 1.3e-3/droopDivide2;
n_q3 = 1.5e-3/droopDivide2;
n_q4 = 1.5e-3/droopDivide2;
w_c_high = 2*pi*50;
kL = 1e-7;
LD_ref1 = 50e-6;


%LC filter (Il max = 1.1 I nom)
R_f = 0.1;
L_f = 1.35e-3;
C_f = 50e-6;

%L_in and R_in
L_in1 = 0.35e-3;
R_in1 = 0.03;
L_in2 = 0.35e-3;
R_in2 = 0.03;
L_in3 = 0.35e-3;
R_in3 = 0.03;
L_in4 = 0.35e-3;
R_in4 = 0.03;

%adjancency DAPI
a12 = 1;
a13 = 1;
a14 = 1;
a21 = 1;
a23 = 1;
a24 = 1;
a31 = 1;
a32 = 1;
a34 = 1;
a41 = 1;
a42 = 1;
a43 = 1;

%Pinning gain
b1w = 1;
b2w = 1;
b3w = 1;
b4w = 1;

b1v = 1;
b2v = 1;
b3v = 1;
b4v = 1;

%coupling gain
cf = 100;
cv = 100;

%adjuncancy matrix

%adjuncancy matrix formation
A = [0 1 1 1 ; 1 0 1 1 ; 1 1 0 1 ; 1 1 1 0];

%Lambda initialization
lambda3 = 62.5*[1.5e-3 1.5e-3 1e-3 1.1e-3]';
lambda2 = 30.5*[0.8e-2 0.8e-2 0.5e-2 0.5e-2]';
lambda1 = 5.5*[1 1 0.8 0.8]';

Pmax = [45e3 45e3 37e3 37e3]';

Tsamp = 0.1; %secondary

lo_co = 0.1; %PQ low pass filter
time_thresh = 0.2;
load_on = 0.21;
load_off = 28;
N=7;
%save mat file
save('init.mat');
%todo: calculate theta k+1 and then Pk+1