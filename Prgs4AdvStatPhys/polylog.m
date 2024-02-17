clear all; close all; clc

dx = 0.15;
dy = 0.2;
L_p = [0,0;0,1;-dx,1;0,1+dy;dx,1;0,1] + repmat([0,-(1+dy)/2],6,1);
L_m = [0,0;0,-1;-dx,-1;0,-1-dy;dx,-1;0,-1] + repmat([0,+(1+dy)/2],6,1);




f4 = figure(4);
hold on;

Rx = 5;
Ry = 1;

N = 10;


L_sig = [-1,1,-1,1,1,-1,1,1,-1,1;]
L_phi = 2*pi*(0.25+(0:N-1))./N
N_phi = numel(L_phi);

for i = 1: N_phi
    phi = L_phi(i);
    L_p0 = [Rx*cos(phi),Ry*sin(phi)];
    if L_sig(i)<0
        L_pp = L_m + repmat(L_p0,6,1);
    else
        L_pp = L_p + repmat(L_p0,6,1);
    end
    plot(L_pp(:,1),L_pp(:,2),'-r','linewidth',2);
    plot(L_p0(1),L_p0(2),'.r','markersize',20);
end

L_pp = L_p.*4 + repmat([0,2],6,1);
plot(L_pp(:,1),L_pp(:,2),'-k','linewidth',2);
text(-1,2,'B','fontsize',24)
L_phi = 0:0.001:2*pi;

L_pc_x = Rx*cos(L_phi);
L_pc_y = Ry*sin(L_phi);



text(0.5,-1,'J','fontsize',24,'color','b')

plot(L_pc_x,L_pc_y,'-b');
axis([-6 6 -3 3])

axis off
axis equal

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn4 = '../Bilder/ising_spins.eps';


saveas(f4,fn4,'psc2')








