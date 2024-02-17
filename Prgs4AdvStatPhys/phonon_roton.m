clear all;close all;clc

% n_C versus T

f4 = figure(4);

xr = 1;
b = 10;
d = 1

X = 0:0.001:2;
Y = X - d.*(1-1./(exp(b.*(X-xr))+1));
plot(X,Y,'-b','linewidth',2); hold on

x = 0:0.001:1;
y = x
plot(x,y,'--r','linewidth',2)

x = 0:0.001:2;
y = 0.25.*x
plot(x,y,'--k','linewidth',2)


set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);

xlabel('k','fontsize',22,'position',[1.75,-.05]);
ylabel('E(k)','fontsize',22,'position',[-.2,.75],'rotation',0);
axis([0 2 0 1.1])
text(0.9,0.7,'E_{ph} = c k','fontsize',20,'rotation',54,'color','r');
text(1.4,0.25,' E'' = c k','fontsize',20,'rotation',20);
text(1.4,0.5,'Roton-Anregung','fontsize',20,'rotation',54);
text(0.1,0.19,'Phonon-Anregung','fontsize',20,'rotation',54,'color','r');
title('Phonon-Roton-Spektrum','fontsize',22)

set(gca, 'XTickLabel', {'k_rot'},'XTick',1.21,'YTick',2);
fn4 = '../wvdl/phonon_roton.pdf';
fn5 = '../wvdl/phonon_roton.eps';
saveas(f4,fn4,'pdf')
saveas(f4,fn5,'psc2')