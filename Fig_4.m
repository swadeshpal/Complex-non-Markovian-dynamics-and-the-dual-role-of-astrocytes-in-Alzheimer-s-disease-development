% clear all
% 
% %time variables
% dt=0.1;
% NN = 4001;
% Tend = (NN-1)*dt;
% Time=linspace(0,Tend,NN);
% % sum
% NON=1015;
% TI = 4001;
% load Node_Name_ID.mat
% 
% 
% 
% [Limbic,Frontal,Brain_Stem,Basal_Ganglia,Parietal,Temporal,Occipital] = Regions(SNT,NON);
% r(1)=length(Limbic);
% r(2)=length(Frontal);
% r(3)=length(Brain_Stem);
% r(4)=length(Basal_Ganglia);
% r(5)=length(Parietal);
% r(6)=length(Temporal);
% r(7)=length(Occipital);
% 
% % return
% % hold on
% 
% cd ../Network/Nonuniform/Mu_0_2/Eta_1_0/c1_0.3
% load adjin.dat;
% cd ../../../../../Code
% 
% sum=0;
% for j=1:NON
%     for k=1:NON
%         if j==k
%             adj(NON+1-j,k)=adjin(j,k);
%         else
%             adj(NON+1-j,k) = -adjin(j,k);
%             sum=sum+adj(NON+1-j,k);
%         end
%     end
% end
% 
% avg=sum/((NON-1)*(NON-1));
% for j=1:NON
%     for k=1:NON
%         adjn(j,k) = adj(j,k)/avg; 
%     end
% end
% 
% MXVN1=adjn(:,:);
% MXVNN1=max(MXVN1);
% MXUB=max(MXVNN1);
% 

for j=1:NON
    for k=1:NON
        if j==k
            adjt(j,k)=adjin(j,k);
        else
            adjt(j,k) = -adjin(j,k);
        end
    end
end

for j=1:r(1)
    NOS(j) = Limbic(j);
end
for j=1:r(2)
    NOS(r(1)+j) = Frontal(j);
end
for j=1:r(3)
    NOS(r(1)+r(2)+j) = Brain_Stem(j);
end
for j=1:r(4)
    NOS(r(1)+r(2)+r(3)+j) = Basal_Ganglia(j);
end
for j=1:r(5)
    NOS(r(1)+r(2)+r(3)+r(4)+j) = Parietal(j);
end
for j=1:r(6)
    NOS(r(1)+r(2)+r(3)+r(4)+r(5)+j) = Temporal(j);
end
for j=1:r(7)
    NOS(r(1)+r(2)+r(3)+r(4)+r(5)+r(6)+j) = Occipital(j);
end

for j=1:NON
    for k=1:NON
        nadj(j,k) = adjt(NOS(j),NOS(k));
    end
end
% 
pcolor(nadj);shading flat; colormap(jet);caxis([0 0.7]);

hold on
for j=1:1015
    X1(j) = j;
    Y1(j) = 1;
    Y2(j) = r(1);
    Y3(j) = r(2)+r(1);
    Y4(j) = r(3)+r(2)+r(1);
    Y5(j) = r(4)+r(3)+r(2)+r(1);
    Y6(j) = r(5)+r(4)+r(3)+r(2)+r(1);
    Y7(j) = r(6)+r(5)+r(4)+r(3)+r(2)+r(1);
    Y8(j) = r(7)+r(6)+r(5)+r(4)+r(3)+r(2)+r(1);
end
plot(X1,Y1,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y2,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y3,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y4,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y5,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y6,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y7,'-','color',[1,0,1],'LineWidth',0.8)
plot(X1,Y8,'-','color',[1,0,1],'LineWidth',0.8)

plot(Y1,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y2,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y3,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y4,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y5,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y6,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y7,X1,'-','color',[1,0,1],'LineWidth',0.8)
plot(Y8,X1,'-','color',[1,0,1],'LineWidth',0.8)

text(-35,30,'$$L$$','Interpreter', 'latex', 'fontsize', 10);
text(27,-25,'$$L$$','Interpreter', 'latex', 'fontsize', 10);
text(-37,230,'$$F$$','Interpreter', 'latex', 'fontsize', 10);
text(217,-25,'$$F$$','Interpreter', 'latex', 'fontsize', 10);
text(-37,405,'$$B$$','Interpreter', 'latex', 'fontsize', 10);
text(396,-25,'$$B$$','Interpreter', 'latex', 'fontsize', 10);
text(-37,550,'$$P$$','Interpreter', 'latex', 'fontsize', 10);
text(540,-25,'$$P$$','Interpreter', 'latex', 'fontsize', 10);
text(-37,800,'$$T$$','Interpreter', 'latex', 'fontsize', 10);
text(790,-25,'$$T$$','Interpreter', 'latex', 'fontsize', 10);
text(-37,960,'$$O$$','Interpreter', 'latex', 'fontsize', 10);
text(950,-25,'$$O$$','Interpreter', 'latex', 'fontsize', 10);

ax = gca;
ax.XTick = [];
ax.YTick = [];
xlim([1 1015])
ylim([1 1015])


axis equal tight
% axis off 

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4.5 4.5])
print -dpng Fig_4.png -r500

        
