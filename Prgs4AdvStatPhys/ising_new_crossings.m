close all; clearvars; clc

fig10=figure(10);


L_x = [0:8];
L_y = [0:6];
[M_x,M_y] = ndgrid(L_x,L_y);
L_x = M_x(:);
L_y = M_y(:);

plot(L_x,L_y,'.k','markersize',10); hold on

L_R  = [0.0;...
    0.1;...
    0.1;...
    0.0;
    0.1];
L_xy = [0,0,2,2;...
    0,0,2,2;...
    5,2,2,2;...
    4,2,4,4;...
    5,2,2,-2];




N_R = numel(L_R);
for i = 1: N_R
    R  = L_R(i);
    x0 = L_xy(i,1)
    y0 = L_xy(i,2)
    dx = L_xy(i,3)
    dy = L_xy(i,4)
    if dy > 0
        L = [x0+R,y0+R; x0+dx-R,y0+R; x0+dx-R,y0+dy-R; x0+R,y0+dy-R; x0+R,y0+R];
    else
        L = [x0+R,y0-R; x0+dx-R,y0-R; x0+dx-R,y0+dy+R; x0+R,y0+dy+R; x0+R,y0-R];
    end
    plot(L(:,1),L(:,2),'-k','linewidth',2); hold on
end


axis equal;
axis off;
axis([-.5 8.5 -1.5 6.5]);

lt=text(.75,-.75,'$a)$');
set(lt,'fontsize',20,'interpreter','latex');
lt=text(5.75,-.75,'$b)$');
set(lt,'fontsize',20,'interpreter','latex');



set(gca,'fontsize',18)
saveas(fig10,'ising_crossings.eps','psc2');

