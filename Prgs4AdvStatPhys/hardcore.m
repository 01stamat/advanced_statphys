clear all; close all; clc

R = 0.025
L_x0 = [0.725:2*R:0.975];
N0   = length(L_x0);


f4      = figure(1);

L_phi = [0:0.001:2*pi];
L_x   = R * cos(L_phi);
L_yy  = R * sin(L_phi);


for i = 1: N0
    L_xx = L_x + L_x0(i);
    plot(L_xx,L_yy,'-','markersize',2); hold on
end

plot([1 1],[-.2 .2],'-k','linewidth',2);
plot([0 0],[-.2 .2],'-k','linewidth',2);
plot([0 1],[0 0],'-k','linewidth',1);

plot([L_x0(1)+R L_x0(1)+R],[0 -.2],'-k')

text(L_x0(1)-0.015,0.1,'k','fontsize',16)

text(L_x0(1)+2*R,-0.1,'(N-k) 2\sigma','fontsize',14)

axis([-.1 1.1 -.1 .1]);

axis equal
axis off





set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);



fn4 = '../Bilder/hard_core.eps';


saveas(f4,fn4,'psc2')


