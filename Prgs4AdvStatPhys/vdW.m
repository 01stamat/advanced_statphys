close all; clearvars; clc


L_T = [0.9,1,1.1];

L_V = [1/3:0.001:3];
N_V = numel(L_V);

for i = 1: numel(L_T)
    T=L_T(i);
    L_p = 8*T./(3.*L_V-1) -3./(L_V.^2);
    plot(L_V,L_p,'-'); hold on


end
ylim([0 2])
plot([0,1],[1,1],'-b')

plot([1,1],[0,1],'-b')

