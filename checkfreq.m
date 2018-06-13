% n=0:10e6;%信号的长度
n = 0:30000
fs=3000;%采样频率
freq = 550.1257
x=cos(2*pi*(freq/fs)*n);%构造频率为550hz的信号
%plot(n,x);
%hold on
y=awgn(x,10);%信号中加入噪声，信噪比为10db
%plot(n,y);
N=length(n);
xk=fft(x,N);%求dft
re=real(xk);%取实部
[p1,kmr]=max(re)%找到最大谱线
d1=-re(kmr+1)/(re(kmr)-re(kmr+1));%插值矫正第一步，计算插值
d2=re(kmr-1)/(re(kmr)-re(kmr-1));
if d1>0&&d2>0
        d=d1;
      else
        d=d2;
end
f0=(kmr+d)*fs/N;%进行矫正
f0 = f0 - fs/(length(n)-1);
df=f0-freq;%误差
disp(['标准频率为：',num2str(freq),'hz','测出来频率为：',num2str(f0),'hz',',误差为:',num2str(df),'hz']);
