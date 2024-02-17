close all; clearvars; clc

fig10=figure(10);
for ix = 0: 10
    for iy = 0: 10
        plot(ix,iy,'.k','markersize',10); hold on
    end
end
axis([-1 11 -1 11]);
L = [2,3,1,2;...
    3,5,3,4;...
    7,1,1,1];
[n1,~] = size(L);

for i = 1: n1
    x0 = L(i,1);
    y0 = L(i,2);
    dx = L(i,3);
    dy = L(i,4);
    
    
    plot([x0, x0+dx],[y0, y0],'-b','linewidth',2)
    plot([x0+dx, x0+dx],[y0, y0+dy],'-b','linewidth',2)
    plot([x0+dx, x0],[y0+dy, y0+dy],'-b','linewidth',2)
    plot([x0, x0],[y0+dy, y0],'-b','linewidth',2)
end

axis equal
axis off
set(gca,'fontsize',18)
saveas(fig10,'graph_allowed.eps','psc2');



fig11=figure(11);
for ix = 0: 10
    for iy = 0: 10
        plot(ix,iy,'.k','markersize',10); hold on
    end
end
axis([-1 11 -1 11]);
L = [2,3,4,2;...
    3,5,3,4];
[n1,~] = size(L);

for i = 1: n1
    x0 = L(i,1);
    y0 = L(i,2);
    dx = L(i,3);
    dy = L(i,4);
    
    
    plot([x0, x0+dx],[y0, y0],'-b','linewidth',2)
    plot([x0+dx, x0+dx],[y0, y0+dy],'-b','linewidth',2)
    plot([x0+dx, x0],[y0+dy, y0+dy],'-b','linewidth',2)
    if i ~= n1
        plot([x0, x0],[y0+dy, y0],'-b','linewidth',2)
    end
end

axis equal
axis off
set(gca,'fontsize',18)
saveas(fig11,'graph_not_allowed.eps','psc2');

