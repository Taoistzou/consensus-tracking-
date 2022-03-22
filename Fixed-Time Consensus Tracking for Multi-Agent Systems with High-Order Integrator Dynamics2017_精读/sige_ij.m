function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
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
sizes.NumInputs      = 15;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
k1=2;k2=3;k3=5;
p=0.85;
rho1=p/(3-2*p);
rho2=p/(2-p);
rho3=p/1;

drho1=(2-p)/(2*p-1);
drho2=(2-p)/(p);
drho3=(2-p)/(1);



e11=u(1);e21=u(2);e31=u(3);e41=u(4);e51=u(5);
e12=u(1+5);e22=u(2+5);e32=u(3+5);e42=u(4+5);e52=u(5+5);
e13=u(1+5+5);e23=u(2+5+5);e33=u(3+5+5);e43=u(4+5+5);e53=u(5+5+5);

to_integral_1=k1*(sig(e11,rho1)+sig(e11,1)+sig(e11,drho1))+k2*(sig(e12,rho2)+sig(e12,1)+sig(e12,drho2))+k3*(sig(e13,rho3)+sig(e13,1)+sig(e13,drho3));
to_integral_2=k1*(sig(e21,rho1)+sig(e21,1)+sig(e21,drho1))+k2*(sig(e22,rho2)+sig(e22,1)+sig(e22,drho2))+k3*(sig(e23,rho3)+sig(e23,1)+sig(e23,drho3));
to_integral_3=k1*(sig(e31,rho1)+sig(e31,1)+sig(e31,drho1))+k2*(sig(e32,rho2)+sig(e32,1)+sig(e32,drho2))+k3*(sig(e33,rho3)+sig(e33,1)+sig(e33,drho3));
to_integral_4=k1*(sig(e41,rho1)+sig(e41,1)+sig(e41,drho1))+k2*(sig(e42,rho2)+sig(e42,1)+sig(e42,drho2))+k3*(sig(e43,rho3)+sig(e43,1)+sig(e43,drho3));
to_integral_5=k1*(sig(e51,rho1)+sig(e51,1)+sig(e51,drho1))+k2*(sig(e52,rho2)+sig(e52,1)+sig(e52,drho2))+k3*(sig(e53,rho3)+sig(e53,1)+sig(e53,drho3));

sys(1)=to_integral_1;
sys(2)=to_integral_2;
sys(3)=to_integral_3;
sys(4)=to_integral_4;
sys(5)=to_integral_5;








