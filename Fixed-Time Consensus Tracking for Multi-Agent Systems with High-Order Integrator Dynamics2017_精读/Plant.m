function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 15;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 15;
sizes.NumInputs      = 5;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [1,2,3,-1,-2   0 0 0 0 0    0 0 0 0 0 ];%5个智能体的观测器位置，观测器速度，观测器加速度的初始值
% x0  = [10,20,30,-10,-20   0 0 0 0 0    0 0 0 0 0 ];%五个智能体的位置 速度 加速度

str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
delta1=0.1*sin(x(1));%智能体1的干扰
delta2=0.1*sin(x(2));%智能体2的干扰
delta3=0.1*sin(x(3));%智能体3的干扰
delta4=0.1*sin(x(4));%智能体4的干扰
delta5=0.1*sin(x(5));%智能体5的干扰

% delta1=0;%智能体1的干扰
% delta2=0;%智能体2的干扰
% delta3=0;%智能体3的干扰
% delta4=0;%智能体4的干扰
% delta5=0;%智能体5的干扰

sys(1)=x(1+5);%智能体1位置求导为对应的速度
sys(2)=x(2+5);%智能体2位置求导为对应的速度
sys(3)=x(3+5);%智能体3位置求导为对应的速度
sys(4)=x(4+5);%智能体4位置求导为对应的速度
sys(5)=x(5+5);%智能体5位置求导为对应的速度

sys(6)=x(6+5);%智能体1速度求导为对应的加速度
sys(7)=x(7+5);%智能体2速度求导为对应的加速度
sys(8)=x(8+5);%智能体3速度求导为对应的加速度
sys(9)=x(9+5);%智能体4速度求导为对应的加速度
sys(10)=x(10+5);%智能体5速度求导为对应的加速度

sys(11)=u(1)+delta1;%智能体1加速度求导为对应的控制和干扰的和
sys(12)=u(2)+delta2;%智能体2加速度求导为对应的控制和干扰的和
sys(13)=u(3)+delta3;%智能体3加速度求导为对应的控制和干扰的和
sys(14)=u(4)+delta4;%智能体4加速度求导为对应的控制和干扰的和
sys(15)=u(5)+delta5;%智能体5加速度求导为对应的控制和干扰的和



function sys=mdlOutputs(t,x,u)
sys(1)=x(1);%智能体1的位置输出
sys(2)=x(2);%智能体2的位置输出
sys(3)=x(3);%智能体3的位置输出
sys(4)=x(4);%智能体4的位置输出
sys(5)=x(5);%智能体5的位置输出

sys(6)=x(6);%智能体1的速度输出
sys(7)=x(7);%智能体2的速度输出
sys(8)=x(8);%智能体3的速度输出
sys(9)=x(9);%智能体4的速度输出
sys(10)=x(10);%智能体5的速度输出

sys(11)=x(11);%智能体1的加速度输出
sys(12)=x(12);%智能体2的加速度输出
sys(13)=x(13);%智能体3的加速度输出
sys(14)=x(14);%智能体4的加速度输出
sys(15)=x(15);%智能体5的加速度输出



