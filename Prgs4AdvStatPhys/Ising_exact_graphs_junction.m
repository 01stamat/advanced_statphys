close all; clearvars; clc

fig10=figure(10);



plot(0,0,'.k','markersize',20); hold on
plot([-1,1],[0,0],'-k','linewidth',2); hold on
plot([0,0],[-1,1],'-k','linewidth',2); hold on



% plot([1.5 2.5],[0,0],'-k','linewidth',2)
% plot([2.25 2.5],[.25,0],'-k','linewidth',2)
% plot([2.25 2.5],[-.25,0],'-k','linewidth',2)

lt=text(1.5,0,'$\longrightarrow$');
set(lt,'fontsize',20,'interpreter','latex');


x0 = 4;
y0 = 0;
R  = 0.2
plot(x0,y0,'.k','markersize',20); hold on
plot([x0-1,x0-R],[y0,y0],'-k','linewidth',2); hold on
plot([x0+R,x0+1],[y0,y0],'-k','linewidth',2); hold on
plot([x0,x0],[y0-1,y0-R],'-k','linewidth',2); hold on
plot([x0,x0],[y0+R,y0+1],'-k','linewidth',2); hold on


L_phi = (1.5+[0:0.001:0.5])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on

L_phi = (0.5+[0:0.001:0.5])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on
lt=text(x0-.25,-1.5,'$a)$');
set(lt,'fontsize',20,'interpreter','latex');

lt=text(5.25,0,'$+$');
set(lt,'fontsize',20,'interpreter','latex');

x0 = 7;
y0 = 0;
R  = 0.2

plot(x0,y0,'.k','markersize',20); hold on
plot([x0-1,x0-R],[y0,y0],'-k','linewidth',2); hold on
plot([x0+R,x0+1],[y0,y0],'-k','linewidth',2); hold on
plot([x0,x0],[y0-1,y0-R],'-k','linewidth',2); hold on
plot([x0,x0],[y0+R,y0+1],'-k','linewidth',2); hold on

L_phi = (0.+[0:0.001:0.5])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on

L_phi = (1+[0:0.001:0.5])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on

lt=text(x0-.25,-1.5,'$b)$');
set(lt,'fontsize',20,'interpreter','latex');
lt=text(8.25,0,'$-$');
set(lt,'fontsize',20,'interpreter','latex');



x0 = 10;
y0 = 0;
R  = 0.2

%plot(x0,y0,'.k','markersize',20); hold on
plot([x0-1,x0-R],[y0,y0],'-k','linewidth',2); hold on
plot([x0+R,x0+1],[y0,y0],'-k','linewidth',2); hold on
plot([x0,x0],[y0-1,y0],'-k','linewidth',2); hold on
plot([x0,x0],[y0+1.5*R,y0+1],'-k','linewidth',2); hold on

L_phi = (0.+[0:0.001:1])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on

lt=text(x0-.25,-1.5,'$c)$');
set(lt,'fontsize',20,'interpreter','latex');

axis equal
axis off
axis([-1.5 11.5 -1.5 1.5]);



set(gca,'fontsize',18)
saveas(fig10,'junction.eps','psc2');
