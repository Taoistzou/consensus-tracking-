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
e13=u(11);%������1�ļ��ٶ����
e23=u(12);%������2�ļ��ٶ����
e33=u(13);%������3�ļ��ٶ����
e43=u(14);%������4�ļ��ٶ����
e53=u(15);%������5�ļ��ٶ����

s1=e13+u(1+15);%������1�Ļ�Ĥ��
s2=e23+u(2+15);%������2�Ļ�Ĥ��
s3=e33+u(3+15);%������3�Ļ�Ĥ��
s4=e43+u(4+15);%������4�Ļ�Ĥ��
s5=e53+u(5+15);%������5�Ļ�Ĥ��


sys(1)=s1;
sys(2)=s2;
sys(3)=s3;
sys(4)=s4;
sys(5)=s5;












