close all; clearvars; clc

fig10=figure(10);


R  = 0.1

L_phi = ([0:0.001:0.5])*pi;
x0 = 0
y0 = .025;
plot([x0,x0+1],[0,0],'.k','markersize',20); hold on
%plot([0,0],[y0+R,y0+1],'-k','linewidth',2); hold on
plot([R,1-R],[y0,y0],'-k','linewidth',2); hold on
plot([R,1-R],[-y0,-y0],'-k','linewidth',2); hold on

L_x   = R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,-L_y,'-k','linewidth',2); hold on

x0 = 1
y0 = .025;
L_phi = (.5+[0:0.001:0.5])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,-L_y,'-k','linewidth',2); hold on

L_phi = ([0:0.001:0.5])*pi;
x0 = 2
y0 = .025;
plot([x0,x0+1],[0,0],'.k','markersize',20); hold on
%plot([0,0],[y0+R,y0+1],'-k','linewidth',2); hold on
plot(x0+[R,1-R],[y0,-y0],'-k','linewidth',2); hold on
plot(x0+[R,1-R],[-y0,+y0],'-k','linewidth',2); hold on

L_x   = x0 + R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,-L_y,'-k','linewidth',2); hold on

x0 = 3
y0 = .025;
L_phi = (.5+[0:0.001:0.5])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,-L_y,'-k','linewidth',2); hold on

lt =text(0.4,+.5,'$+$');
set(lt,'fontsize',20,'interpreter','latex')
lt =text(2.4,+.5,'$-$');
set(lt,'fontsize',20,'interpreter','latex')
lt =text(0.4,-.5,'$a)$');
set(lt,'fontsize',20,'interpreter','latex')
lt =text(2.4,-.5,'$b)$');
set(lt,'fontsize',20,'interpreter','latex')


axis([-.5 4 -.5 .5])
axis equal
axis off



set(gca,'fontsize',18)
saveas(fig10,'double_bonds.eps','psc2');
