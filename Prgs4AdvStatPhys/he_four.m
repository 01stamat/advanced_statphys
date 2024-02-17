clear all; close all; clc


f4 = figure(4)

L_T = 0:0.01:1;
L_y = 2.26.* L_T.^(3/2);

plot(L_T,L_y,'-k','linewidth',2); hold on
plot(1,2.26,'.k','markersize',30);


L_T = 0:0.01:2;
L_y = 4 + 3.* L_T.^(3/2);
plot(L_T,L_y,'-k','linewidth',2); hold on


x1 = 0.7; y1 =  2.26.* x1.^(3/2);
x2 = 0.3; y2 = 4 + 3.* x2.^(3/2);
plot([x1,x2],[y1,y2],'--r','linewidth',2)



xlabel('T','fontsize',20,'position',[1.8,-0.25]);
ylabel('p/atm','fontsize',20,'Rotation',0,'position',[-.2,4.5]);

set(gca, 'XTickLabel', {''},'XTick',.7,'YTick',2.26);

text(.5,-.6,'T_\lambda = 2.18K','fontsize',22);
text(1.1,2.5,'Gas-Flüssigkeit','fontsize',18);
text(1.1,1.99,'kritischer Punkt','fontsize',18);


text(0.7,3.8,'normale Flüssigkeit','fontsize',22,'color','b');
text(1.1,1.,'Gas','fontsize',22,'color','b');
text(0.1,1.9,'super-','fontsize',22,'color','b','rotation',0);
text(0.1,1.4,'fluid','fontsize',22,'color','b','rotation',0);
text(0.1,5.4,'fest','fontsize',22,'color','b','rotation',0);

text(.47,3.9,'\lambda-Übergang','fontsize',16,'color','r','rotation',-60);
axis([0 2 0 6.5]);

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn5 = '../wvdl/he_four.eps';


saveas(f4,fn5,'psc2')


