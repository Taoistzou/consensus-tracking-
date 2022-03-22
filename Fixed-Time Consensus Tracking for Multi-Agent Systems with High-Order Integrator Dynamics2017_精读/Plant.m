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
x0  = [1,2,3,-1,-2   0 0 0 0 0    0 0 0 0 0 ];%5��������Ĺ۲���λ�ã��۲����ٶȣ��۲������ٶȵĳ�ʼֵ
% x0  = [10,20,30,-10,-20   0 0 0 0 0    0 0 0 0 0 ];%����������λ�� �ٶ� ���ٶ�

str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
delta1=0.1*sin(x(1));%������1�ĸ���
delta2=0.1*sin(x(2));%������2�ĸ���
delta3=0.1*sin(x(3));%������3�ĸ���
delta4=0.1*sin(x(4));%������4�ĸ���
delta5=0.1*sin(x(5));%������5�ĸ���

% delta1=0;%������1�ĸ���
% delta2=0;%������2�ĸ���
% delta3=0;%������3�ĸ���
% delta4=0;%������4�ĸ���
% delta5=0;%������5�ĸ���

sys(1)=x(1+5);%������1λ����Ϊ��Ӧ���ٶ�
sys(2)=x(2+5);%������2λ����Ϊ��Ӧ���ٶ�
sys(3)=x(3+5);%������3λ����Ϊ��Ӧ���ٶ�
sys(4)=x(4+5);%������4λ����Ϊ��Ӧ���ٶ�
sys(5)=x(5+5);%������5λ����Ϊ��Ӧ���ٶ�

sys(6)=x(6+5);%������1�ٶ���Ϊ��Ӧ�ļ��ٶ�
sys(7)=x(7+5);%������2�ٶ���Ϊ��Ӧ�ļ��ٶ�
sys(8)=x(8+5);%������3�ٶ���Ϊ��Ӧ�ļ��ٶ�
sys(9)=x(9+5);%������4�ٶ���Ϊ��Ӧ�ļ��ٶ�
sys(10)=x(10+5);%������5�ٶ���Ϊ��Ӧ�ļ��ٶ�

sys(11)=u(1)+delta1;%������1���ٶ���Ϊ��Ӧ�Ŀ��ƺ͸��ŵĺ�
sys(12)=u(2)+delta2;%������2���ٶ���Ϊ��Ӧ�Ŀ��ƺ͸��ŵĺ�
sys(13)=u(3)+delta3;%������3���ٶ���Ϊ��Ӧ�Ŀ��ƺ͸��ŵĺ�
sys(14)=u(4)+delta4;%������4���ٶ���Ϊ��Ӧ�Ŀ��ƺ͸��ŵĺ�
sys(15)=u(5)+delta5;%������5���ٶ���Ϊ��Ӧ�Ŀ��ƺ͸��ŵĺ�



function sys=mdlOutputs(t,x,u)
sys(1)=x(1);%������1��λ�����
sys(2)=x(2);%������2��λ�����
sys(3)=x(3);%������3��λ�����
sys(4)=x(4);%������4��λ�����
sys(5)=x(5);%������5��λ�����

sys(6)=x(6);%������1���ٶ����
sys(7)=x(7);%������2���ٶ����
sys(8)=x(8);%������3���ٶ����
sys(9)=x(9);%������4���ٶ����
sys(10)=x(10);%������5���ٶ����

sys(11)=x(11);%������1�ļ��ٶ����
sys(12)=x(12);%������2�ļ��ٶ����
sys(13)=x(13);%������3�ļ��ٶ����
sys(14)=x(14);%������4�ļ��ٶ����
sys(15)=x(15);%������5�ļ��ٶ����



