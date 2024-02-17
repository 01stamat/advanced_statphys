clear all; close all; clc


L_kTJ  = [0.5,2,10,100];



f4      = figure(1);
L_b     = -2:0.01:2;
L_ch    = cosh(L_b);
leg_txt = cell(3,1);


symb(1,:) = '-b ';
symb(2,:) = '--r';
symb(3,:) = '--g';
symb(4,:) = '-k ';

ic   = 0;
for kTJ = L_kTJ
    ic    = ic + 1;
    j     = 1/kTJ;
    L_D   = sqrt(sinh(L_b).^2 + exp(-4.*j)) ;
    L_lt1 = L_ch + L_D;
    L_lt2 = L_ch - L_D;
    L_M   = sinh(L_b) ./ L_D;
    plot(L_b,L_M,symb(ic,:),'linewidth',2); hold on
    
    
    leg_txt(ic) = {['k_B T / J = ',num2str(kTJ)]};
end



plot(L_b,zeros(size(L_b)),'-k','linewidth',1);
plot(L_b,ones(size(L_b)),'-k','linewidth',1);
plot(L_b,-ones(size(L_b)),'-k','linewidth',1);
plot([0 0],[-2 2],'-k','linewidth',1);
axis([-2 2 -1.2 1.2])




xlabel('\mu B','fontsize',16);
ylabel('M / (\mu N)','fontsize',16);



set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);

legend(leg_txt,'Location','SouthEast')


fn4 = '../Bilder/ising.eps';


saveas(f4,fn4,'psc2')


