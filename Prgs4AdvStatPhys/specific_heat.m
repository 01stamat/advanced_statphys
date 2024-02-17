function pressure_ibg()
clear all; close all; clc



L_T_I  = 0:0.001:1;
L_CV_I = 1.925.*L_T_I.^(3/2);

z = [0.1:0.01:0.99];
  
l         = 3/2;
L_g_32    = polylog(l,z);
L_tilde_g = L_g_32./zeta(l);

L_T       = L_tilde_g.^(-2/3);


l      = 5/2;
L_g_52 = polylog(l,z);
 
l      = 1/2;
L_g_12 = polylog(l,z);
 
L_CV = (15/4).*L_g_52./L_g_32 - (9/4).*L_g_32./L_g_12;
 
f4 = figure(4);


L_T_x  = [L_T_I,L_T(end:-1:1)];
L_CV_x = [L_CV_I,L_CV(end:-1:1)];
plot(L_T_x,L_CV_x,'-','linewidth',2); hold on
 
plot([0 10],[1.5 1.5],'--k','linewidth',2); hold on
axis([0 3 0 3])

xlabel('T/T_C','fontsize',20);
ylabel('C_V/(N k_B)','fontsize',20,'Rotation',90);
set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn5 = '../wvdl/cv_ibg.eps';

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

