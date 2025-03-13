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
% load BrainID.mat
% 
% [ID,Num] = BrainIDs(SNT,BrainID,NON); 
% 
% cd ../Network/Nonuniform/Mu_0_2/Eta_1_0/c1_0.3
% load vbin.dat;
% load VBF.dat;
% 
% Time(1) = 0;
% for k=1:NON
%     TV(1,k) = vbin(k);
% end
% for j=2:TI
%     Time(j)=(j-1)*dt;
%     for k=1:NON
%         TV(j,k) = VBF(j-1,k);
%     end
% end
% 
% cd ../../../../../Code

for j=1:length(BrainID)
    for n=1:TI
        sum=0;
        for k=1:Num(j)
            sum=sum+TV(n,ID(j,k));
        end
        SPID(j,n)= (1/Num(j))*sum;
    end
%     disp(j)
end
% 
subplot(1,2,1)
% return
MC=flipud(jet(49));

hold on
size =1.0;
% 
LineSty = '-';
for j=1:length(BrainID)
    plot(Time,SPID(j,:),LineSty,'Color',MC(j,:),'LineWidth',size,'HandleVisibility','off')
    disp(j)
    pause(0.001)
end


M=4001;
XLL=0;
XUL=400;
YUL=6;
YLL=0;
for k=1:M
    YA(k)=YLL+(k-1)*(YUL-YLL)/(M-1); 
    XA(k)=XLL+(k-1)*(XUL-XLL)/(M-1); 
    XL(k)=XLL;
    XR(k)=XUL;
    YL(k)=YLL;
    YU(k)=YUL;
end
 xlim([XLL XUL])
 ylim([YLL YUL])


%  
size=1.0;
plot(XA,YL,'-k','LineWidth',size,'HandleVisibility','off'); 
plot(XA,YU,'-k','LineWidth',size,'HandleVisibility','off');
plot(XL,YA,'-k','LineWidth',size,'HandleVisibility','off'); 
plot(XR,YA,'-k','LineWidth',size,'HandleVisibility','off');

ax = gca;
ax.XTick=[0 100 200 300 400];
ax.YTick=[0 1 2 3 4 5 6];
text(20,5.75,'A','FontSize',14,'Color','k')
xlabel('$$t$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
%  ylabel('$$u$$','Interpreter', 'Latex','FontSize',13,'FontWeight','bold','Color','k')

rectangle('Position',[0 0 4 0.7],'EdgeColor','k','LineWidth',1.5)
p1 = [0 0.7];
p2 = [77.5 5.31];
plot([ p1(1) p2(1)], [p1(2) p2(2)],'--k');
 
p1 = [4 0];
p2 = [179 1.36];
plot([ p1(1) p2(1)], [p1(2) p2(2)],'--k');
 
rectangle('Position',[300 0 50 0.8],'EdgeColor','k','LineWidth',1.5)

p1 = [300 0];
p2 = [258 1.4];
plot([ p1(1) p2(1)], [p1(2) p2(2)],'--k');
 
p1 = [350 0];
p2 = [361 1.4];
plot([ p1(1) p2(1)], [p1(2) p2(2)],'--k');
 
ax2 = axes('Position',[.195 .3 .09 .53]);
box on;
TIS1 = 1;
TIE1 = 41;
hold on
LineSty = '-';
for j=1:length(BrainID)
    plot(Time(TIS1:TIE1),SPID(j,TIS1:TIE1),LineSty,'Color',MC(j,:),'LineWidth',size,'HandleVisibility','off')
    disp(j)
    pause(0.001)
end
ax = gca;
ax.XTick=[0 2 4 6];
ax.YTick=[0 0.05 0.1];
set(gca,'xaxisLocation','top')
set(gca,'yaxisLocation','right')

ax3 = axes('Position',[.345 .3 .088 .53]);
% ax3 = axes('Position',[.63 .3 .2 .53]);
box on;
TIS2 = 3001;
TIE2 = 3501;
hold on
LineSty = '-';
for j=1:length(BrainID)
    plot(Time(TIS2:TIE2),SPID(j,TIS2:TIE2),LineSty,'Color',MC(j,:),'LineWidth',size,'HandleVisibility','off')
    disp(j)
    pause(0.001)
end
ax = gca;
ax.XTick=[300 325 350];
ax.YTick=[0 0.2 0.4 0.6 0.8];

set(gca,'xaxisLocation','top')
set(gca,'yaxisLocation','right')
xlim([Time(TIS2) Time(TIE2)])

% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4.5])
% print -dpng Fig_7a.png -r500


% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 4.5])
% print -dpng Fig7.png -r500


