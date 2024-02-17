close all; clear all; clc

% ehrenfest model


Nh = 10000;

Nt = 10000000;

N  = 2*Nh;

N1 = N;
L_N1    = zeros(Nt,1);
L_N1(1) = N1;
L_rand = randi(N,Nt,1);
for i = 2: Nt
    if L_rand(i) <= N1
        N1 = N1-1;
    else
        N1 = N1+1;
    end
    L_N1(i) = N1;
end
L_t = [1:Nt]./Nt;
plot(L_t,L_N1/N,'-'); hold on

% steady state (equilibrium)
p = 1/2;
q = 1-p;
N1_avg = N*p/N;
N1_std = sqrt(N*p*q)/N;
plot([0 1],N1_avg*[1,1],'-k');
plot([0 1],(N1_avg+N1_std)*[1,1],'-k');
plot([0 1],(N1_avg-N1_std)*[1,1],'-k');