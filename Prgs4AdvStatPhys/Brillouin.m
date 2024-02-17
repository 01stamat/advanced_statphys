close all; clearvars; clc

fig=figure(10);

L_M = [.5,100];
L_x = (-10:0.001:10);
L_x(abs(L_x)<.001)=[];
N_M = numel(L_M)
for i=1: N_M
    M = L_M(i);
    
    a = (2*M+1)/(2*M);
    b = 1/(2*M);
    L_B = a.*coth(a*L_x) -b.*coth(b*L_x);
    
    plot(L_x,L_B,'-b','linewidth',2); hold on
end
plot([-10 10],[0 0],'-k'); hold on
plot([-10 10],[1 1],'-k'); hold on
plot([-10 10],[-1 -1],'-k'); hold on

axis([-10 10 -1.1 1.1])

lt = text(4,0.7,'$M=1/2$');
set(lt,'fontsize',20,'interpreter','latex');
lt = text(2,0.9,'$M=\infty$');
set(lt,'fontsize',20,'interpreter','latex');
lt=xlabel('$x$');
set(lt,'fontsize',20,'interpreter','latex');
lt=ylabel('${\cal B}_M(x)$');
set(lt,'fontsize',20,'interpreter','latex');


set(gca,'fontsize',18)

saveas(fig,'Brillouin.eps','psc2');
