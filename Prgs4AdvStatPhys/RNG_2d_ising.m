close all; clearvars; clc


%{

%}

L_K  = [0.001:0.001:0.8]';
N_K  = numel(L_K);
Nmax = 10000

L_Kp = (3/8)*log(cosh(4*L_K));


fig = figure(10);
plot(L_K,L_Kp,'-b','linewidth',2); hold on
plot(L_K,L_K,'-k','linewidth',1); hold on



L_DK = abs(L_Kp-L_K);
[~,imin]=min(L_DK);
[L_K(imin),L_Kp(imin)]
plot(L_K(imin),L_Kp(imin),'or')
plot(0,0,'or')
K = 1.1*L_K(imin);
Ko = 0
for i = 1: 5
    Kp = (3/8)*log(cosh(4*K));
    plot([K,K],[Ko,Kp],'-g','linewidth',2)
    plot([K,Kp],[Kp,Kp],'-g','linewidth',2)
    K  = Kp;
    Ko = K;
end

K = 0.9*L_K(imin);
Ko = 0
for i = 1: 7
    Kp = (3/8)*log(cosh(4*K));
    plot([K,K],[Ko,Kp],'-g','linewidth',2)
    plot([K,Kp],[Kp,Kp],'-g','linewidth',2)
    K  = Kp;
    Ko = K;
end

lt = xlabel('$K$');
set(lt,'interpreter','latex');
lt = ylabel('$g(K)$');
set(lt,'interpreter','latex');
set(gca,'fontsize',16);

saveas(fig,'RNG_flow_2D.eps','psc2');