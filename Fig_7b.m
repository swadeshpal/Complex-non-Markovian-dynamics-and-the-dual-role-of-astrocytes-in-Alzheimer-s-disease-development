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
load BrainID.mat

[ID,Num] = BrainIDs(SNT,BrainID,NON); 

cd ../Network/Nonuniform/Mu_0_2/Eta_1_0/c1_0.3
load QF.dat;

Time(1) = 0;
for k=1:NON
    TV(1,k) = 0;
end
for j=2:TI
    Time(j)=(j-1)*dt;
    for k=1:NON
        TV(j,k) = QF(j-1,k);
    end
end

cd ../../../../../Code

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
% % % 
subplot(1,2,2)
% return
MC=flipud(jet(49));

hold on
size =1;
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
text(20,1.15,'B','FontSize',14,'Color','k')
xlabel('$$t$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
%  ylabel('$$u$$','Interpreter', 'Latex','FontSize',13,'FontWeight','bold','Color','k')
% 


set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 4.5])
print -dpng Fig7.png -r500





