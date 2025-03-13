clear all
format long

cd ../Network/Uniform/Mu_0_1/Eta_1_0/c1_0.1
load uin.dat;
load ubin.dat;
load vin.dat;
load vbin.dat;

load UF.dat;
load UBF.dat;
load VF.dat;
load VBF.dat;
load WF.dat;
load QF.dat;
cd ../../../../../Code

subplot(1,2,2)

HH=legend('show');
set(HH,'Interpreter','latex');

NON = 1015;

% return
Time(1) = 0;
u(1) = sum(uin(:))/NON;
ub(1) = sum(ubin(:))/NON;
v(1) = sum(vin(:))/NON;
vb(1) = sum(vbin(:))/NON;
w(1) = 0.05;
q(1) = 0.0;

dt=0.1;
TI=2001;

for j=2:TI
    Time(j)=(j-1)*dt;
    u(j) = sum(UF(j-1,:))/NON;
    ub(j) = sum(UBF(j-1,:))/NON;
    v(j) = sum(VF(j-1,:))/NON;
    vb(j) = sum(VBF(j-1,:))/NON;
    w(j) = sum(WF(j-1,:))/NON;
    q(j) = sum(QF(j-1,:))/NON;
end

MC1=jet(21);
MC2=winter(5);
hold on
% 
size = 1.2;
plot(Time,u,'-','Color',MC1(1,:),'LineWidth',size,'DisplayName','$u$')
plot(Time,ub,'-m','LineWidth',size,'DisplayName','$\widetilde{u}$')
plot(Time,v,':','Color',MC1(1,:),'LineWidth',size,'DisplayName','$v$')
plot(Time,vb,':m','LineWidth',size,'DisplayName','$\widetilde{v}$')
plot(Time,w,'-.','Color',MC2(4,:),'LineWidth',size,'DisplayName','$w$')
% plot(Time,q,'--r','LineWidth',size,'DisplayName','$q$')

M=2001;
XLL=0;
XUL=200;
YUL=0.8;
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
ax.YTick=[0 0.2 0.4 0.6 0.8 1];
text(20,0.77,'B','FontSize',14,'Color','k')
xlabel('$$t$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
%  ylabel('$$u$$','Interpreter', 'Latex','FontSize',13,'FontWeight','bold','Color','k')

set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 3])
print -dpng Fig1.png -r500

