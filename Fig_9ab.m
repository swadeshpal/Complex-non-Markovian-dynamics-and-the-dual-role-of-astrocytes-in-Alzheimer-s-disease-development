clear all
format long

load Centers.dat;
load Connections.dat;


x=Connections(:,1); y=Connections(:,2); 
C=Centers;

X(1,:)=C(x(:),1); X(2,:)=C(y(:),1); Y(1,:)=C(x(:),2); Y(2,:)=C(y(:),2); Z(1,:)=C(x(:),3); Z(2,:)=C(y(:),3);


% % 

N_node=1015;
load Node_Name_ID.mat
[Limbic,Frontal,Brain_Stem,Basal_Ganglia,Parietal,Temporal,Occipital] = Regions(SNT,N_node);

MC=flipud(jet(7));



for nnn=1:length(Limbic)
    NColor(Limbic(nnn),:)=MC(1,:);
end

for nnn=1:length(Frontal)
    NColor(Frontal(nnn),:)=MC(2,:);
end

for nnn=1:length(Brain_Stem)
    NColor(Brain_Stem(nnn),:)=MC(3,:);
end

for nnn=1:length(Basal_Ganglia)
    NColor(Basal_Ganglia(nnn),:)=MC(4,:);
end

for nnn=1:length(Parietal)
    NColor(Parietal(nnn),:)=MC(5,:);
end

for nnn=1:length(Temporal)
    NColor(Temporal(nnn),:)=MC(6,:);
end

for nnn=1:length(Occipital)
    NColor(Occipital(nnn),:)=MC(7,:);
end
% return
subplot(1,2,1)
axis tight; hold on; axis equal ; view(-92,-2); grid; light 
plot3(X,Y,Z,'LineWidth',0.01,'Color',[0 0 0 0.05]);
camlight
[xx,yy,zz]=sphere;
rr=0.75;
for nnn=1:size(Centers,1)
    hSurface=surf(rr*xx+C(nnn,1),rr*yy+C(nnn,2),rr*zz+C(nnn,3));  
    hold on
    set(hSurface,'FaceColor',NColor(nnn,:),'EdgeColor','none','FaceLighting','gouraud','facealpha',0.5);
    axis off
    
    pause(0.001)
end
view(88,90);
subplot(1,2,2)
axis tight; hold on; axis equal ; view(-92,-2); grid; light 
plot3(X,Y,Z,'LineWidth',0.01,'Color',[0 0 0 0.05]);
camlight
[xx,yy,zz]=sphere;
rr=0.75;
for nnn=1:size(Centers,1)
    hSurface=surf(rr*xx+C(nnn,1),rr*yy+C(nnn,2),rr*zz+C(nnn,3));  
    hold on
    set(hSurface,'FaceColor',NColor(nnn,:),'EdgeColor','none','FaceLighting','gouraud','facealpha',0.5);
    axis off
    
    pause(0.001)
end
view(87,2);
% 
% % return
text(-1700,0,'A','FontSize',14,'Color','k')
text(-1700,110,'B','FontSize',14,'Color','k')

% text(370,0.1,'(a)','FontSize',14,'Color','k')
pause(2)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 3])
print -dpng Fig9.png -r500
% text(370,0.1,'(a)','FontSize',14,'Color','k')
return
view(87,2);
pause(2)
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3])
print -dpng Fig_9b.png -r500
