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
cf = 100;
cv = 100;

%adjuncancy matrix

%adjuncancy matrix formation
A = [0 1 1 1 ; 1 0 1 1 ; 1 1 0 1 ; 1 1 1 0];

%Lambda initialization
lambda3 = [1.5e-3 1.5e-3 1.5e-3 1.5e-3]';
lambda2 = [0.8e-2 0.8e-2 0.8e-2 0.8e-2]';
lambda1 = [1 1 1 1]';

Pmax = [45e3 45e3 37e3 37e3]';

Tsamp = 0.1; %secondary

lo_co = 0.1; %PQ low pass filter
time_thresh = 0.8;
load_on = 1;
load_off = 21;
N=5;
%save mat file
save('init.mat');
%todo: calculate theta k+1 and then Pk+1