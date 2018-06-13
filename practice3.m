clear all;close all;
I = imread('1.jpg');
[m,n,~]=size(I);
 
%采样数据总数
amount = fix(m*n*0.001);
sampledata = zeros(amount,3);
%随机生成采样点的坐标
for j=1:amount
    x = randi(m,1,1);    
    y = randi(n,1,1);        
    %取得的数据
    sampledata(j,:) = I(x,y,:);
    %在图上标注为白色
    I(x,y,:)=[255 255 255];
end
%显示采样点
imshow(I);