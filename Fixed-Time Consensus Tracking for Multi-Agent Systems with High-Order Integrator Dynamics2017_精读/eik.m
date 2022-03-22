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
%����������λ�á��ٶȡ����ٶȸ������
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




e11=x11-x011hat;%������1λ�ø������
e21=x21-x021hat;%������2λ�ø������
e31=x31-x031hat;%������3λ�ø������
e41=x41-x041hat;%������4λ�ø������
e51=x51-x051hat;%������5λ�ø������

e12=x12-x012hat;%������1�ٶȸ������
e22=x22-x022hat;%������2�ٶȸ������
e32=x32-x032hat;%������3�ٶȸ������
e42=x42-x042hat;%������4�ٶȸ������
e52=x52-x052hat;%������5�ٶȸ������

e13=x13-x013hat;%������1���ٶȸ������
e23=x23-x023hat;%������2���ٶȸ������
e33=x33-x033hat;%������3���ٶȸ������
e43=x43-x043hat;%������4���ٶȸ������
e53=x53-x053hat;%������5���ٶȸ������



%������λ�á��ٶȡ����ٶȸ���������
sys(1)=e11;%������1λ�ø���������
sys(2)=e21;%������2λ�ø���������
sys(3)=e31;%������3λ�ø���������
sys(4)=e41;%������4λ�ø���������
sys(5)=e51;%������5λ�ø���������

sys(6)=e12;%������1�ٶȸ���������
sys(7)=e22;%������2�ٶȸ���������
sys(8)=e32;%������3�ٶȸ���������
sys(9)=e42;%������4�ٶȸ���������
sys(10)=e52;%������5�ٶȸ���������

sys(11)=e13;%������1���ٶȸ���������
sys(12)=e23;%������2���ٶȸ���������
sys(13)=e33;%������3���ٶȸ���������
sys(14)=e43;%������4���ٶȸ���������
sys(15)=e53;%������5���ٶȸ���������






