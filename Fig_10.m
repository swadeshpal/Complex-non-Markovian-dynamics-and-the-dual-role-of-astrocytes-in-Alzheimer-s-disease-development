% clear all
% 
% % %time variables
% dt=0.1;
% NN = 4001;
% Tend = (NN-1)*dt;
% Time=linspace(0,Tend,NN);
% % sum
% NON=1015;
% TI = 4001;
% % load Node_Name_ID.mat
% % 
% % 
% % HH=legend('show');
% % set(HH,'Interpreter','latex');
% % 
% % [Limbic,Frontal,Brain_Stem,Basal_Ganglia,Parietal,Temporal,Occipital] = Regions(SNT,NON);
% % r(1)=length(Limbic);
% % r(2)=length(Frontal);
% % r(3)=length(Brain_Stem);
% % r(4)=length(Basal_Ganglia);
% % r(5)=length(Parietal);
% % r(6)=length(Temporal);
% % r(7)=length(Occipital);
% 
% % return
% % hold on
% 
% cd ../Network/Nonuniform/Mu_0_2/Eta_1_0/c1_0.3
% load QF.dat;
% 
% Time(1) = 0;
% for k=1:NON
%     TV1(1,k) = 0;
% end
% for j=2:TI
%     Time(j)=(j-1)*dt;
%     for k=1:NON
%         TV1(j,k) = QF(j-1,k);
%     end
% end
% 
% cd ../../../../../Code
% 
% cd ../Network/Nonuniform/Mu_0_2/Eta_0_8/c1_0.3
% load QF.dat;
% 
% Time(1) = 0;
% for k=1:NON
%     TV2(1,k) = 0;
% end
% for j=2:TI
%     Time(j)=(j-1)*dt;
%     for k=1:NON
%         TV2(j,k) = QF(j-1,k);
%     end
% end
% 
% cd ../../../../../Code
% 
% MX = 0.999827;
% MN = 0;
% 
% load Centers.dat;
ah = subplot(2,4,1);
%nodeplotq(Centers,TV1(250,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,5);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV2(250,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,2);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV1(500,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,6);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV2(500,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,3);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV1(1500,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,7);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV2(1500,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,4);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV1(4000,:),MX,MN)
pause(0.0001)

ah=subplot(2,4,8);
CPOS=get(ah,'Position');
set(ah,'Position',CPOS+[0,0.05,0,0]);
%nodeplotq(Centers,TV2(4000,:),MX,MN)
pause(0.0001)

fig = figure(1);
caxis(ah,[MN,MX]);
h = axes(fig,'visible','off');
c = colorbar(h,'Position',[0.93 0.168 0.022 0.7]);
colormap(c,'jet')

% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 3])
% print -dpng Fig_10.png -r500



