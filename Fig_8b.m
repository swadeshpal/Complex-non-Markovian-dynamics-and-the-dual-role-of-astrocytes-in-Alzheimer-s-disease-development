clear all

%time variables
dt=0.1;
NN = 4001;
Tend = (NN-1)*dt;
Time=linspace(0,Tend,NN);
% sum
NON=1015;
TI = 4001;
load Node_Name_ID.mat



[Limbic,Frontal,Brain_Stem,Basal_Ganglia,Parietal,Temporal,Occipital] = Regions(SNT,NON);
r(1)=length(Limbic);
r(2)=length(Frontal);
r(3)=length(Brain_Stem);
r(4)=length(Basal_Ganglia);
r(5)=length(Parietal);
r(6)=length(Temporal);
r(7)=length(Occipital);

% return
% hold on

cd ../Network/Nonuniform/Mu_0_2/Eta_0_8/c1_0.3
load vbin.dat;
load VBF.dat;

Time(1) = 0;
for k=1:NON
    TV(1,k) = vbin(k);
end
for j=2:TI
    Time(j)=(j-1)*dt;
    for k=1:NON
        TV(j,k) = VBF(j-1,k);
    end
end

cd ../../../../../Code

for n=1:TI

    sum1=0;
    for j=1:length(Limbic)
        sum1=sum1+TV(n,Limbic(j));
    end
    MM1(n)= (1/r(1))*sum1;
    
    sum2=0;
    for j=1:length(Frontal)
        sum2=sum2+TV(n,Frontal(j));
    end
    MM2(n)= (1/r(2))*sum2;
    
    sum3=0;
    for j=1:length(Brain_Stem)
        sum3=sum3+TV(n,Brain_Stem(j));
    end
    MM3(n)= (1/r(3))*sum3;
    
    sum4=0;
    for j=1:length(Basal_Ganglia)
        sum4=sum4+TV(n,Basal_Ganglia(j));
    end
    MM4(n)= (1/r(4))*sum4;

    sum5=0;
    for j=1:length(Parietal)
        sum5=sum5+TV(n,Parietal(j));
    end
    MM5(n)= (1/r(5))*sum5;

    sum6=0;
    for j=1:length(Temporal)
        sum6=sum6+TV(n,Temporal(j));
    end
    MM6(n)= (1/r(6))*sum6;
    sum7=0;
    for j=1:length(Occipital)
        sum7=sum7+TV(n,Occipital(j));
    end
    MM7(n)= (1/r(7))*sum7;
      
    disp(n);
end
% % % 
% subplot(1,2,2)
MC=flipud(jet(7));
HH=legend('show');
set(HH,'Interpreter','latex');

hold on
size =1.5;
% 
LineSty = '-';
plot(Time,MM1,LineSty,'Color',MC(1,:),'LineWidth',size,'DisplayName','$Limbic$')
plot(Time,MM2,LineSty,'Color',MC(2,:),'LineWidth',size,'DisplayName','$Frontal$')
plot(Time,MM3,LineSty,'Color',MC(3,:),'LineWidth',size,'DisplayName','$Brain~Stem$')
plot(Time,MM4,LineSty,'Color',MC(4,:),'LineWidth',size,'DisplayName','$Basal~Ganglia$')
plot(Time,MM5,LineSty,'Color',MC(5,:),'LineWidth',size,'DisplayName','$Parietal$')
plot(Time,MM6,LineSty,'Color',MC(6,:),'LineWidth',size,'DisplayName','$Temporal$')
plot(Time,MM7,LineSty,'Color',MC(7,:),'LineWidth',size,'DisplayName','$Occipital$')


% plot(Time,MM1,LineSty,'Color',MC(1,:),'LineWidth',2)
% plot(Time,MM2,LineSty,'Color',MC(2,:),'LineWidth',2)
% plot(Time,MM3,LineSty,'Color',MC(3,:),'LineWidth',2)
% plot(Time,MM4,LineSty,'Color',MC(4,:),'LineWidth',2)
% plot(Time,MM5,LineSty,'Color',MC(5,:),'LineWidth',2)
% plot(Time,MM6,LineSty,'Color',MC(6,:),'LineWidth',2)
% plot(Time,MM7,LineSty,'Color',MC(7,:),'LineWidth',2)


M=4001;
XLL=0;
XUL=400;
YUL=1.2;
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
ax.YTick=[0 0.2 0.4 0.6 0.8 1 1.2];
% text(20,1.15,'B','FontSize',14,'Color','k')
xlabel('$$t$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
%  ylabel('$$u$$','Interpreter', 'Latex','FontSize',13,'FontWeight','bold','Color','k')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 6 4.5])
print -dpng Fig_8b.png -r500





