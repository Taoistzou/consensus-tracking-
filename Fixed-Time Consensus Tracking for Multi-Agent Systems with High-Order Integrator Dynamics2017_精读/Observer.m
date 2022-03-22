function [sys,x0,str,ts]=Observer(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);% 和sizes.DirFeedthrough ;互斥的关系 有sys=mdlDerivatives(t,x,u);那么sizes.DirFeedthrough=0 
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 15;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 15;
sizes.NumInputs      = 15+3;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;%和sys=mdlDerivatives(t,x,u);一致的关系，如果有sys=mdlDerivatives(t,x,u)那么sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0  = [1,2,3,-1,-2   0 0 0 0 0    0 0 0 0 0 ];%5个智能体的观测器位置，观测器速度，观测器加速度的初始值
% x0  = [10,20,30,-10,-20   0 0 0 0 0    0 0 0 0 0 ];%5个智能体的观测器位置，观测器速度，观测器加速度的初始值
str=[];
ts=[0 0];
function sys=mdlDerivatives(t,x,u)
% aij=[0 1 1 1 0;
%      1 0 1 0 0;
%      1 1 0 0 0;
%      1 0 0 0 1;
%      0 0 0 1 0];

aij=[0 0 1 0 0;
     1 0 0 0 0;
     0 1 0 0 0;
     1 0 0 0 0;
     0 0 0 1 0];
x0=u(1+15);
v0=u(2+15);
u0=u(3+15);
alpha1=0.8;alpha2=0.8;alpha3=1;
beta1=1.2;beta2=1.2;beta3=1.2;
b1=1;b2=0;b3=0;b4=0;b5=1;
%观测器位置微分关系
sys(1)=u(1+5)+alpha1*sign(aij(1,1)*(u(1)-u(1))+aij(1,2)*(u(2)-u(1))+aij(1,3)*(u(3)-u(1))+aij(1,4)*(u(4)-u(1))+b1*(x0-u(1)))+...
                beta1*sig(aij(1,1)*(u(1)-u(1))+aij(1,2)*(u(2)-u(1))+aij(1,3)*(u(3)-u(1))+aij(1,4)*(u(4)-u(1))+b1*(x0-u(1)),2);
sys(2)=u(2+5)+alpha1*sign(aij(2,1)*(u(1)-u(2))+aij(2,2)*(u(2)-u(2))+aij(2,3)*(u(3)-u(2))+aij(2,4)*(u(4)-u(2))+b2*(x0-u(2)))+...
                beta1*sig(aij(2,1)*(u(1)-u(2))+aij(2,2)*(u(2)-u(2))+aij(2,3)*(u(3)-u(2))+aij(2,4)*(u(4)-u(2))+b2*(x0-u(2)),2);
sys(3)=u(3+5)+alpha1*sign(aij(3,1)*(u(1)-u(3))+aij(3,2)*(u(2)-u(3))+aij(3,3)*(u(3)-u(3))+aij(3,4)*(u(4)-u(3))+b3*(x0-u(3)))+...
                beta1*sig(aij(3,1)*(u(1)-u(3))+aij(3,2)*(u(2)-u(3))+aij(3,3)*(u(3)-u(3))+aij(3,4)*(u(4)-u(3))+b3*(x0-u(3)),2);
sys(4)=u(4+5)+alpha1*sign(aij(4,1)*(u(1)-u(4))+aij(4,2)*(u(2)-u(4))+aij(4,3)*(u(3)-u(4))+aij(4,4)*(u(4)-u(4))+b4*(x0-u(4)))+...
                beta1*sig(aij(4,1)*(u(1)-u(4))+aij(4,2)*(u(2)-u(4))+aij(4,3)*(u(3)-u(4))+aij(4,4)*(u(4)-u(4))+b4*(x0-u(4)),2);
