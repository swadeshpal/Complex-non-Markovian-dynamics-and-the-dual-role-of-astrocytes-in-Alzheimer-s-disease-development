% clear all
% format long
% 
% cd ../Network/Uniform/Mu_0_1/Eta_1_0/c1_0.1
% load uin.dat;
% load ubin.dat;
% load vin.dat;
% load vbin.dat;
% 
% load UF.dat;
% load UBF.dat;
% load VF.dat;
% load VBF.dat;
% load WF.dat;
% load QF.dat;
% cd ../../../../../Code

subplot(1,2,1)

HH=legend('show');
set(HH,'Interpreter','latex');

NON = 1015;

Time(1) = 0;
u(1,:) = uin(:);
ub(1,:) = ubin(:);
v(1,:) = vin(:);
vb(1,:) = vbin(:);
for j=1:NON
    w(1,j) = 0.05;
    q(1,j) = 0.0;
end
dt=0.1;
TI=2001;

for n=2:TI
    Time(n)=(n-1)*dt;
    u(n,:) = UF(n-1,:);
    ub(n,:) = UBF(n-1,:);
    v(n,:) = VF(n-1,:);
    vb(n,:) = VBF(n-1,:);
    w(n,:) = WF(n-1,:);
    q(n,:) = QF(n-1,:);
end

MC1=jet(21);
MC2=winter(5);
hold on
% % 


size = 1.0;
for j=1:NON-1
    plot(Time,u(:,j),'-','Color',MC1(1,:),'LineWidth',size,'HandleVisibility','off')
    plot(Time,ub(:,j),'-m','LineWidth',size,'HandleVisibility','off')
    plot(Time,v(:,j),':','Color',MC1(1,:),'LineWidth',size,'HandleVisibility','off')
    plot(Time,vb(:,j),':m','LineWidth',size,'HandleVisibility','off')
    plot(Time,w(:,j),'-.','Color',MC2(4,:),'LineWidth',size,'HandleVisibility','off')
%     plot(Time,q(:,j),'--r','LineWidth',size,'HandleVisibility','off')
    pause(0.001)
end
for j=NON:NON
    plot(Time,u(:,j),'-','Color',MC1(1,:),'LineWidth',size,'DisplayName','$u$')
    plot(Time,ub(:,j),'-m','LineWidth',size,'DisplayName','$\widetilde{u}$')
    plot(Time,v(:,j),':','Color',MC1(1,:),'LineWidth',size,'DisplayName','$v$')
    plot(Time,vb(:,j),':m','LineWidth',size,'DisplayName','$\widetilde{v}$')
    plot(Time,w(:,j),'-.','Color',MC2(4,:),'LineWidth',size,'DisplayName','$w$')
%     plot(Time,q(:,j),'--r','LineWidth',size,'HandleVisibility','off')
    pause(0.001)
end

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


text(20,0.77,'A','FontSize',14,'Color','k')

xlabel('$$t$$','Interpreter', 'Latex','FontSize',12,'FontWeight','bold','Color','k')
%  ylabel('$$u$$','Interpreter', 'Latex','FontSize',13,'FontWeight','bold','Color','k')

% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3])
% print -dpng Fig_1a.png -r500

