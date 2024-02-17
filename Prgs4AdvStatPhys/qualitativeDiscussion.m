close all; clearvars; clc


%{

%}
fig = figure(10);

a    = 20;
b    = -10;
p0   = 1.7;
L_p  = [0.5:.01 :1];
c    = .2;
L_G  = a + b*(L_p-p0).^2 + c*(L_p-1);
plot(L_p,L_G,'-b'); hold on

L_p  = [1:.01 :1.5];
c    = .1;
L_G  = a + b*(L_p-p0).^2 + c*(L_p-1);
plot(L_p,L_G,'-r'); hold on
axis([0 2 0 25])
return
L_t  = [0.9,1.0,1.1]
N_t  = numel(L_t);
fig = figure(10);
L_v  = 1/3 + [0.01:0.0001:4]';
pl = zeros(3,1)

t = L_t(1);
L_p  = 8*t./(3*L_v-1) - 3./L_v.^2;
p1 = plot(L_v,L_p,'-'); hold on

t = L_t(2);
L_p  = 8*t./(3*L_v-1) - 3./L_v.^2;
p2 = plot(L_v,L_p,'-'); hold on

t = L_t(3);
L_p  = 8*t./(3*L_v-1) - 3./L_v.^2;
p3 = plot(L_v,L_p,'-'); hold on

ylim([0 10])



lt = xlabel('$\nu$');
set(lt,'interpreter','latex');
lt = ylabel('$\pi(\nu)$');
set(lt,'interpreter','latex');
set(gca,'fontsize',16);
axis([0.5,4,0,3])

t=L_t(1);
L_p  = 8*t./(3*L_v-1) - 3./L_v.^2;

p0 = 0.63;

L_Dp = L_p-p0;
L_x  = sign(L_Dp(1:end-1).*L_Dp(2:end));
ind = find(L_x<0);


i1 = ind(1);
i2 = ind(2);
i3 = ind(3);
v1 = L_v(i1);
v2 = L_v(i2);
v3 = L_v(i3);

plot([v1,v2,v3],[p0,p0,p0],'o')
lt = text(v1*1.,p0*1.2,'$\alpha$');
set(lt,'interpreter','latex','fontsize',18);
lt = text(v2*1.,p0*1.2,'$\gamma$');
set(lt,'interpreter','latex','fontsize',18);

lt = text(v3*0.98,p0*1.2,'$\beta$');
set(lt,'interpreter','latex','fontsize',18);

lt = text((v1+v2)*0.4,p0*0.5,'$A$');
set(lt,'interpreter','latex','fontsize',18);
lt = text((v3+v2)*0.42,p0*1.3,'$B$');
set(lt,'interpreter','latex','fontsize',18);

L_vx = [L_v(i1:i2);L_v(i1)];
L_px = [L_p(i1:i2);L_p(i1)];
fill(L_vx,L_px,'b')
L_vx = [L_v(i2:i3);L_v(i2)];
L_px = [L_p(i2:i3);L_p(i2)];
fill(L_vx,L_px,'r')

lt=legend([p1,p2,p3],'t=0.9','t=1','t=1.1');

saveas(fig,'Maxwell.eps','psc2');