close all; clear all; clc

fig = figure(1)

hold on


x0    = 5;

% draw ellipse
d_phi = 0.001;
phi_1 = 0;
phi_2 = 2*pi;

rxo   = 0.5;
ryo   = 1;
L_phi = [phi_1:d_phi:phi_2];
L_x   = rxo.*cos(L_phi);
L_y   = ryo.*sin(L_phi);
plot(L_x,L_y);

rxi   = 0.5*0.7;
ryi   = 1*0.85;
L_phi = [phi_1:d_phi:phi_2];
L_x   = rxi.*cos(L_phi);
L_y   = ryi.*sin(L_phi);
plot(L_x,L_y);

rxo_0 = 0.5*0.2;
ryo_0 = 1*0.08;
L_phi = [phi_1:d_phi:phi_2];
L_x   = rxo_0.*cos(L_phi) + x0;
L_y   = ryo_0.*sin(L_phi);
fill(L_x,L_y,'b');


rxo_0 = 0.5*0.2;
ryo_0 = 1*0.08;
L_phi = [phi_1:d_phi:phi_2];
L_xx   = rxo_0.*cos(L_phi);
L_yy   = ryo_0.*sin(L_phi);




phi   = pi*1.2;

xo   = rxo.*cos(phi);
yo   = ryo.*sin(phi)*1.1;
xi   = rxi.*cos(phi)
yi   = ryi.*sin(phi);



L_xxx = L_xx.*0.8 + (xo+xi)/2;
L_yyy = L_yy.*0.85 + (yo+yi)/2;
fill(L_xxx,L_yyy,'b')

% xo -> x0   -> x0    ->  xo -> xo
% yo -> -ryo_0 -> ryo_0  ->  yi -> yo



Lx = [(xo+xi)/2 x0 x0 (xo+xi)/2 (xo+xi)/2 ];
Ly = [yo -ryo_0 ryo_0 yi yo];
fill(Lx,Ly,'b','edgecolor','b');




plot(L_x,L_y,'-k','linewidth',2);
plot(L_xxx,L_yyy,'-k','linewidth',2);


text(-rxi/2,-ryi/2,'\phi','fontsize',18)

text(x0*0.5,-ryi*0.1,'\theta','fontsize',18);
text(x0*1.05,0,'d A','fontsize',18);

plot([xo x0],[yo yo],'-k');
text(x0/2,yo*1.2,'v dt |cos(\theta)|','fontsize',18);


d_phi = 0.001;
phi_1 = 0;
phi_2 = 0.09*pi;

rrx   = x0*0.6;
rry   = x0*0.2;
L_phi = [phi_1:d_phi:phi_2];
L_x   = x0 - rrx.*cos(L_phi);
L_y   = -rry.*sin(L_phi);
plot(L_x,L_y,'-k');




plot([-1.5 x0],[0,0],'-k');

axis([-1.1 7 -1.1 1.1]);
axis off;
set(gca,'fontsize',24);


saveas(fig,'effusion.eps','psc2');