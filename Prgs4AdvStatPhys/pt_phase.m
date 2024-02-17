clear all;close all;clc

% n_C versus T

f4 = figure(4);

T = 0:0.001:1.5;
Y = T.^(5/2);
plot(T,Y,'-b','linewidth',2); hold on



%axis([-1 2 -1 2]);

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);

xlabel('T','fontsize',22);
ylabel('P','fontsize',22,'Rotation',0,'position',[-.1,.5]);
axis([0 1.5 0 1])
text(.65,.2,'normale Flüssigkeit','fontsize',20,'rotation',0);
text(.45,.2,'BEC','fontsize',20,'rotation',49,'color','b');
text(.15,.65,'verboten','fontsize',20);
set(gca, 'XTick',2,'YTick',2);


fn4 = '../wvdl/PT_phase.pdf';
fn5 = '../wvdl/PT_phase.eps';
saveas(f4,fn4,'pdf')
saveas(f4,fn5,'psc2')