function condensate()

clear all; close all; clc

n0 = 1.2;

L_y = polylog(3/2,1,1.e-6)

L_z = 0:0.001:1;

L_y = polylog(3/2,L_z,1.e-6)./zeta(3/2);

f4 = figure(4);
hold on;
plot(L_z,L_y,'-b','linewidth',2);

text(1.03,01,'n_C','fontsize',18,'color','b','VerticalAlignment','middle')
text(1.03,n0,'n','fontsize',18,'color','r','VerticalAlignment','middle')

set(gca, 'XTickLabel', {'1'},'XTick',1,'YTick',1,'YTickLabel', {''});
numel(L_z)

V = 20;
L_y_plus = L_y + L_z./(1-L_z)./V;

plot(L_z,L_y_plus,'-k','linewidth',2);
legend('ohne n_0','mit n_0','Location','NorthWest');

% [a i0] = min(abs(L_y-n0));
% x0     = L_z(i0);
% plot(x0.*[1 1],[0,L_y(i0)],'-k');
% text(x0,-.3,'z_0^*','fontsize',18,'color','b','HorizontalAlignment','center')


[a i0] = min(abs(L_y_plus-n0));
x0     = L_z(i0);
plot(x0.*[1 1],[0,L_y_plus(i0)],'-k');
text(x0,-.2,'z^*','fontsize',18,'color','k','HorizontalAlignment','center')



plot([0 1],[n0 n0],'-r','linewidth',2);
 
axis([0 1. 0 2])
 

xlabel('z','fontsize',18,'position',[.5,-.125])
ylabel('n','fontsize',18,'Rotation',0,'position',[-.1,1])
 
set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn4 = '../Bilder/bec_density2.eps';
saveas(f4,fn4,'psc2') 


function y = polylog(n,z,acc)
%%POLYLOG - Computes the n-polylogarithm of z (Li_n)
%
% Usage:   y = polylog(n,z)
%          y = polylog(n,z,acc)
%
% Input:  |z|<1 : complex number defined on open unit disk
%          n    : base of polylogarithm
%          acc  : cutoff accuracy
%
% Output: y
%
% -------------------------------------------------------------------------
%  Copyright (C) 2009 Delft University of Technology
%    Faculty of Civil Engineering and Geosciences
%    Willem Ottevanger  
% -------------------------------------------------------------------------
if nargin == 2
   acc = eps;
end

y  = z;
y0 = y;
for j = 1:length(z);
    k = 1;
    err = 1;
    zk = z(j);
    while (abs(err)>acc);
        k = k+1;
        kn = k^n;
        zk = zk.*z(j);
        err = zk./kn;
        y(j) = y(j)+err;
    end
end






