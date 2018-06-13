img_src = imread('start.jpg')
L=img_src;
L=double(L);
Xrgb=0.2990*L(:,:,1)+0.5870*L(:,:,2)+0.1140*L(:,:,3);
NbColors=255;
X=wcodemat(Xrgb,NbColors);
map1=gray(NbColors);
subplot(221)
image(X);
colormap(map1);
title('原图像的灰度图');
axis square;
disp('灰度图像X的大小');
whos('X')
[c,s]=wavedec2(X,2,'bior3.7');
ca1=appcoef2(c,s,'bior3.7',1);
ch1=detcoef2('h',c,s,1);%水平方向
cv1=detcoef2('v',c,s,1);%垂直方向
cd1=detcoef2('d',c,s,1);%斜线方向  
a1=wrcoef2('a',c,s,'bior3.7',1);
h1=wrcoef2('h',c,s,'bior3.7',1);
v1=wrcoef2('v',c,s,'bior3.7',1);
d1=wrcoef2('d',c,s,'bior3.7',1);%各频率成分重构
c1=[a1,h1;v1,d1];
subplot(222)
image(c1);
colormap(gray);
axis square;
title('分解后低频和高频信息');
ca1=appcoef2(c,s,'bior3.7',1);
ca1=wcodemat(ca1,440,'mat',0);
ca1=0.5*ca1;
disp('第一次压缩后图像的大小为：');
subplot(223)
image(ca1);
colormap(gray);
%colormap(map);
axis square;
title('第一次压缩图像');
whos('ca1')
ca2=appcoef2(c,s,'bior3.7',2);
ca2=0.25*ca2;
subplot(224)
image(ca2);
colormap(gray);
%colormap(map);
axis square;
title('第二次压缩图像');
disp('第二次压缩后图像大小为：');
whos('ca2')
