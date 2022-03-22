close all;

figure(1)%位置估计
plot(t,y7(:,1),t,y5(:,[1 2 3 4 5]))
legend('$x_{0,1}$','${\hat{x}_{0,1}}^1$','${\hat{x}_{0,1}}^2$','${\hat{x}_{0,1}}^3$','${\hat{x}_{0,1}}^4$','${\hat{x}_{0,1}}^5$','interpreter','latex','linewidth',1.5,'fontsize',15);

figure(2)%速度估计
plot(t,y7(:,2),t,y5(:,[1 2 3 4 5]+5))
legend('$v_{0,1}$','${\hat{v}_{0,1}}^1$','${\hat{v}_{0,1}}^2$','${\hat{v}_{0,1}}^3$','${\hat{v}_{0,1}}^4$','${\hat{v}_{0,1}}^5$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
figure(3)%加速度估计
plot(t,y7(:,3),t,y5(:,[1 2 3 4 5]+5+5))
legend('$a_{0,1}$','${\hat{a}_{0,1}}^1$','${\hat{a}_{0,1}}^2$','${\hat{a}_{0,1}}^3$','${\hat{a}_{0,1}}^4$','${\hat{a}_{0,1}}^5$','interpreter','latex','linewidth',1.5,'fontsize',15);



% figure(5)
% plot(t,ut)

%%位置跟踪误差
figure(4)
% subplot(1,3,1)
plot(t,y6(:,[1 2 3 4 5]),t,y7(:,1),'LineWidth',2)
xlabel('时间/s','FontSize',15);ylabel('智能体的位置状态轨迹','FontSize',15);
title({'智能体的位置初始值 x(0)=(1,2,3,-1,-2)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
% title({'智能体的位置初始值 x(0)=(10,20,30,-10,-20)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
legend('x1','x2','x3','x4','x5','x0','FontSize',12)

%%速度跟踪误差
figure(5)
% subplot(1,3,2)
plot(t,y6(:,[1 2 3 4 5]+5),t,y7(:,2),'LineWidth',2)
xlabel('时间/s','FontSize',15);ylabel('智能体的速度状态轨迹','FontSize',15);
title({'智能体的速度初始值 v(0)=(0,0,0,0,0)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
legend('v1','v2','v3','v4','v5','v0','FontSize',12)

%%加速度跟踪误差
figure(6)
% subplot(1,3,3)
plot(t,y6(:,[1 2 3 4 5]+5+5),t,y7(:,3),'LineWidth',2)
xlabel('时间/s','FontSize',15);ylabel('智能体的加速度状态轨迹','FontSize',15);
title({'智能体的加速度初始值 a(0)=(0,0,0,0,0)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
legend('a1','a2','a3','a4','a5','a0','FontSize',12)


% figure(1)
% plot(t,y5(:,[1 2 3 4 5]));




% figure(4); %位置估计误差
% plot(t,y5(:,[1 2 3 4 5])-y7(:,1))
% figure(2);
% plot(t,y5(:,[1 2 3 4 5]+5)-y7(:,2))
% figure(3);
% plot(t,y5(:,[1 2 3 4 5]+5+5)-y7(:,3))
% % plot(t,y(:,1),'k',t,y(:,2),'b',t,y(:,3),'r:',t,y(:,4),'g--','linewidth',1.5);
% plot(t,y5(:,[1 2 3 4 5]))
% plot(t,y1(:,1),t,y2(:,[1 2 3 4 5 6]))
% legend('$x_0$','$\theta_1$','$\theta_2$','$\theta_3$','$\theta_4$','$\theta_5$','$\theta_6$','interpreter','latex','linewidth',1.5,'fontsize',15);
% xlabel('time(s)');ylabel('position states of leader and its estimation of position states');

% figure(2)
% plot(t,y1(:,2),t,y2(:,[7 8 9 10 11 12]),'linewidth',1.5)
% xlabel('time(s)');ylabel('velocity states of leader and its estimation of velocity states');
% legend('$v_0$','$\omega _1$','$\omega_2$','$\omega_3$','$\omega _4$','$\omega_5$','$\omega_6$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% figure(3);
% plot(t,y2(:,[1 2 3 4 5 6])-y1(:,1))%位置估计跟踪误差
% xlabel('time(s)');
% ylabel('the position estimation error $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\epsilon_{p1}$','$\epsilon_{p2}$','$\epsilon_{p3}$','$\epsilon_{p4}$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% 
%  
% figure(4);
% plot(t,y2(:,[7 8 9 10 11 12])-y1(:,2))%速度估计跟踪误差
% xlabel('time(s)');
% ylabel('the velocity estimation error $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\epsilon_{v1}$','$\epsilon_{v2}$','$\epsilon_{v3}$','$\epsilon_{v4}$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% 
% figure(5)
% plot(t,y4(:,[1 2 3 4]))%一阶智能体位置误差
% xlabel('time(s)');
% ylabel('the position estimation error of first order agents $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\xi_{p1}$','$\xi_{p2}$','$\xi_{p3}$','$\xi_{p4}$','interpreter','latex','linewidth',1.5,'fontsize',15);
% 
% 
% figure(6)%二阶智能体位置误差
% plot(t,y3(:,[1 2]))
% xlabel('time(s)');
% ylabel('the position estimation error of second order agents $\epsilon_k$','interpreter','latex','fontsize',15);
% legend('$\zeta_{p1}$','$\zeta_{p2}$','interpreter','latex','linewidth',1.5,'fontsize',15);


% figure(7)
% plot(t,y1(:,2),t,y(:,[5 6]))
% legend('v0','v5','v6');
% 
% figure(8)
% plot(t,ut1)
% 
% figure(9)
% plot(t,ut2)

% %改变了Laplacian函数里面的FAI矩阵，使得状态收敛至静态值，
% clc;
% clear;
% 
% % 初始化
% X0  = [-3, 2, 1, -1,4]';                               % 初始位置
% DX0 = [0.3, 0.1, 0.5, 0.2, 0.4]';                      % 初始速度
% Y1  = [X0; DX0];                                       % 积分初值
% n   = 5;
% n   = length(X0);
% A =[0 1 0 -1 1;
%     0 0 1 0 0;
%     1 0 0 0 0;
%     0 0 0 0 1;
%     0 0 0 1 0];                                     % 邻接矩阵，有向拓扑结构
% D =[1 0 0 0 0;
%     0 1 0 0 0;
%     0 0 1 0 0;
%     0 0 0 1 0;
%     0 0 0 0 1];                                     % 度矩阵，有向拓扑结构
% L = D - A;
% 
% gama  = 1.2547;
% k     = 0.5;
% % 构造矩阵FAI
% FAI   = [zeros(n,n), eye(n); 
%        -L, -k*eye(n)-gama*L]; 
% 
% 
% tBegin = 0;
% tEnd   = 10;
% h      = 0.1;
% times = (tEnd-tBegin) / h;
% Y(:,1) = Y1;
% t(1) = tBegin;
% 
% i = 1;
% % 从1到100循环了100次
% while(i <= times)
%     K1 = h * FAI * Y(1:10,i);
%     K2 = h * FAI * Y(1:10,i) + K1/2;
%     K3 = h * FAI * Y(1:10,i) + K2/2;
%     K4 = h * FAI * Y(1:10,i) + K3;
%     t(i+1) = t(i) + h;
%     Val = (K1+2*K2+2*K3+K4)/6;
%     Y(1:10,i+1) = Y(1:10,i) + Val;
%     i = i+1;
% end
% 
% % 显示
% subplot(2,1,1)
% plot(t,Y(1,:), t,Y(2,:), t,Y(3,:), t,Y(4,:), t,Y(5,:))%位置
% subplot(2,1,2)
% plot(t,Y(6,:), t,Y(7,:), t,Y(8,:), t,Y(9,:), t,Y(10,:))%速度







