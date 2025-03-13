clear all
format long

NON = 1015;
dt=0.1;
TI=2001;

cd ../Network/Uniform/Mu_0_1/Eta_1_0/c1_0.3
load ubin.dat;
load vbin.dat;

load UBF.dat;
load VBF.dat;
load QF.dat;

Time(1) = 0;
ub(1,1) = sum(ubin(:))/NON;
vb(1,1) = sum(vbin(:))/NON;
q(1,1) = 0.0;

for j=2:TI
    Time(j)=(j-1)*dt;
    ub(1,j) = sum(UBF(j-1,:))/NON;
    vb(1,j) = sum(VBF(j-1,:))/NON;
    q(1,j) = sum(QF(j-1,:))/NON;
end

cd ../../../../../Code

cd ../Network/Uniform/Mu_0_2/Eta_1_0/c1_0.3
load ubin.dat;
load vbin.dat;

load UBF.dat;
load VBF.dat;
load QF.dat;

ub(2,1) = sum(ubin(:))/NON;
vb(2,1) = sum(vbin(:))/NON;
q(2,1) = 0.0;

for j=2:TI
    ub(2,j) = sum(UBF(j-1,:))/NON;
    vb(2,j) = sum(VBF(j-1,:))/NON;
    q(2,j) = sum(QF(j-1,:))/NON;
end

cd ../../../../../Code

cd ../Network/Uniform/Mu_0_3/Eta_1_0/c1_0.3
load ubin.dat;
load vbin.dat;

load UBF.dat;
load VBF.dat;
load QF.dat;

ub(3,1) = sum(ubin(:))/NON;
vb(3,1) = sum(vbin(:))/NON;
q(3,1) = 0.0;

for j=2:TI
    ub(3,j) = sum(UBF(j-1,:))/NON;
    vb(3,j) = sum(VBF(j-1,:))/NON;
    q(3,j) = sum(QF(j-1,:))/NON;
end

cd ../../../../../Code

% % % HH=legend('show');
% % % set(HH,'Interpreter','latex');
% % % 

subplot(1,2,2)

MC1=jet(21);
MC2=winter(5);
hold on
% 
size = 1.2;
plot(Time,ub(1,:),':','Color',MC1(20,:),'LineWidth',size,'HandleVisibility','off')
plot(Time,vb(1,:),'-','Color',MC1(20,:),'LineWidth',size,'HandleVisibility','off')
% plot(Time,q(1,:),'--','Color',MC1(20,:),'LineWidth',size,'HandleVisibility','off')

plot(Time,ub(2,:),':','Color',MC1(10,:),'LineWidth',size,'HandleVisibility','off')
plot(Time,vb(2,:),'-','Color',MC1(10,:),'LineWidth',size,'HandleVisibility','off')
% plot(Time,q(2,:),'--','Color',MC1(12,:),'LineWidth',size,'HandleVisibility','off')

plot(Time,ub(3,:),':','Color',MC1(1,:),'LineWidth',size,'HandleVisibility','off')
plot(Time,vb(3,:),'-','Color',MC1(1,:),'LineWidth',size,'HandleVisibility','off')
% plot(Time,q(3,:),'--','Color',MC1(1,:),'LineWidth',size,'HandleVisibility','off')

M=2001;
XLL=0;
XUL=200;
YUL=0.2;
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
ax.XTick=[0 40 80 120 160 200];
ax.YTick=[0 0.05 0.1 0.15 0.2];

text(10,0.19,'B','FontSize',14,'Color','k')

xlabel('$$t$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
%  ylabel('$$u$$','Interpreter', 'Latex','FontSize',13,'FontWeight','bold','Color','k')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 3])
print -dpng Fig2.png -r500

