close all;
clear all;
clc;

x = 0:0.001: 1.1;
f = 4*x./(1+x).^2;
fig = figure(88);
plot(x,f,'-','linewidth',2); hold on
plot(x,x,'--k','linewidth',2); hold on
axis([0 1.1 0 1.1]);
xlabel('x');
ylabel('f(x)');
set(gca,'fontsize',18);


xo = .1;
yo = 0;
for i = 1: 4
    
    yn = 4*xo./(1+xo).^2;
    xn = yn;
    plot([xo,xo],[yo,yn],'-b','linewidth',2);
    plot([xo,xn],[yn,yn],'-b','linewidth',2);
    lt = text(xo-0.02,yn+.1,'x','fontsize',18);
    lt = text(xo+.03-0.02,yn+.12,['(',num2str(i),')'],'fontsize',14);
    
    yo = yn;
    xo = yn;
    
end
%set(gca,'XTick', [0 1]);

printpdf(fig,['NRG_ising.pdf'])