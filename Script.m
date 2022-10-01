clear 
clc
close all

%sample time simulation
Ts = 10e-6;

%Load turn on-off time
load_on = 1;
load_off = 21;

%%
%PRIMARY PARAS

%dc bus voltage
Vdc = 600;
%nominal frequency
w_nom = 2*pi*50;
%nominal voltage
V_nom = 220*sqrt(2);
%sampling frequency
f_c = 50e3;

% droop P-w
m_p1 = 9.4e-6;
m_p2 = 9.4e-6;
m_p3 = 11.4e-5;
m_p4 = 11.4e-5;
%droop Q-V
n_q1 = 1.3e-3;
n_q2 = 1.3e-3;
n_q3 = 1.5e-3;
n_q4 = 1.5e-3;

%virtual impedance para
w_c_high = 2*pi*50; %cutoff frequency of high pass filter
kL = 1e-7; %feedforward gain
LD_ref1 = 50e-6; %virtual L value

%LC filter (Il max = 1.1 I nom)
R_f = 0.1; %L internal resistor
L_f = 1.35e-3;
C_f = 50e-6;

%L_in and R_in coupling line of inverter to bus
L_in1 = 0.35e-3;
R_in1 = 0.03;
L_in2 = 0.35e-3;
R_in2 = 0.03;
L_in3 = 0.35e-3;
R_in3 = 0.03;
L_in4 = 0.35e-3;
R_in4 = 0.03;

%PQ low pass filter
lo_co = 0.1; 
%%
%SECONDARY PARAS

%adjacency matrix formation
A = [0 1 1 1 ; 1 0 1 1 ; 1 1 0 1 ; 1 1 1 0];
% Secondary start time
time_thresh = 0.8;

%DAPI
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


%DMPC

%Lambda initialization
lambda3 = [1.5e-3 1.5e-3 1.5e-3 1.5e-3]';
lambda2 = [0.8e-2 0.8e-2 0.8e-2 0.8e-2]';
lambda1 = [1 1 1 1]';

Pmax = [45e3 45e3 37e3 37e3]';

%DMPC sample time
Tsamp = 0.1; %secondary
%Prediction horizon
N=5;


%save mat file
save('init.mat');
