X = imread('uestc.jpg') ;
X = rgb2gray(X);
X = imresize(X,[256 256]);
X = double(X);
subplot(2,2,1);image(X); 
colormap(map);
xlabel('(a) 原始图像');
axis square    
disp('压缩前图像X的大小');       % 显示文字
whos('X')                         % 显示图像属性
%对图像用小波进行层小波分解
[c,s]=wavedec2(X,2,'bior3.7');    %提取小波分解结构中的一层的低频系数和高频系数
cal=appcoef2(c,s,'bior3.7',1);   %水平方向
ch1=detcoef2('h',c,s,1);         %垂直方向
cv1=detcoef2('v',c,s,1);         %斜线方向
cd1=detcoef2('d',c,s,1);
%各频率成份重构
a1=wrcoef2('a',c,s,'bior3.7',1);
h1=wrcoef2('h',c,s,'bior3.7',1);
v1=wrcoef2('v',c,s,'bior3.7',1);
d1=wrcoef2('d',c,s,'bior3.7',1);
c1=[a1,h1;v1,d1];
%显示分频信息
subplot(2,2,2);image(c1); 
colormap(jet)                     % 设置色彩索引图
axis square;                      % 设置显示比例
xlabel ('(b) 分解后低频和高频信息');
ca1=appcoef2(c,s,'bior3.7',1);
ca1=wcodemat(ca1,440,'mat',0);
%改变图像高度并显示
ca1=0.5*ca1;
subplot(2,2,3);image(ca1); 
colormap(map);                    % 设置色彩索引图
axis square;                      % 设置显示比例
xlabel('(c) 第一次压缩图像');
disp('第一次压缩图像的大小为：'); % 显示文字
whos('ca1')                       % 显示图像属性
%保留小波分解第二层低频信息进行压缩
ca2=appcoef2(c,s,'bior3.7',2);
%首先对第二层信息进行量化编码
ca2=wcodemat(ca2,440,'mat',0);
%改变图像高度并显示
ca2=0.25*ca2;
subplot(2,2,4);image(ca2);  
colormap(map);                    % 设置色彩索引图
axis square;                      % 设置显示比例
xlabel('(d) 第二次压缩图像');  
disp('第二次压缩图像的大小为：'); % 显示文字
whos('ca2')                       % 显示图像属性