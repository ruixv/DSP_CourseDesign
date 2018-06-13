function X=getsignal(message)
s=abs(message);
data0=dec2bin(s);
data1=num2str(data0);
X=data1-48;
X=X';
X=(X(:))';