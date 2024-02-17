close all; clear all; clc

L_e = [-2:0.001:2];
L_e(abs(L_e)<1.e-8) = [];
L_rho = ellipke(1-(L_e/2).^2)/(2*pi^2);

de    = L_e(2)-L_e(1);
j_C   = log(1+sqrt(2))/2.;
L_j   = [0.1:0.001:2]*j_C;
N_j   = numel(L_j);
L_C   = zeros(N_j,1);

for ij = 1: N_j
    j        = L_j(ij);
    kappa    = sinh(2*j);
    L_deno   = (1-kappa)^2 + kappa*(2+L_e);
    L_deno_q = L_deno.^2; 
    L_lng    = L_rho.*log(L_deno);
    lng      = sum(L_lng)*de;
    L_gp     = L_rho.*( ((2+L_e) -2 *(1-kappa))./L_deno);
    gp = sum(L_gp)*de;
    L_gpp = L_rho.*( ((L_e+kappa).^2 +kappa^2 -2)./L_deno_q);
    gpp = sum(L_gpp)*de;
    
    L_C(ij) = 2*j^2*((1+kappa)^2.*gpp +kappa * gp);
    
end
plot(L_j,L_C)
axis([0 2 -1 1])