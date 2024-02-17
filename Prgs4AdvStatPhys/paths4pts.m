close all; clear all; clc


fig10 = figure(10);


hold on
L_V = [0.05:0.001:2];

a = 1;
b = 1;
c = 1;
L_F = a./L_V + b.*exp(-c*L_V);

L_p = -diff(L_F)./diff(L_V);

Va = .2;
Vb = .4;
iy = -2;

iy = -1;
[~,ia] = min(abs(L_V-Va));
[~,ib] = min(abs(L_V-Vb));
ii = find(and(Va <= L_V,L_V<= Vb));
pa = L_p(ia);
L_p2 = L_p(ia+1:end);
L_p(ia:ib) = pa;
NN = numel(L_p)-ib
L_p(ib:end) = L_p2(1:NN+1);



hold on

L_rho = 1./L_V(2:end);
plot(L_rho,L_p,'-b','linewidth',2);


lt = text(4,-8,'$\rho$','HorizontalAlignment','center','color','black');
set(lt,'fontsize',24,'interpreter','latex')


lt = text(-.5,80,'$p$','HorizontalAlignment','center','color','black');
set(lt,'fontsize',24,'interpreter','latex')


lt = text(6,43,'$T < T_C$');
set(lt,'fontsize',24,'interpreter','latex','Rotation',45)
lt = text(6.5,75,'$T = T_C$');
set(lt,'fontsize',24,'interpreter','latex','Rotation',60)
lt = text(3,82,'$T > T_C$');
set(lt,'fontsize',24,'interpreter','latex','Rotation',30)



% set(gca,'XTicklabel',[]);
% set(gca,'yTicklabel',[]);


pab = pa
ra = 1/Va;
rb= 1/Vb;

rc = (ra+rb)/2;
M = [1,ra,ra^2;1,rb,rb^2;1,rc,rc^2];
Lpr = [pa;pa;2*pa];

L_par= M\Lpr;

L_pp = L_par(1) + L_par(2)*L_rho + L_par(3)*L_rho.^2;
plot(L_rho,L_pp,'-k');

d = .8;
L_pt = 2*pa + d*(L_rho-rc).^3;
plot(L_rho,L_pt,'-b','linewidth',2);

ii1 = find(and(1.5<L_rho,L_rho<= 6.5));
plot(L_rho(ii1),L_pt(ii1),'-r','linewidth',2);
[~,ii1] = min(abs(L_rho-2));
xx = L_rho(ii1);
yy = L_pt(ii1);
dx = .3;
dy = .2;
plot([xx-dx, xx],[yy+dy, yy],'-r','linewidth',2)
dx = .2;
dy = 5;
plot([xx-dx, xx],[yy-dy, yy],'-r','linewidth',2)
% lt = text(xx*1.1,yy*0.9,'$III$','HorizontalAlignment','center','color','red');
% set(lt,'fontsize',24,'interpreter','latex')


[~,ii1] = min(abs(L_rho-5.5));
xx = L_rho(ii1);
yy = L_pt(ii1);
dx = .35;
dy = .2;
plot([xx-dx, xx],[yy+dy, yy],'-r','linewidth',2)
dx = .2;
dy = 5;
 plot([xx-dx, xx],[yy-dy, yy],'-r','linewidth',2)
lt = text(xx*0.95,yy*1.1,'$III$','HorizontalAlignment','center','color','red');
set(lt,'fontsize',24,'interpreter','latex')




plot([rc rc],[2*pa,3*pa],'-g','linewidth',2)
xx = rc;
yy = 2.5*pa;
dx = 0.15
dy = 4
plot([xx-dx, xx],[yy+dy, yy],'-g','linewidth',2)
plot([xx+dx, xx],[yy+dy, yy],'-g','linewidth',2)
lt = text(xx*.8,yy,'$I$','HorizontalAlignment','center','color','green');
set(lt,'fontsize',24,'interpreter','latex')

d1 = 1;
d2 = 1;
L_ptt = 2.5*pa + d1*L_rho+d2*L_rho.^2;
plot(L_rho,L_ptt,'-b','linewidth',2);


ii1 = find(and(rc-1.2<L_rho,L_rho<= rc+1.2));
plot(L_rho(ii1),L_pp(ii1),'-m','linewidth',2);
[~,ii1] = min(abs(L_rho-(rc-0.8)));
xx = L_rho(ii1);
yy = L_pp(ii1);
dx = .3;
dy = 2;
plot([xx-dx, xx],[yy-dy, yy],'-r','linewidth',2)
dx = .05;
dy = 5;
plot([xx+dx, xx],[yy-dy, yy],'-r','linewidth',2)
 lt = text(xx*1.1,yy*0.75,'$II$','HorizontalAlignment','center','color','m');
 set(lt,'fontsize',24,'interpreter','latex')



[~,ii1] = min(abs(L_rho-(rc+0.8)));
xx = L_rho(ii1);
yy = L_pp(ii1);
dx = .05;
dy = 5;
plot([xx-dx, xx],[yy-dy, yy],'-r','linewidth',2)
dx = .3;
dy = 3;
plot([xx+dx, xx],[yy-dy, yy],'-r','linewidth',2)
 lt = text(xx*0.95,yy*0.75,'$II$','HorizontalAlignment','center','color','m');
 set(lt,'fontsize',24,'interpreter','latex')




plot([0 rc],[2*pa,2*pa],'--k','linewidth',2)
lt = text(-.5,2*pa,'$p_c$','HorizontalAlignment','center','color','black');
set(lt,'fontsize',24,'interpreter','latex')

axis([0 8 0 100])
% set(gca,'XTicklabel',[]);
% set(gca,'yTicklabel',[]);

saveas(fig10,'paths4pt.pdf','pdf');




