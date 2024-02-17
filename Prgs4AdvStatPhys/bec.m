clear all;close all;clc

% n_C versus T

f4 = figure(4);

X = 0:0.001:1;
Y = 1-X.^(3/2);
plot(X,Y,'-b','linewidth',2); hold on
plot([1,2],[0.0,0.0],'-b','linewidth',2); hold on


%axis([-1 2 -1 2]);

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);

xlabel('T/T_C','fontsize',22);
ylabel('n_0/n','fontsize',22);
axis([0 2 0 1.1])

fn4 = 'condensate_fraction.pdf';
fn5 = 'condensate_fraction.eps';
saveas(f4,fn4,'pdf')
saveas(f4,fn5,'psc2')