X = imread('1.jpg');
X = rgb2gray(X);
% X = imresize(X,[256 256]);
X = double(X);   
%对图像用小波进行层小波分解  
[C,S]=wavedec2(X,2,'bior3.7');  
Y=wcodemat(X);   %对图像的数值矩阵进行伪彩色编码
thr=20;      %设置阈值
[Xcompress1,cxd,lxd,perf0,perfl2]=wdencmp('gbl',C,S,'db4',2,thr,'h',1);
%对图像进行全局压缩
Y1=wcodemat(Xcompress1);    %对图像数据进行伪彩色编码
set(0,'defaultFigurePosition',[100,100,1000,500]);  
%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1 1 1])        %修改图形背景颜色的设置
figure                 %创建图形显示窗口
% colormap(gray(nbc));       %设置映射谱图等级
X = uint8(X);
Y = uint8(Y);
Y1 = uint8(Y1);
% Y = immultiply(Y, 15);
% Y1 = immultiply(Y1, 25);
subplot(221),imshow(X,[]),axis square      %显示
subplot(222),imshow(Y,[]),axis square      %显示
subplot(223);imshow(Y1,[]),axis square
imwrite(X,'com_1.jpg')
imwrite(Y,'com_2.jpg')
imwrite(Y1,'com_3.jpg')
MSE_caculate(X,Y);
MSE_caculate(X,Y1);
start_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\com_1.jpg');
start_size = start_info.FileSize;
s1_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\com_2.jpg');
s1_size = s1_info.FileSize;
end_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\com_3.jpg');
end_size = end_info.FileSize;


function mse = MSE_caculate(RGB,RGBI)
%% 求MSE，RGB为压缩前图片，RGB1为压缩后图片
D=RGB-RGBI;
mse = sum(D(:).*D(:))/prod(size(RGB));
end