clear all; close all; clc





V  = [0,0;1,0;1,2;0,2;0,0];

f4 = figure(4)
plot(V(:,1),V(:,2),'-b','linewidth',2); hold on
plot([0,1],[1,1],'--k','linewidth',2)




axis([-.2 1.2 -.2 2.2])

axis equal
axis off

text(0.25,1.5,'N_o, V_o','fontsize',22,'color','b');
text(0.25,0.5,'N_u, V_u','fontsize',22,'color','b');
text(-.2,1.0,'A','fontsize',22,'color','k');




set(gca, 'XTickLabel', {''},'XTick',.7,'YTick',2.26);

set(gca,'position',[0.2 0.2 0.7 0.7]);
set(gca,'fontsize',16);


fn4 = '../Bilder/model_boxes1.eps';


% ---------------------------------

f5 = figure(5)

V  = [0,0;1,0;1,2;0,2;0,0];
plot(V(:,1),V(:,2),'-b','linewidth',2); hold on
plot([0,1],[1,1],'--k','linewidth',2)

dx  = 2;
Ldx =[dx,0]
V  = [0,0;1,0;1,2;0,2;0,0] + repmat(Ldx,5,1);
plot(V(:,1),V(:,2),'-b','linewidth',2); hold on
plot([dx,1+dx],[1,1],'--k','linewidth',2)


axis([-.2 2.5 0 2.5])

axis equal
axis off


text(0.2,1.5,'N_o^{(1)}, V_o^{(1)}','fontsize',18,'color','b');
text(0.2,0.5,'N_u^{(1)}, V_u^{(1)}','fontsize',18,'color','b');
%text(-.2,1.0,'A','fontsize',22,'color','k'18


text(1.15,1.,' <- E ->','fontsize',20,'color','b');

text(0.2+dx,1.5,'N_o^{(2)} , V_o^{(2)}','fontsize',18,'color','b');
text(0.2+dx,0.5,'N_u^{(2)}, V_u^{(2)}','fontsize',18,'color','b');
%text(-.2+dx,1.0,'A','fontsize',22,'color','k');

text(-0.5,1.5,'E_o','fontsize',20,'color','k');
text(-0.5,0.5,'E_u','fontsize',20,'color','k');


text(0.4,2.6,'\Sigma^{(1)}:','fontsize',20,'color','k');
text(0.,2.25,'E^{(1)},N^{(1)},V^{(1)}','fontsize',18,'color','k');

text(2.4,2.6,'\Sigma^{(2)}:','fontsize',20,'color','k');
text(2.,2.25,'E^{(2)},N^{(2)},V^{(2)}','fontsize',18,'color','k');


set(gca, 'XTickLabel', {''},'XTick',.7,'YTick',2.26);

set(gca,'position',[0.2 0.2 0.7 0.7]);

set(gca,'fontsize',16);


fn5 = '../Bilder/model_boxes2.eps';


saveas(f4,fn4,'psc2')
saveas(f5,fn5,'psc2')

