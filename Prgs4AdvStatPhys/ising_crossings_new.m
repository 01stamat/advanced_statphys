close all; clearvars; clc

fig10=figure(10);


L_x = [0:6];
L_x(4) = [];
L_y = [0:2];
[M_x,M_y] = ndgrid(L_x,L_y);
L_x = M_x(:);
L_y = M_y(:);

plot(L_x,L_y,'.k','markersize',10); hold on

R = 0.1;
L = [0,0; 2,0; 2,2; 0,2; 0,0];
plot(L(:,1),L(:,2),'-k','linewidth',2); hold on
L = [R,R; 2-R,R; 2-R,2-R; R,2-R; R,R];
plot(L(:,1),L(:,2),'-k','linewidth',2); hold on

R = 0.1;
L = [R,0; 2,R; 2,2; 0,2; 0,R; 2-R,0; 2-R,2-R; R,2-R;R,0];x
plot(4+L(:,1),L(:,2),'-k','linewidth',2); hold on


axis equal;
axis off;
axis([-.5 7.5 -1.5 3.5]);
lt=text(.75,-.75,'$a)$');
set(lt,'fontsize',20,'interpreter','latex');
lt=text(4.75,-.75,'$b)$');
set(lt,'fontsize',20,'interpreter','latex');





set(gca,'fontsize',18)
saveas(fig10,'ising_crossings_new.eps','psc2');

