clear all;close all; clc

kB   = 1.38e-23;
hbar = 1.05e-34;
M    = 4.007*1.66e-27;
rho  = 0.18;
rho = 69.9;
n    = rho/M;


ll = 2*pi*hbar^2/M;

TC   = ll * n^(2/3) * zeta(5/2)^(-2/3) / kB



TC = 3.13;

kB*TC