sys(5)=u(5+5)+alpha1*sign(aij(5,1)*(u(1)-u(5))+aij(5,2)*(u(2)-u(5))+aij(5,3)*(u(3)-u(5))+aij(5,4)*(u(4)-u(5))+b5*(x0-u(5)))+...
                beta1*sig(aij(5,1)*(u(1)-u(5))+aij(5,2)*(u(2)-u(5))+aij(5,3)*(u(3)-u(5))+aij(5,4)*(u(4)-u(5))+b5*(x0-u(5)),2);
 %观测器速度微分关系          
sys(1+5)=u(1+5+5)+alpha2*sign(aij(1,1)*(u(1+5)-u(1+5))+aij(1,2)*(u(2+5)-u(1+5))+aij(1,3)*(u(3+5)-u(1+5))+aij(1,4)*(u(4+5)-u(1+5))+b1*(v0-u(1+5)))+...
                beta2*sig(aij(1,1)*(u(1+5)-u(1+5))+aij(1,2)*(u(2+5)-u(1+5))+aij(1,3)*(u(3+5)-u(1+5))+aij(1,4)*(u(4+5)-u(1+5))+b1*(v0-u(1+5)),2);
sys(2+5)=u(2+5+5)+alpha2*sign(aij(2,1)*(u(1+5)-u(2+5))+aij(2,2)*(u(2+5)-u(2+5))+aij(2,3)*(u(3+5)-u(2+5))+aij(2,4)*(u(4+5)-u(2+5))+b2*(v0-u(2+5)))+...
                beta2*sig(aij(2,1)*(u(1+5)-u(2+5))+aij(2,2)*(u(2+5)-u(2+5))+aij(2,3)*(u(3+5)-u(2+5))+aij(2,4)*(u(4+5)-u(2+5))+b2*(v0-u(2+5)),2);
sys(3+5)=u(3+5+5)+alpha2*sign(aij(3,1)*(u(1+5)-u(3+5))+aij(3,2)*(u(2+5)-u(3+5))+aij(3,3)*(u(3+5)-u(3+5))+aij(3,4)*(u(4+5)-u(3+5))+b3*(v0-u(3+5)))+...
                beta2*sig(aij(3,1)*(u(1+5)-u(3+5))+aij(3,2)*(u(2+5)-u(3+5))+aij(3,3)*(u(3+5)-u(3+5))+aij(3,4)*(u(4+5)-u(3+5))+b3*(v0-u(3+5)),2);
sys(4+5)=u(4+5+5)+alpha2*sign(aij(4,1)*(u(1+5)-u(4+5))+aij(4,2)*(u(2+5)-u(4+5))+aij(4,3)*(u(3+5)-u(4+5))+aij(4,4)*(u(4+5)-u(4+5))+b4*(v0-u(4+5)))+...
                beta2*sig(aij(4,1)*(u(1+5)-u(4+5))+aij(4,2)*(u(2+5)-u(4+5))+aij(4,3)*(u(3+5)-u(4+5))+aij(4,4)*(u(4+5)-u(4+5))+b4*(v0-u(4+5)),2);
sys(5+5)=u(5+5+5)+alpha2*sign(aij(5,1)*(u(1+5)-u(5+5))+aij(5,2)*(u(2+5)-u(5+5))+aij(5,3)*(u(3+5)-u(5+5))+aij(5,4)*(u(4+5)-u(5+5))+b5*(v0-u(5+5)))+...
                beta2*sig(aij(5,1)*(u(1+5)-u(5+5))+aij(5,2)*(u(2+5)-u(5+5))+aij(5,3)*(u(3+5)-u(5+5))+aij(5,4)*(u(4+5)-u(5+5))+b5*(v0-u(5+5)),2);
%观测器加速度微分关系
sys(1+5+5)=alpha3*sign(aij(1,1)*(u(1+5+5)-u(1+5+5))+aij(1,2)*(u(2+5+5)-u(1+5+5))+aij(1,3)*(u(3+5+5)-u(1+5+5))+aij(1,4)*(u(4+5+5)-u(1+5+5))+b1*(u0-u(1+5+5)))+...
                beta3*sig(aij(1,1)*(u(1+5+5)-u(1+5+5))+aij(1,2)*(u(2+5+5)-u(1+5+5))+aij(1,3)*(u(3+5+5)-u(1+5+5))+aij(1,4)*(u(4+5+5)-u(1+5+5))+b1*(u0-u(1+5+5)),2);
