function [sys,x0,str,ts] = ui(t,x,u,flag)
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
sizes.NumInputs      = 10;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
rho=0.1;
mu=2;
k1=2;k2=3;k3=5;
to_integral_1=u(1);
to_integral_2=u(2);
to_integral_3=u(3);
to_integral_4=u(4);
to_integral_5=u(5);

s1=u(1+5);
s2=u(2+5);
s3=u(3+5);
s4=u(4+5);
s5=u(5+5);
last_1=k1*(sig(s1,1+1/mu)+sig(s1,1)+sig(s1,1-1/mu))+k2*(sig(s1,1+1/mu)+sig(s1,1)+sig(s1,1-1/mu))+k3*(sig(s1,1+1/mu)+sig(s1,1)+sig(s1,1-1/mu));
last_2=k1*(sig(s2,1+1/mu)+sig(s2,1)+sig(s2,1-1/mu))+k2*(sig(s2,1+1/mu)+sig(s2,1)+sig(s2,1-1/mu))+k3*(sig(s2,1+1/mu)+sig(s2,1)+sig(s1,1-1/mu));
last_3=k1*(sig(s3,1+1/mu)+sig(s3,1)+sig(s3,1-1/mu))+k2*(sig(s3,1+1/mu)+sig(s3,1)+sig(s3,1-1/mu))+k3*(sig(s3,1+1/mu)+sig(s3,1)+sig(s3,1-1/mu));
last_4=k1*(sig(s4,1+1/mu)+sig(s4,1)+sig(s4,1-1/mu))+k2*(sig(s4,1+1/mu)+sig(s4,1)+sig(s4,1-1/mu))+k3*(sig(s4,1+1/mu)+sig(s4,1)+sig(s4,1-1/mu));
last_5=k1*(sig(s5,1+1/mu)+sig(s5,1)+sig(s5,1-1/mu))+k2*(sig(s5,1+1/mu)+sig(s5,1)+sig(s5,1-1/mu))+k3*(sig(s5,1+1/mu)+sig(s5,1)+sig(s5,1-1/mu));

u1=to_integral_1-rho*sign(s1)-last_1;
u2=to_integral_2-rho*sign(s2)-last_2;
u3=to_integral_3-rho*sign(s3)-last_3;
u4=to_integral_4-rho*sign(s4)-last_4;
u5=to_integral_5-rho*sign(s5)-last_5;

sys(1)=u1;
sys(2)=u2;
sys(3)=u3;
sys(4)=u4;
sys(5)=u5;




