close all; clearvars; clc

fig=figure(10);

L_m   = [-1:0.001:1];
L_tau = [1.5,1,0.7];

N_tau = numel(L_tau);
L_a   = zeros(size(L_m));


%===============
tau = L_tau(1);
L_a = -0.5*L_m.^2 + (tau/2)*log(1-L_m.^2) + ...
    (tau/2).*L_m.*log((1+L_m)./(1-L_m));
p1 = plot(L_m,L_a,'-b','linewidth',2); hold on
%===============
tau = L_tau(2);
L_a = -0.5*L_m.^2 + (tau/2)*log(1-L_m.^2) + ...
    (tau/2).*L_m.*log((1+L_m)./(1-L_m));
p2 = plot(L_m,L_a,'-r','linewidth',2); hold on
%===============
tau = L_tau(3);
L_a = -0.5*L_m.^2 + (tau/2)*log(1-L_m.^2) + ...
    (tau/2).*L_m.*log((1+L_m)./(1-L_m));
p3 = plot(L_m,L_a,'-k','linewidth',2); hold on


%===============

plot([-1 1],[0 0],'-k')
axis([-1 1 -0.2 .6])




lt=xlabel('$m$');
set(lt,'fontsize',20,'interpreter','latex');
lt=ylabel('$A(\tau,m)/(k_B J z) + T \ln(2)$');
set(lt,'fontsize',20,'interpreter','latex');


set(gca,'fontsize',18)

L_d = diff(L_a);
L_p = sign(L_d(1:end-1).*L_d(2:end));
ind = find(L_p<0);


m1 = L_m(ind(1));
a1 = L_a(ind(1));
m2 = L_m(ind(3));
a2 = L_a(ind(3));

plot([m1 m1],[a1,0],'-k','linewidth',2);
lt=text(m1-.1,1.75*a1,'$-m_0$');
set(lt,'interpreter','latex','fontsize',20)
plot([m2 m2],[a2,0],'-k','linewidth',2);
lt=text(m2-.05,1.75*a2,'$m_0$');
set(lt,'interpreter','latex','fontsize',20)
lt=legend([p1,p2,p3],{['$\tau = ',num2str(L_tau(1)),'$'],['$\tau = ',num2str(L_tau(2)),'$']',...
    ['$\tau = ',num2str(L_tau(3)),'$']});
set(lt,'interpreter','latex','fontsize',20)


saveas(fig,'freeEnergyHemlholz.eps','psc2');
