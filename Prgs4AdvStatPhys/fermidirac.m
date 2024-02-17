clear all; close all; clc

L_kT = [0.1 0.01 0.0001 ];
N_kT = numel(L_kT);

mu = 1;

L_Emu = 0:0.001:4;


f4 = figure(4);
hold on;

symb(1,1:3) = '-b ';
symb(2,1:3) = '--r';
symb(3,1:3) = '--g';
symb(4,1:3) = '-k ';
leg_txt = cell(N_kT,1);


ic   = 0;
for ic = 1: N_kT
    bmu = 1./L_kT(ic);
    L_f = 1./(exp(bmu.*(L_Emu-1))+1);
    plot(L_Emu,L_f,symb(ic,:),'linewidth',2); hold on;
    leg_txt(ic) = {['k_{B}T = ',num2str(1./bmu)]};
end


xlabel('E','fontsize',20,'position',[1.5,-.1]);
ylabel('f_{D}(E,T)','fontsize',20);

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);
legend(leg_txt,'Location','SouthWest')


plot([0 2],[.5 .5],'-k'); 
plot([1 1],[0 1.2],'-k'); 

axis([0 2 0 1.1])


text(1,-0.15,'\mu','fontsize',20,'HorizontalAlignment','center')

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn4 = '../Bilder/fermi_dirac.eps';


saveas(f4,fn4,'psc2')








