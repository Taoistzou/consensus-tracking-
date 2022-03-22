function [sys,x0,str,ts] = si(t,x,u,flag)
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
sizes.NumOutputs     = 5;
sizes.NumInputs      = 20;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
e13=u(11);%智能体1的加速度误差
e23=u(12);%智能体2的加速度误差
e33=u(13);%智能体3的加速度误差
e43=u(14);%智能体4的加速度误差
e53=u(15);%智能体5的加速度误差

s1=e13+u(1+15);%智能体1的滑膜面
s2=e23+u(2+15);%智能体2的滑膜面
s3=e33+u(3+15);%智能体3的滑膜面
s4=e43+u(4+15);%智能体4的滑膜面
s5=e53+u(5+15);%智能体5的滑膜面


sys(1)=s1;
sys(2)=s2;
sys(3)=s3;
sys(4)=s4;
sys(5)=s5;












