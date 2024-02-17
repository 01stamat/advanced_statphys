function entropy_ibg()
clear all; close all; clc



L_T_I  = 0:0.001:1;

L_S_I  = ((5/2)*(zeta(5/2)/zeta(3/2))).*L_T_I.^(3/2);

plot(L_T_I,L_S_I)

z = [0.01:0.01:0.99];
  
l         = 3/2;
L_g_32    = polylog(l,z);
L_tilde_g = L_g_32./zeta(l);

L_T       = L_tilde_g.^(-2/3);


l      = 5/2;
L_g_52 = polylog(l,z);
l      = 3/2;
L_g_32 = polylog(l,z);
 
L_S    = (5/2).*L_g_52./L_g_32 - log(z);

 
f4 = figure(4);


L_T_x  = [L_T_I,L_T(end:-1:1)];
L_S_x = [L_S_I,L_S(end:-1:1)];
plot(L_T_x,L_S_x,'-','linewidth',2); hold on

L_T_TC = [0.01:0.01:max(L_T_x)];
L_S_cl = (5/2) + (3/2).*log(L_T_TC) - log(zeta(3/2));
plot(L_T_TC,L_S_cl,'--k','linewidth',2); hold on
plot([0 10],[0 0],'-k')
axis([0 5    -2 5])

xlabel('T/T_C','fontsize',20);
ylabel('S/(N M_S k_B)','fontsize',20,'Rotation',90);
set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn5 = 'entropy_ibg.eps';

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