sys(2+5+5)=alpha3*sign(aij(2,1)*(u(1+5+5)-u(2+5+5))+aij(2,2)*(u(2+5+5)-u(2+5+5))+aij(2,3)*(u(3+5+5)-u(2+5+5))+aij(2,4)*(u(4+5+5)-u(2+5+5))+b2*(u0-u(2+5+5)))+...
                beta3*sig(aij(2,1)*(u(1+5+5)-u(2+5+5))+aij(2,2)*(u(2+5+5)-u(2+5+5))+aij(2,3)*(u(3+5+5)-u(2+5+5))+aij(2,4)*(u(4+5+5)-u(2+5+5))+b2*(u0-u(2+5+5)),2);
sys(3+5+5)=alpha3*sign(aij(3,1)*(u(1+5+5)-u(3+5+5))+aij(3,2)*(u(2+5+5)-u(3+5+5))+aij(3,3)*(u(3+5+5)-u(3+5+5))+aij(3,4)*(u(4+5+5)-u(3+5+5))+b3*(u0-u(3+5+5)))+...
                beta3*sig(aij(3,1)*(u(1+5+5)-u(3+5+5))+aij(3,2)*(u(2+5+5)-u(3+5+5))+aij(3,3)*(u(3+5+5)-u(3+5+5))+aij(3,4)*(u(4+5+5)-u(3+5+5))+b3*(u0-u(3+5+5)),2);
sys(4+5+5)=alpha3*sign(aij(4,1)*(u(1+5+5)-u(4+5+5))+aij(4,2)*(u(2+5+5)-u(4+5+5))+aij(4,3)*(u(3+5+5)-u(4+5+5))+aij(4,4)*(u(4+5+5)-u(4+5+5))+b4*(u0-u(4+5+5)))+...
                beta3*sig(aij(4,1)*(u(1+5+5)-u(4+5+5))+aij(4,2)*(u(2+5+5)-u(4+5+5))+aij(4,3)*(u(3+5+5)-u(4+5+5))+aij(4,4)*(u(4+5+5)-u(4+5+5))+b4*(u0-u(4+5+5)),2);
sys(5+5+5)=alpha3*sign(aij(5,1)*(u(1+5+5)-u(5+5+5))+aij(5,2)*(u(2+5+5)-u(5+5+5))+aij(5,3)*(u(3+5+5)-u(5+5+5))+aij(5,4)*(u(4+5+5)-u(5+5+5))+b5*(u0-u(5+5+5)))+...
                beta3*sig(aij(5,1)*(u(1+5+5)-u(5+5+5))+aij(5,2)*(u(2+5+5)-u(5+5+5))+aij(5,3)*(u(3+5+5)-u(5+5+5))+aij(5,4)*(u(4+5+5)-u(5+5+5))+b5*(u0-u(5+5+5)),2);   


function sys=mdlOutputs(t,x,u)

sys(1)=x(1);%输出智能体1观测器观测的位置
sys(2)=x(2);%输出智能体2观测器观测的位置
sys(3)=x(3);%输出智能体3观测器观测的位置
sys(4)=x(4);%输出智能体4观测器观测的位置
sys(5)=x(5);%输出智能体5观测器观测的位置



sys(1+5)=x(1+5);%输出智能体1观测器观测的速度
sys(2+5)=x(2+5);%输出智能体2观测器观测的速度
sys(3+5)=x(3+5);%输出智能体3观测器观测的速度
sys(4+5)=x(4+5);%输出智能体4观测器观测的速度
sys(5+5)=x(5+5);%输出智能体5观测器观测的速度

sys(1+10)=x(1+10);%输出智能体1观测器观测的加速度
sys(2+10)=x(2+10);%输出智能体1观测器观测的加速度
sys(3+10)=x(3+10);%输出智能体1观测器观测的加速度
sys(4+10)=x(4+10);%输出智能体1观测器观测的加速度
sys(5+10)=x(5+10);%输出智能体1观测器观测的加速度







