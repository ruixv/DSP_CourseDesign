clear all
%产生信息
% load mtlb
% mtlb = [1.000000000000000 2.133333333333 3 4 5 6 7 8 9 0 10];
% mtlb = floor(1000*mtlbo0)
message='when i was a boy,my mother told me "you will finish a great thing!" ';
% message = '[1 2 3 4  5 6 7 8  9 0 10]';
% message = mat2str(mtlb);
%生成信号，信号是2进制的bit串
%训练序列
trainingdata=randi(1,100);
%信息序列
info=getsignal(message);
%将训练序列转换成2pam双极性的信号
xn=dan2shuang(trainingdata);
%产生模拟信道
K=5;
%信道参数
delta=0.1;
actual=[0.05 -0.063 0.088 -0.126 -0.25 0.9047 0.25 0 0.126 0.038 0.088];
%训练过程
y=filter(actual,1,xn);
y=awgn(y,20);
%判决
N=length(y);
%均衡过程
estimated_c=[0 0 0 0 0 1 0 0 0 0 0];
for k=1:N-2*K
    y_k=y(k:k+2*K);
    z_k=estimated_c*y_k';
    e_k=xn(k)-z_k;
    estimated_c=estimated_c+delta*e_k*y_k
    mes(k)=e_k^2;
    z(k)=z_k;
end
%%
%直接判决过程
xn=dan2shuang(info);
y=filter(actual,1,xn);
y=awgn(y,20);
%判决
yn=decison(y);%没有经过均衡器的
y=[y zeros(1,2*K)];%为了均衡而补长
N=length(y);
%均衡过程
for k=1:N-2*K
    y_k=y(k:k+2*K);  
    z_k=estimated_c*y_k';
    sel=decison(z_k);
    sel2=dan2shuang(sel);
    e_k=sel2-z_k;
    estimated_c=estimated_c+delta*e_k*y_k;
    temp(k)=sel;
    mes(k)=e_k^2;
    
end
%判决
figure
subplot(1,2,1);
stem(info,'red');title('原码和未经均衡器的输出码的对比图');
hold on;
stem(yn,'blue');
subplot(1,2,2)
stem(info,'red');title('源码和经过均衡器的输出码的对比图');
hold on;
stem(temp,'blue');
%译码：
temp=temp(1:end-7);
recieve=decode(temp);

disp(['译码后得到的信息：',recieve]);
mesav=mean(mes);
disp(['均方误差平均值：',num2str(mesav)]);

radio = strcat(recieve,']')
leng=length(radio)
s=ones(1,floor(leng/2-1));
for i=2:floor(leng/2-1)
   s(i-1)=str2double(radio(2*i-2));
end
% for i=1:floor((leng)/2)
%     2*i
%    str2num(radio(2*i))
% end

% radio = char(radio)
% radio = str2double(radio)
% sound(s,Fs)
