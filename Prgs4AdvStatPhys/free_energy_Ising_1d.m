close all; clearvars; clc

L_K     = [0.001:0.001:10];
N_K     = numel(L_K);
L_f0    = zeros(N_K,1);
L_f0_ex = zeros(N_K,1);

for iK = 1: N_K
    K     = L_K(iK);
    f0_ex = log(cosh(K));
    f0  = 0;
    fac = 1;
    arg = 1;
    while arg >1.e-10
        if K > 1.e-10
            K = log(cosh(2*K))/2;
        else
            K = K^2;
        end
        fac = fac/2;
        arg = fac*K;
        f0  = f0 + arg;
        
    end
    L_f0(iK)    = f0;
    L_f0_ex(iK) = f0_ex;
end


plot(L_K,L_f0,'-bx'); hold on
plot(L_K,L_f0_ex,'-ro'); hold on