close all; clearvars; clc


%{
    Newton Ralphsaon
    phi = C tanh(x) - x;
    d phi/ dx = C/(cosh(x))^2 - 1;
%}
L_C  = [1:0.001:10 1000]';
L_C(1)   = 1/0.9990;
L_C(end) = 1/0.0001;
N_C  = numel(L_C);
Nmax = 10000
L_x  = zeros(N_C,1);
for iC=1: N_C
    C  = L_C(iC);
    x  = C;
    dx = 1;
    for i = 1: Nmax
        phi  = C*tanh(x)-x;
        phip = C/(cosh(x))^2 - 1;
        dx   = phi/phip;
        x    = x - dx;
        flag = abs(dx)<1.e-10;
        if flag
            break
        end
    end
    if flag
        L_x(iC) = abs(x);
    else
        L_x(iC) = nan;
    end
end

L_M =L_x./L_C;
fig = figure(10);
L_T =1./L_C; 


plot(L_T,L_M,'-k','linewidth',2);
axis([0 1.1 0 1.1]);
lt = xlabel('$T/T_c$');
set(lt,'interpreter','latex');
lt = ylabel('$M/N$');
set(lt,'interpreter','latex');
set(gca,'fontsize',16);
saveas(fig,'M_mfa_ising.pdf','pdf');


L_x = L_M./L_T;

L_xi =  (L_x.^2)./(cosh(L_x).*cosh(L_x)-1./L_T);
fig30 = figure(30);
plot(L_T,L_xi,'-','linewidth',2)
axis([0 1.1 0 2])

lt = xlabel('$T/T_c$');
set(lt,'interpreter','latex');
lt = ylabel('$C/N k_B$');
set(lt,'interpreter','latex');
set(gca,'fontsize',16);

saveas(fig30,'C_mfa_ising.pdf','pdf');

fig20 = figure(20);

% entropy

L_S =  log(2) -0.5*((1+L_M).*log(1+L_M) + (1-L_M).*log(1-L_M));

L_S(end) = 0;
plot(L_T,L_S,'-k','linewidth',2); hold on
plot([1 2],log(2)*[1 1],'-k','linewidth',2); hold on
axis([0 1.5 0 1]);
lt = xlabel('$T/T_c$');
set(lt,'interpreter','latex');
lt = ylabel('$S/N k_B$');
set(lt,'interpreter','latex');
set(gca,'fontsize',16);
saveas(fig20,'S_mfa_ising.pdf','pdf');