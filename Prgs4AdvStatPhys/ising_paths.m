close all; clearvars; clc

fig10=figure(10);

x0 = 0;
y0 = 0;

L = [0,0;...
    1,0;...
    1,1;...
    0,1;...
    0,0];
    
L_x =x0 + L(:,1);
L_y =y0 + L(:,2);
plot(x0,y0,'ok','markersize',10); hold on
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,L_y,'.b','markersize',20); hold on
plot(x0+0.5+[0,.2],[-.05,0],'-k','linewidth',2);
plot(x0+0.5+[0,.2],[0.05,0],'-k','linewidth',2);

lt=text(x0+.3,-.75,'$a)$');
set(lt,'fontsize',20,'interpreter','latex');




x0 = 2;
y0 = 0;

L = [0,0;...
    1,0;...
    1,1;...
    1,2;...
    2,2;...
    2,1];
    



    
L_x =x0 + L(:,1);
L_y =y0 + L(:,2);
plot(x0,y0,'ok','markersize',10); hold on
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,L_y,'.b','markersize',20); hold on
plot(x0+0.5+[0,.2],[-.05,0],'-k','linewidth',2);
plot(x0+0.5+[0,.2],[0.05,0],'-k','linewidth',2);

L = [0,1; 0,0];


L_x =x0 + L(:,1);
L_y =y0 + L(:,2);
plot(x0,y0,'ok','markersize',10); hold on
plot(L_x,L_y,'-k','linewidth',2); hold on
plot(L_x,L_y,'.b','markersize',20); hold on
plot(x0+0.5+[0,.2],[-.05,0],'-k','linewidth',2);
plot(x0+0.5+[0,.2],[0.05,0],'-k','linewidth',2);

x0 = 3;
y0 = 1;
R  = 0.2;

%plot(x0,y0,'.k','markersize',20); hold on
plot([x0-1,x0-R],[y0,y0],'-k','linewidth',2); hold on
plot([x0+R,x0+1],[y0,y0],'-k','linewidth',2); hold on
plot([x0,x0],[y0-1,y0],'-k','linewidth',2); hold on
plot([x0,x0],[y0+1.5*R,y0+1],'-k','linewidth',2); hold on

L_phi = (0.+[0:0.001:1])*pi;
L_x   = x0+R*cos(L_phi);
L_y   = y0+R*sin(L_phi);
plot(L_x,L_y,'-k','linewidth',2); hold on

lt=text(x0-.2,-.75,'$b)$');
set(lt,'fontsize',20,'interpreter','latex');




%%



x0 = 5;
y0 = 0;
R  = 0.1;
L = [0,0;...
    1,0;...
    1,1-R;...
    0,1+R;...
    0,2;...
    1,2;...
    1,1+R;...
    0,1-R;...
    0,0];
    
L_x =x0 + L(:,1);
L_y =y0 + L(:,2);
plot(x0,y0,'ok','markersize',10); hold on
plot(L_x,L_y,'-k','linewidth',2); hold on

plot(x0+0.5+[0,.2],[-.05,0],'-k','linewidth',2);
plot(x0+0.5+[0,.2],[0.05,0],'-k','linewidth',2);

L = [0,0;...
    1,0;...
    1,1;...
    0,1;...
    0,2;...
    1,2;...
    1,1;...
    0,1;...
    0,0];
    
L_x =x0 + L(:,1);
L_y =y0 + L(:,2);
plot(L_x,L_y,'.b','markersize',20); hold on

lt=text(x0+.4,-.75,'$c)$');
set(lt,'fontsize',20,'interpreter','latex');


x0 = 7;
y0 = 0;
R  = 0.2;

L = [0,0; 2,0; 2,2; 0,2; R,R; 2-R,R; 2-R,2-R; R,2-R;0,0];
    
L_x =x0 + L(:,1);
L_y =y0 + L(:,2);
plot(x0,y0,'ok','markersize',10); hold on
plot(L_x,L_y,'-k','linewidth',2); hold on

plot(x0+1+[0,.2],[-.05,0],'-k','linewidth',2);
plot(x0+1+[0,.2],[0.05,0],'-k','linewidth',2);

L_x = [0:2];
L_y = [0:2];
[M_x,M_y] = ndgrid(L_x,L_y);
L_x = x0 + M_x(:);
L_y = y0 + M_y(:);


plot(L_x,L_y,'.b','markersize',20); hold on

lt=text(x0+.75,-.75,'$d)$');
set(lt,'fontsize',20,'interpreter','latex');


axis([-.5 9 -1.5 2.5]);


axis equal
axis off
set(gca,'fontsize',18)
saveas(fig10,'ising_paths.eps','psc2');

