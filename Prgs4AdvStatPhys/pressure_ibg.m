function pressure_ibg()
clear all; close all; clc


z = [0.25:0.01:0.99,0.999,0.9999];
l = 3/2;
L_nu = polylog(l,z)./zeta(l);%
%plot(z,L_nu);

l = 5/2;
L_p = polylog(l,z)./zeta(l);

f4 = figure(4);

hold on;





axis([0 7 0 5]);



T=1.5;
c='-.r';
L_x = [T^(-3/2)./L_nu,T^(-3/2),0];
L_y = [L_p.*T^(5/2),T^(5/2), T^(5/2) ];
plot(L_x, L_y,c,'linewidth',2); hold on


T=1;
c='-.b';
L_x = [T^(-3/2)./L_nu,T^(-3/2),0];
L_y = [L_p.*T^(5/2),T^(5/2), T^(5/2) ];
plot(L_x, L_y,c,'linewidth',2); hold on


T=1.5;
L_x = 0.1:0.01:10;
L_y = L_x.^(-5/3);
plot(L_x,L_y,'--k','linewidth',2);
c='xr'
plot([T^(-3/2)],[T^(5/2)],c,'linewidth',2,'markersize',10); hold on
T=1;
c='xb';
plot([T^(-3/2)],[T^(5/2)],c,'linewidth',2,'markersize',10); hold on




xlabel('1/n = v','fontsize',20);
ylabel('p','fontsize',20,'Rotation',0);
set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);

%text(6,0.5,'T_1','fontsize',20);
%text(1.5,2.5,'T_2','fontsize',20);
text(4,2,'T_2 > T_1','fontsize',20);

legend('p(1/n,T_2)','p(1/n,T_1)','Phasengrenze')
%axis([0 2 0 1.1])

fn4 = '../Bilder/pressure_ibg.pdf';
fn5 = '../Bilder/pressure_ibg.eps';
saveas(f4,fn4,'pdf')
saveas(f4,fn5,'psc2')

end

function y = polylog(n,z)
acc = eps;
y   = z;
y0  = y;
for j = 1:length(z);
    k   = 1;
    err = 1;
    zk  = z(j);
    while (abs(err)>acc);
        k    = k+1;
        kn   = k^n;
        zk   = zk.*z(j);
        err  = zk./kn;
        y(j) = y(j)+err;
    end
end
end

