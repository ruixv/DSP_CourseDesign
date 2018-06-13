I1 = imread('') 
a=I1;
imwrite(mat2gray(I1),'0.jpg');
start_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\0.jpg');
start_size = start_info.FileSize;
[m n]=size(a);
a=double(a);
r=rank(a);
[s v d]=svd(a);
im = 0;
axes(handles.axes2)
hold off
plot(1,1)
x =[];
y =[];
%re=s*v*d';
while(im<150)
    set(handles.listbox2,'value',1);
    result = [];
    re=s(:,:)*v(:,1:im)*d(:,1:im)';
    axes(handles.axes5);
    imshow(mat2gray(re));
    imwrite(mat2gray(re),'1.jpg');
    current_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\1.jpg');
    current_size = current_info.FileSize;
%     xlabel(num2str(size)) ;
    compressRatio = current_size /start_size
    MSE = MSE_caculate(a,re)
    y = [y MSE];
    x = [x compressRatio];
    result = [result MSE compressRatio];
    set(handles.listbox2,'string',result);
    axes(handles.axes2);
    plot(x,y)
    xlabel('Ñ¹ËõÂÊ')
    ylabel('MSE')
%     result = [start_size last_size compressRatio MSE];
%     compressRatioS = [compressRatioS compressRatio];
%     MSES = [MSES MSE];
    im = im+1;
    pause(0.01)
end