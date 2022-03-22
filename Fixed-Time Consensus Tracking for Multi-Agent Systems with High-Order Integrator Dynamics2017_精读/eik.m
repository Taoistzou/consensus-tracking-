function [sys,x0,str,ts] = eik(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {1,2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 15;
sizes.NumInputs      = 30;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
%计算智能体位置、速度、加速度跟踪误差
x11=u(1);
x21=u(2);
x31=u(3);
x41=u(4);
x51=u(5);

x12=u(1+5);
x22=u(2+5);
x32=u(3+5);
x42=u(4+5);
x52=u(5+5);

x13=u(1+5+5);
x23=u(2+5+5);
x33=u(3+5+5);
x43=u(4+5+5);
x53=u(5+5+5);


x011hat=u(1+15);
x021hat=u(2+15);
x031hat=u(3+15);
x041hat=u(4+15);
x051hat=u(5+15);

x012hat=u(1+5+15);
x022hat=u(2+5+15);
x032hat=u(3+5+15);
x042hat=u(4+5+15);
x052hat=u(5+5+15);

x013hat=u(1+5+5+15);
x023hat=u(2+5+5+15);
x033hat=u(3+5+5+15);
x043hat=u(4+5+5+15);
x053hat=u(5+5+5+15);




e11=x11-x011hat;%智能体1位置跟踪误差
e21=x21-x021hat;%智能体2位置跟踪误差
e31=x31-x031hat;%智能体3位置跟踪误差
e41=x41-x041hat;%智能体4位置跟踪误差
e51=x51-x051hat;%智能体5位置跟踪误差

e12=x12-x012hat;%智能体1速度跟踪误差
e22=x22-x022hat;%智能体2速度跟踪误差
e32=x32-x032hat;%智能体3速度跟踪误差
e42=x42-x042hat;%智能体4速度跟踪误差
e52=x52-x052hat;%智能体5速度跟踪误差

e13=x13-x013hat;%智能体1加速度跟踪误差
e23=x23-x023hat;%智能体2加速度跟踪误差
e33=x33-x033hat;%智能体3加速度跟踪误差
e43=x43-x043hat;%智能体4加速度跟踪误差
e53=x53-x053hat;%智能体5加速度跟踪误差



%智能体位置、速度、加速度跟踪误差输出
sys(1)=e11;%智能体1位置跟踪误差输出
sys(2)=e21;%智能体2位置跟踪误差输出
sys(3)=e31;%智能体3位置跟踪误差输出
sys(4)=e41;%智能体4位置跟踪误差输出
sys(5)=e51;%智能体5位置跟踪误差输出

sys(6)=e12;%智能体1速度跟踪误差输出
sys(7)=e22;%智能体2速度跟踪误差输出
sys(8)=e32;%智能体3速度跟踪误差输出
sys(9)=e42;%智能体4速度跟踪误差输出
sys(10)=e52;%智能体5速度跟踪误差输出

sys(11)=e13;%智能体1加速度跟踪误差输出
sys(12)=e23;%智能体2加速度跟踪误差输出
sys(13)=e33;%智能体3加速度跟踪误差输出
sys(14)=e43;%智能体4加速度跟踪误差输出
sys(15)=e53;%智能体5加速度跟踪误差输出






