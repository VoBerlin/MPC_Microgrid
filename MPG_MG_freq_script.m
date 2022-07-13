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
f_c = 40e3;
%fd_s = 100e3;s
% droop
%m_p1 = 4.187e-3; %1.5kw, 2% (số liệu Bá Linh)
droopDivide = 1;
droopDivide2 = 1;
%{
m_p1 = 9.4e-5/droopDivide;
m_p2 = 9.4e-5/droopDivide;
m_p3 = 12.5e-5/droopDivide;
m_p4 = 12.5e-5/droopDivide;
%}
m_p1 = 1e-4;
m_p2 = 0.85e-4;
m_p3 = 0.85e-4;
m_p4 = 1e-4;

%voltage droop %0.5 kvar, 5%
%n_q1 = 0.02; %Số liệu Bá Linh
n_q1 = 1.2e-3;
n_q2 = 1.2e-3;
n_q3 = 1.2e-3;
n_q4 = 1.2e-3;

w_c_high = 2*pi*50;
kL = 5e-7;
LD_ref1 = 50e-6;


%LC filter (Il max = 1.1 I nom)
R_f = 0.01;
L_f = 0.85e-3;
C_f = 70e-6;

%L_in and R_in
L_in1 = 2.5e-3;
R_in1 = 0.01;
L_in2 = L_in1;
R_in2 = R_in1;
L_in3 = L_in1;
R_in3 = R_in1;
L_in4 = L_in1;
R_in4 = R_in1;




%adjuncancy matrix formation
A = ones(4) - eye(4);



%Lambda initialization
lambda1 = [3 3 3 3]';
lambda2 = [1.1 1.9 1.5 1.2]';
lambda3 = [9e-4 1.2e-2 3e-3 3e-3]';

Pmax = [4e3 3.5e3 3.5e3 4e3]';

Tsamp = 0.1; %secondary

lo_co = 0.2; %PQ low pass filter
time_thresh = 0.5;

%horizon step
N=3;
%save mat file
save('init.mat');


