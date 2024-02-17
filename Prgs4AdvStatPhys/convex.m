close all; clear all; clc

for iii = 1: 2
    if iii == 1
        fig10 = figure(10);
    else
        fig20 = figure(20);
    end
    subplot(2,1,1)
    hold on
    L_V = [0.05:0.001:2];
    
    a = 1;
    b = 1;
    c = 1;
    L_F = a./L_V + b.*exp(-c*L_V);
    
    L_p = -diff(L_F)./diff(L_V);
    
    Va = .2;
    Vb = .4;
    iy = -2;
    iyt = 8;
    txtx = '$T> T_C$';
    if iii == 2
        txtx = '$T< T_C$';
        iy = -1;
        iyt = 5;
        [~,ia] = min(abs(L_V-Va));
        [~,ib] = min(abs(L_V-Vb));
        ii = find(and(Va <= L_V,L_V<= Vb));
        pa = L_p(ia);
        L_p2 = L_p(ia+1:end);
        L_p(ia:ib) = pa;
        NN = numel(L_p)-ib
        L_p(ib:end) = L_p2(1:NN+1);
        dV = L_V(2)-L_V(1);
        L_F  = [0,-cumsum(L_p)]*dV;    
        L_F  = L_F - 1.*L_F(end);
        L_F  = L_F*(8/L_F(1));
        plot([Va,Va],[0 L_F(ia)],'-k','linewidth',2);
        plot([Vb,Vb],[0 L_F(ib)],'-k','linewidth',2);
        lt = text(Va,iy,'$V_\alpha$','HorizontalAlignment','center','color','black');
        set(lt,'fontsize',18,'interpreter','latex')
        lt = text(Vb,iy,'$V_\beta$','HorizontalAlignment','center','color','black');
        set(lt,'fontsize',18,'interpreter','latex')
    end
    
    
    
    plot(L_V,L_F,'-b','linewidth',2);
    
   
   
    V0 = .3;
    
    [~,imin] = min(abs(L_V-V0));
    
    F0 = L_F(imin); 
    plot(V0,F0,'ok','markersize',8)
    

    slope = (L_F(imin+1)-L_F(imin))/(L_V(imin+1)-L_V(imin));
    
   
    
    F00 = F0 -slope*V0;
    plot([0,V0],[F00,F0],'-r','linewidth',2);
    xs  = -.05;
    plot([0,V0],[F0,F0],'-b','linewidth',2);
    plot([V0,V0],[0,F0],'-b','linewidth',2);
    lt = text(V0,iy,'$V_0$','HorizontalAlignment','center','color','blue');
    set(lt,'fontsize',18,'interpreter','latex')
    
    
    lt = text(xs,F0,'$F_0$','HorizontalAlignment','center','color','blue');
    set(lt,'fontsize',18,'interpreter','latex')
    lt = text(xs,F00,'$G_0$','HorizontalAlignment','center');
    set(lt,'fontsize',18,'interpreter','latex','color','red')
    lt = text(xs,(F0+F00)/2,'$p_0 V_0$','HorizontalAlignment','center');
    plot([0, 0],[F0, F00],'-k','linewidth',3)
    set(lt,'fontsize',18,'interpreter','latex','color','black')
    lt = text(xs,10,'$F$','HorizontalAlignment','center');
    set(lt,'fontsize',18,'interpreter','latex')
    
    
    
    lt = text(.55,iy,'$V$','HorizontalAlignment','center','color','black');
    set(lt,'fontsize',18,'interpreter','latex')
    
    lt = text(.4,iyt,txtx);
    set(lt,'fontsize',24,'interpreter','latex')
    
    
    lt = text(V0,F0*1.2,'$-\frac{\partial F}{\partial V}|_{V_0} \Rightarrow p_0$');
    set(lt,'fontsize',18,'interpreter','latex','color','red')
    
    set(gca,'fontsize',18);
    if iii==1
        axis([0 .6 0 10])
    else
        axis([0 .6 0 6])
    end
    
    set(gca,'XTicklabel',[]);
    set(gca,'yTicklabel',[]);
    
    
    
    set(gca,'fontsize',18);
    
    subplot(2,1,2)
    hold on
    
    plot(L_V(2:end),L_p,'-b','linewidth',2);
    
    
    lt = text(.55,-10,'$V$','HorizontalAlignment','center','color','black');
    set(lt,'fontsize',18,'interpreter','latex')
    
    
    
    lt =ylabel('$p=-\frac{\partial F}{\partial V}$');
    set(lt,'fontsize',18,'interpreter','latex')
    
    
    lt = text(.4,40,txtx);
    set(lt,'fontsize',24,'interpreter','latex')
    
    
    
    if iii == 2
        plot([Va,Va],[0 L_p(ia)],'-k','linewidth',2);
        plot([Vb,Vb],[0 L_p(ib)],'-k','linewidth',2);
        lt = text(Va,-10,'$V_\alpha$','HorizontalAlignment','center','color','black');
        set(lt,'fontsize',18,'interpreter','latex')
        lt = text(Vb,-10,'$V_\beta$','HorizontalAlignment','center','color','black');
        set(lt,'fontsize',18,'interpreter','latex')
        lt = text((Va+Vb)/2,1.2*L_p(ia),'$p_{\alpha\beta}$','HorizontalAlignment','center','color','black');
        set(lt,'fontsize',18,'interpreter','latex')
    end
    set(gca,'XTicklabel',[]);
    set(gca,'yTicklabel',[]);
    
    
    
    
    
    
    axis([0 .6 0 60])
    
    if iii == 1
        saveas(fig10,'convex_above_Tc.pdf','pdf');
    else
        saveas(fig20,'convex_below_Tc.pdf','pdf');
    end
    
end
