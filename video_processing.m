function varargout = video_processing(varargin)
% VIDEO_PROCESSING MATLAB code for video_processing.fig
%      VIDEO_PROCESSING, by itself, creates a new VIDEO_PROCESSING or raises the existing
%      singleton*.
%
%      H = VIDEO_PROCESSING returns the handle to a new VIDEO_PROCESSING or the handle to
%      the existing singleton*.
%
%      VIDEO_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEO_PROCESSING.M with the given input arguments.
%
%      VIDEO_PROCESSING('Property','Value',...) creates a new VIDEO_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before video_processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to video_processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help video_processing

% Last Modified by GUIDE v2.5 09-Jul-2017 13:33:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @video_processing_OpeningFcn, ...
                   'gui_OutputFcn',  @video_processing_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before video_processing is made visible.
function video_processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to video_processing (see VARARGIN)
global pause_self vid
global MSES
global compressRatioS
compressRatioS = [];
MSES = [];
pause_self = 1;
vid = -1;
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('uestc2.jpg');
image(II)
colormap gray
axes(handles.axes8)
imshow('uestc.jpg');
axes(handles.axes9)
imshow('tongxin.jpg');
% set(ha,'handlevisibility','off','visible','off');
% Choose default command line output for video_processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes video_processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = video_processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
vid = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
vidRes = get(vid,'VideoResolution');
nBands = get(vid,'NumberOfBands');
hImage = image(zeros(vidRes(2),vidRes(1),nBands),'parent',handles.axes1);
preview(vid,hImage);
start(vid)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
if vid ~= -1
    delete(vid);
end;
axes(handles.axes2)
hold off
plot(1,1)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
global mypic
mypic = getsnapshot(vid);       %截取的彩色图像
axes(handles.axes1);
imshow(mypic);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic
global I1
if numel(size(mypic))==2
    I1 = mypic;
    1
else
    I1 = rgb2gray(mypic);           %灰色图像
end
axes(handles.axes2);
imshow(I1);
axes(handles.axes3);
imhist(I1)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
I2 = histeq(I1);
axes(handles.axes5);
imshow(I2);
axes(handles.axes4);
imhist(I2)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic
[FileName,PathName] = uigetfile({'*.jpg;*.png;*.pgm;*.tif;*.bmp'},'Select figure File');
path = strcat(PathName,FileName);
mypic = imread(path);
axes(handles.axes1);
imshow(mypic);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function get_function(~, eventdata, handles)
global select_function
select_function = get(handles.popumenu1, 'value');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 对灰度图像的操作
global select_function
global I1
global I2
select_function = get(handles.popupmenu1, 'value');
disp(select_function)

%% 均衡
if select_function == 2
        I2 = histeq(I1);
    axes(handles.axes5);
    imshow(I2);
    axes(handles.axes4);
    imhist(I2)
end

%% 'prewitt'边缘检测
if select_function == 3
    i = 0.45
    set(handles.pushbutton7,'UserData',1); 
    while(i>0 & get(handles.pushbutton7,'UserData') ==1)
            I2=edge(I1,'prewitt',i);  
            %以自动阈值选择法地图像进行Roberts算子检测
            %     [I2,thresh1]=edge(I1,'roberts'); 
            %返回当前Roberts算子边缘检测的阈值
            axes(handles.axes5);
            imshow(I2);
            title(['K:',num2str(i)]);
            axes(handles.axes4);
            imhist(I2)
            i = i - 0.003
            pause(0.01)
            drawnow
        end
        guidata(hObject, handles);
end

%% 动态边缘检测
if select_function == 4
    i = 0.45
    set(handles.pushbutton7,'UserData',1); 
    while(i>0 & get(handles.pushbutton7,'UserData') ==1)
            I2=edge(I1,'canny',i);  
            %以自动阈值选择法地图像进行Roberts算子检测
            %     [I2,thresh1]=edge(I1,'roberts'); 
            %返回当前Roberts算子边缘检测的阈值
            axes(handles.axes5);
            imshow(I2);
            title(['K:',num2str(i)]);
            axes(handles.axes4);
            imhist(I2)
            i = i - 0.003
            pause(0.01)
            drawnow
     end
     guidata(hObject, handles);
end

%% 特定区域锐化滤波
if select_function == 5
    axes(handles.axes2)
%     BW = roipoly(I1);
    H = fspecial('motion',20,45);
    I2 = imfilter(I1,H,'replicate');
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end

%% 模糊处理
if select_function == 6
    H = fspecial('disk',10);
    I2 = imfilter(I1,H,'replicate');
    axes(handles.axes5); 
    imshow(I2);
    xlabel('模糊图像');
    axes(handles.axes4);
    imhist(I2)
end

%% 黑白二值化
if select_function == 7
    level=graythresh(I1);                     % 设置黑白转换阈值
    I2=im2bw(I1,level);                       % 将图像转换为黑白图像
    % 根据上面直方图选择阈值150,划分图像的前景和背景
    axes(handles.axes5);
    imshow(I2); 
    xlabel('黑白二值化图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 膨胀图像
if select_function == 8
    se = strel('ball',5,5); %创建椭圆Strel对象
    I2=imdilate(I1,se);                       %膨胀图像
    axes(handles.axes5);
    imshow(I2); 
    xlabel('膨胀图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 腐蚀图像
if select_function == 9
    se = strel('ball',5,5); %创建椭圆Strel对象
    I2=imerode(I1,se);                       %膨胀图像
    axes(handles.axes5);
    imshow(I2); 
    xlabel('腐蚀图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 特定区域锐化滤波
if select_function == 10
    axes(handles.axes2)
    BW = roipoly(I1);
    h = fspecial('motion');
    I2 = roifilt2(h,I1,BW);
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end

%% 改变亮度
if select_function == 11
    im = 0.1
    set(handles.pushbutton7,'UserData',1); 
    while(im < 10   & get(handles.pushbutton7,'UserData') ==1)
        I2 = immultiply(I1, im);
        axes(handles.axes5);
        imshow(I2); 
        xlabel('改变亮度'); 
        title(['缩放系数',num2str(im)]);
        axes(handles.axes4);
        imhist(I2);
        pause(0.01)
        im = im+0.02;
        drawnow
    end
    guidata(hObject, handles);
end

%% 动态调整图片亮度
if select_function == 12
    I2_tem=-double(I1)+255;        %B=-1*A+255，图像求补，注意把A的类型转换为double
    axes(handles.axes5);
    I2 = uint8(I2_tem);
    imshow(I2); 
%     xlabel('改变亮度'); 
    title('图像求补');                  %再把double类型转换为unit8
    axes(handles.axes4);
    imhist(I2)
end

%% 动态加入椒盐噪音
if select_function == 13
    set(handles.pushbutton7,'UserData',1); 
    im = 0.01
    while(im < 0.8   & get(handles.pushbutton7,'UserData') ==1)
        I2 = imnoise(I1,'salt & pepper',im);
        axes(handles.axes5); 
        imshow(I2);
        title(['加上盐椒噪声后的图像',num2str(im)]);
        axes(handles.axes4);
        imhist(I2)
        im = im + 0.01;
        pause(0.1);
        drawnow;
    end
    guidata(hObject, handles);
end
%% 改变对比度
if select_function == 14
       I2 = imadjust(I1,stretchlim(I1),[0 1]);
        axes(handles.axes5); 
        imshow(I2);
        title('改变对比度');
        axes(handles.axes4);
        imhist(I2)
end

%% 转换为索引色
if select_function == 15
       I2 = grayslice(I1, 16);
        axes(handles.axes5); 
        imshow(I2,jet(16));
        title('RGB转索引色');
        axes(handles.axes4);
        imhist(I2);
end

%% 特定区域高斯滤波
if select_function == 16
    axes(handles.axes2)
    BW = roipoly(I1);
    h = fspecial('gaussian');
    I2 = roifilt2(h,I1,BW);
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end

%% 特定区域平均滤波
if select_function == 17
    axes(handles.axes2)
    BW = roipoly(I1);
    h = fspecial('average');
    I2 = roifilt2(h,I1,BW);
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end



%% 特定区域边缘提取
if select_function == 18
    axes(handles.axes2)
    BW = roipoly(I1);
    h = fspecial('sobel');
    I2 = roifilt2(h,I1,BW);
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end

%% 特定区域马赛克
if select_function == 19
    axes(handles.axes2)
    BW = roipoly(I1);
    h = fspecial('disk',30);
    I2 = roifilt2(h,I1,BW);
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end
%% 尺寸缩小
if select_function == 20
    axes(handles.axes2)
    I2 = imresize(I1,0.9*size(I1));
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end

%% 尺寸缩小
if select_function == 21
    axes(handles.axes2)
    I2 = imresize(I1,0.8*size(I1));
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end

%% 尺寸缩小
if select_function == 22
    axes(handles.axes2)
    I2 = imresize(I1,0.7*size(I1));
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end
%% 尺寸缩小
if select_function == 23
    axes(handles.axes2)
    I2 = imresize(I1,1.1*size(I1));
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end
%% 尺寸缩小
if select_function == 24
    axes(handles.axes2)
    I2 = imresize(I1,1.2*size(I1));
    axes(handles.axes5);
    imshow(I2); 
    axes(handles.axes4);
    imhist(I2)
end
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
global I2
I1 = I2;
axes(handles.axes2);
imshow(I1); 
axes(handles.axes3);
imhist(I1)

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
[f,p]=uiputfile({'*.jpg'},'保存文件');
str=strcat(p,f);
pix=getframe(handles.axes2);
imwrite(pix.cdata,str,'jpg')


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uiresume(handles.aexs4)
set(handles.pushbutton7,'UserData',0);
guidata(hObject, handles);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic
[f,p]=uiputfile({'*.jpg'},'保存文件');
str=strcat(p,f);
pix=getframe(handles.axes1);
imwrite(pix.cdata,str,'jpg')


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global select_function
global mypic
global I2
select_function = get(handles.popupmenu1, 'value');
disp(select_function)

%% 均衡
if select_function == 2
    sourcePic=mypic;
    [m,n,o]=size(sourcePic);  
    %grayPic=rgb2gray(sourcePic);  
    %% 通道一
    grayPic=sourcePic(:,:,1);  

    gp=zeros(1,256); %计算各灰度出现的概率  
    for i=1:256  
        gp(i)=length(find(grayPic==(i-1)))/(m*n);  
    end  

    newGp=zeros(1,256); %计算新的各灰度出现的概率  
    S1=zeros(1,256);  
    S2=zeros(1,256);  
    tmp=0;  
    for i=1:256  
        tmp=tmp+gp(i);  
        S1(i)=tmp;  
        S2(i)=round(S1(i)*256);  
    end  
    for i=1:256  
        newGp(i)=sum(gp(find(S2==i)));  
    end  

    newGrayPic=grayPic; %填充各像素点新的灰度值  
    for i=1:256  
        newGrayPic(find(grayPic==(i-1)))=S2(i);  
    end  
    nr=newGrayPic;  

      %% 通道二
    grayPic=sourcePic(:,:,2);  

    gp=zeros(1,256); %计算各灰度出现的概率  
    for i=1:256  
        gp(i)=length(find(grayPic==(i-1)))/(m*n);  
    end  

    newGp=zeros(1,256); %计算新的各灰度出现的概率  
    S1=zeros(1,256);  
    S2=zeros(1,256);  
    tmp=0;  
    for i=1:256  
        tmp=tmp+gp(i);  
        S1(i)=tmp;  
        S2(i)=round(S1(i)*256);  
    end  
    for i=1:256  
        newGp(i)=sum(gp(find(S2==i)));  
    end  

    newGrayPic=grayPic; %填充各像素点新的灰度值  
    for i=1:256  
        newGrayPic(find(grayPic==(i-1)))=S2(i);  
    end  
    ng=newGrayPic;  


        %% 通道三
    grayPic=sourcePic(:,:,3);  

    gp=zeros(1,256); %计算各灰度出现的概率  
    for i=1:256  
        gp(i)=length(find(grayPic==(i-1)))/(m*n);  
    end  

    newGp=zeros(1,256); %计算新的各灰度出现的概率  
    S1=zeros(1,256);  
    S2=zeros(1,256);  
    tmp=0;  
    for i=1:256  
        tmp=tmp+gp(i);  
        S1(i)=tmp;  
        S2(i)=round(S1(i)*256);  
    end  
    for i=1:256  
        newGp(i)=sum(gp(find(S2==i)));  
    end  

    newGrayPic=grayPic; %填充各像素点新的灰度值  
    for i=1:256  
        newGrayPic(find(grayPic==(i-1)))=S2(i);  
    end  
    nb=newGrayPic;  

      %% 合并之前成果
    res=cat(3,nr,ng,nb);
    axes(handles.axes1)
    imshow(res,[]);  
end

%% 边缘检测
if select_function == 3
    I2=edge(mypic,'prewitt',0.05);  
    %以自动阈值选择法地图像进行Roberts算子检测
%     [I2,thresh1]=edge(mypic,'roberts'); 
 %返回当前Roberts算子边缘检测的阈值
    axes(handles.axes5);
    imshow(I2);
    axes(handles.axes4);
    imhist(I2)
end

%% 动态边缘检测
if select_function == 4
    i = 0.45
    set(handles.pushbutton12,'UserData',1); 
    while(i>0 & get(handles.pushbutton12,'UserData') ==1)
            I2=edge(mypic,'prewitt',i);  
            %以自动阈值选择法地图像进行Roberts算子检测
            %     [I2,thresh1]=edge(mypic,'roberts'); 
            %返回当前Roberts算子边缘检测的阈值
            axes(handles.axes5);
            imshow(I2);
            title(['K:',num2str(i)]);
            axes(handles.axes4);
            imhist(I2)
            i = i - 0.003
            pause(0.01)
            drawnow
        end
        guidata(hObject, handles);
end

%% 动态模糊处理
if select_function == 5
    H = fspecial('motion',20,45);
    I2 = imfilter(mypic,H,'replicate');
    axes(handles.axes5); 
    imshow(I2);
    xlabel('动态模糊图像');
    axes(handles.axes4);
    imhist(I2)
end

%% 模糊处理
if select_function == 6
    H = fspecial('disk',10);
    I2 = imfilter(mypic,H,'replicate');
    axes(handles.axes5); 
    imshow(I2);
    xlabel('模糊图像');
    axes(handles.axes4);
    imhist(I2)
end

%% 黑白二值化
if select_function == 7
    level=graythresh(mypic);                     % 设置黑白转换阈值
    I2=im2bw(mypic,level);                       % 将图像转换为黑白图像
    % 根据上面直方图选择阈值150,划分图像的前景和背景
    axes(handles.axes5);
    imshow(I2); 
    xlabel('黑白二值化图像');  
    axes(handles.axes4);
    imhist(I2);
end

%% 膨胀图像
if select_function == 8
    se = strel('ball',5,5); %创建椭圆Strel对象
    I2=imdilate(mypic,se);                       %膨胀图像
    axes(handles.axes5);
    imshow(I2); 
    xlabel('膨胀图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 腐蚀图像
if select_function == 9
    se = strel('ball',5,5); %创建椭圆Strel对象
    I2=imerode(mypic,se);                       %膨胀图像
    axes(handles.axes5);
    imshow(I2); 
    xlabel('腐蚀图像');  
    axes(handles.axes4);
    imhist(I2)
end

%% 特定区域锐化滤波
if select_function == 10
    BW = roipoly(mypic);
    h = fspecial('unsharp');
    I2 = roifilt2(h,mypic,BW);
    axes(handles.axes5);
    imshow(I2); 
end

%% 改变亮度
if select_function == 11
    im = 0.1
    set(handles.pushbutton12,'UserData',1); 
    while(im < 10   & get(handles.pushbutton12,'UserData') ==1)
        I2 = immultiply(mypic, im);
        axes(handles.axes5);
        imshow(I2); 
        xlabel('改变亮度'); 
        title(['缩放系数',num2str(im)]);
        pause(0.01)
        im = im+0.02;
        drawnow
    end
    guidata(hObject, handles);
end
%% 动态调整图片亮度
if select_function == 12
    I2_tem=-double(mypic)+255;        %B=-1*A+255，图像求补，注意把A的类型转换为double
    axes(handles.axes5);
    I2 = uint8(I2_tem);
    imshow(I2); 
%     xlabel('改变亮度'); 
    title('图像求补');                       %再把double类型转换为unit8
end

%% 动态加入椒盐噪音
if select_function == 13
    set(handles.pushbutton12,'UserData',1); 
    im = 0.01
    while(im < 0.8   & get(handles.pushbutton12,'UserData') ==1)
        I2 = imnoise(mypic,'salt & pepper',im);
        axes(handles.axes5); 
        imshow(I2);
        title(['加上盐椒噪声后的图像',num2str(im)]);
        im = im + 0.01;
        pause(0.1);
        drawnow;
    end
    guidata(hObject, handles);
end

%% 改变对比度
if select_function == 14
       I2 = imadjust(mypic,stretchlim(mypic),[0 1]);
        axes(handles.axes5); 
        imshow(I2);
        title('改变对比度');
end

%% 转换为索引色
if select_function == 15
       [I2,map] = rgb2ind(mypic,128);
        axes(handles.axes5); 
        imshow(I2);
        colormap(map);
        title('RGB转索引色');
end

%% 特定区域高斯滤波
if select_function == 16
    axes(handles.axes1)
    BW = roipoly(mypic);
    h = fspecial('gaussian');
    I2 = roifilt2(h,mypic,BW);
    axes(handles.axes5);
    imshow(I2); 
end

%% 特定区域平均滤波
if select_function == 17
    axes(handles.axes1)
    BW = roipoly(mypic);
    h = fspecial('average');
    I2 = roifilt2(h,mypic,BW);
    axes(handles.axes5);
    imshow(I2); 
end



%% 特定区域边缘提取
if select_function == 18
    axes(handles.axes1)
    BW = roipoly(mypic);
    h = fspecial('sobel');
    I2 = roifilt2(h,mypic,BW);
    axes(handles.axes5);
    imshow(I2); 
end

%% 特定区域马赛克
if select_function == 19
    axes(handles.axes1)
    BW = roipoly(mypic);
    h = fspecial('disk',30);
    I2 = roifilt2(h,mypic,BW);
    axes(handles.axes5);
    imshow(I2); 
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton12,'UserData',0);
guidata(hObject, handles);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid jieshu;
jieshu=1;
faceDetector = vision.CascadeObjectDetector();
hvp=vision.VideoPlayer('WindowCaption','face detect system','WindowPosition',[100,100,640,480]);
hcsc=vision.ColorSpaceConverter;
hcsc.Conversion='RGB to YCbCr';
hsi  = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[255 255 0]);
% hsi=vision.ShapeInserter('Shape','Rectangles', 'BorderColor','Custom','CustomBorderColor',[255,0 0]);
while jieshu
    frame=getsnapshot(vid);
    frame1=im2double(frame);
    Pts= step(faceDetector, frame1);
    frame=step(hsi,frame1,Pts);
    step(hvp,frame);
end
close(hvp);

function varargout = facedetect_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function axespreview_CreateFcn(hObject, eventdata, handles)
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');
% --- Executes during object creation, after setting all properties.
function axesshow_CreateFcn(hObject, eventdata, handles)
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');

function pushbutton17_Callback(hObject, eventdata, handles)
global jieshu;
jieshu=0;

% --- Executes during object creation, after setting all properties.
function pushbutton17_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
I=imread('uestc.jpg');
imshow(I);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
global mypic       %axes1的图像
% global I1               %axes2的图像
global MSES
global compressRatioS
select_function2 = get(handles.popupmenu2, 'value');    
RGB = mypic;
% RGB=imresize(RGB,[168,224]);%因为1.jpg大小为169*220，所以我改为168*224  
imwrite(RGB,'H:\matlab\GUI_STUDY\GUI_sum\image_compess\start.jpg'); %保存压缩前图像  
%下面是对RGB三个分量进行分离,此时他们依然为整数  
R=RGB(:,:,1);  
G=RGB(:,:,2);  
B=RGB(:,:,3);
start_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\image_compess\start.jpg')
axes(handles.axes1)
imshow(RGB),title('原来的RGB图像');  
start_size = start_info.FileSize;
xlabel(num2str(start_size)) 
  
%% matlab压缩功能测试
imwrite(RGB,'H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩一次.jpg'); %保存压缩前图像  
%由于1.jpg和压缩前.jpg大小差距很大，从中可以看出matlab对图像进行了压缩  
RGB=imread('H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩一次.jpg');%读取图片  
imwrite(RGB,'H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩二次.jpg'); %保存压缩前图像  
  
RGB=imread('H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩二次.jpg');%读取图片  
imwrite(RGB,'H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩三次.jpg'); %保存压缩前图像  
  
RGB=imread('H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩三次.jpg');%读取图片  
imwrite(RGB,'H:\matlab\GUI_STUDY\GUI_sum\image_compess\matlab自动压缩五次.jpg'); %保存压缩前图像  
%测试结束  
  
%% 转化为YUV图像
Y=0.299*double(R)+0.587*double(G)+0.114*double(B);  
U=-0.169*double(R)-0.3316*double(G)+0.5*double(B);  
V=0.5*double(R)-0.4186*double(G)-0.0813*double(B);  
YUV=cat(3,Y,U,V);%YUV图像  
axes(handles.axes4)
imshow(uint8(YUV)),title('通过计算得到的YUV图像')  
  

%% 进行DCT变换
T=dctmtx(8);%产生一个8*8的DCT变换矩阵 

%进行DCT变换 BY BU BV是double类型  
BY=blkproc(Y,[8 8],'P1*x*P2',T,T');  
BU=blkproc(U,[8 8],'P1*x*P2',T,T');  
BV=blkproc(V,[8 8],'P1*x*P2',T,T');  
  
a=[16 11 10 16 24 40 51 61;  
      12 12 14 19 26 58 60 55;  
      14 13 16 24 40 57 69 55;  
      14 17 22 29 51 87 80 62;  
      18 22 37 56 68 109 103 77;  
      24 35 55 64 81 104 113 92;  
      49 64 78 87 103 121 120 101;  
      72 92 95 98 112 100 103 99;];     %亮度的量化模板系数
    
  b=[17 18 24 47 99 99 99 99;  
      18 21 26 66 99 99 99 99;  
      24 26 56 99 99 99 99 99;  
      47 66 99 99 99 99 99 99;  
      99 99 99 99 99 99 99 99;  
      99 99 99 99 99 99 99 99;  
       99 99 99 99 99 99 99 99;  
       99 99 99 99 99 99 99 99;];           %颜色的量化模板系数
     
   %BY2 BU2 BV2是double类型  
   BY2=blkproc(BY,[8 8],'x./P1',a);  
   BU2=blkproc(BU,[8 8],'x./P1',b);  
   BV2=blkproc(BV,[8 8],'x./P1',b);  
   %这里进行取整量化,BY3 BU3 BV3是uint8类型  
   BY3=int8(BY2);  
   BU3=int8(BU2);  
   BV3=int8(BV2);  
     
   %BY4 BU4 BV4是double类型  
   BY4=blkproc(double(BY3),[8 8],'x.*P1',a);  
   BU4=blkproc(double(BU3),[8 8],'x.*P1',b);  
   BV4=blkproc(double(BV3),[8 8],'x.*P1',b);  
     
   %测试代码  
   %BY4=blkproc(BY2,[8 8],'x.*P1',a);  
   %BU4=blkproc(BU2,[8 8],'x.*P1',b);  
   %BV4=blkproc(BV2,[8 8],'x.*P1',b);  
     %% 根据不同的点数进行压缩
     mask = chooseMask(select_function2);
     %% 9点 select == 2
         %BY5 BU5 BV5是double类型  
         BY5=blkproc(BY4,[8 8],'P1.*x',mask);  
         BU5=blkproc(BU4,[8 8],'P1.*x',mask);  
         BV5=blkproc(BV4,[8 8],'P1.*x',mask);  




         %YI UI VI是double类型  
         YI=blkproc(double(BY5),[8 8],'P1*x*P2',T',T);  
         UI=blkproc(double(BU5),[8 8],'P1*x*P2',T',T);  
         VI=blkproc(double(BV5),[8 8],'P1*x*P2',T',T);  

       %YUVI是double类型  
        YUVI=cat(3,uint8(YI),uint8(UI),uint8(VI));%经过DCT变换和量化后的YUV图像  
        axes(handles.axes3)
        imshow(YUVI),title('经过DCT变换和量化后的YUV图像');  

    %% 重新组合出图像
        RI=YI-0.001*UI+1.402*VI;  
        GI=YI-0.344*UI-0.714*VI;  
        BI=YI+1.772*UI+0.001*VI;  
        RGBI=cat(3,RI,GI,BI);%经过DCT变换和量化后的YUV图像  
        RGBI=uint8(RGBI);  
        axes(handles.axes5)
        imshow(RGBI),title('经过DCT变换和量化后的RGB图像');  
        imwrite(RGBI,'H:\matlab\GUI_STUDY\GUI_sum\image_compess\end_9Points.jpg'); %保存压缩图像  
        last_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\image_compess\end_9Points.jpg')
        last_size = last_info.FileSize;
        xlabel(num2str(last_size)) ;
        compressRatio = last_size /start_size;
        MSE = MSE_caculate(RGB,RGBI);
        result = [start_size last_size compressRatio MSE];
        compressRatioS = [compressRatioS compressRatio];
        MSES = [MSES MSE];
        set(handles.listbox2,'string',result )



% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 示例1
% 加载测试图片1
addpath 'H:\matlab\图像检索\myprojects\myprojects\tools\gist'
addpath 'H:\matlab\图像检索\myprojects\myprojects\methods\LSH' 'H:\matlab\图像检索\myprojects\myprojects\tools\utils' 
addpath 'H:\matlab\图像检索\myprojects\myprojects\datasets\new'
[FileName,PathName] = uigetfile('*.jpg','Select figure');
query_img = [PathName,FileName,];
img11 = imread(query_img);
% 调整图片大小
img1 = imresize(img11,[32,32]);
img1 = uint8(img1);
%     for k = 1:3
%         img1(:,:,k) = fliplr(img1(:,:,k));
%     end
% 设定参数:
% param.imageSize = [256 256];               % 图片大小：256*256
param.orientationsPerScale = [8 8 8 8];    % 4 尺度 8方向
param.numberBlocks = 4;                    % 图片分块数目
param.fc_prefilt = 4;

% 计算 GIST 特征
[gist1, param] = LMgist(img1, '', param);

% 特征可视化
figure
subplot(121)
imshow(img1)
title('Input image')
subplot(122)
showGist(gist1, param)
title('Descriptor')
gist1 = gist1 -  0.0656;
gist1 = normr(gist1);
Xtest = gist1;
load('H:\matlab\图像检索\myprojects\myprojects\datasets\new\CIFAR10.mat');              % 加载数据
Xtraining =exp_data.train_data;                  % 加载训练数据集

% LSH 参数设置
c_num=1000;
epsilon=0.002;
loopbits=128;                                     % 哈希编码位数
param.block_size=1;
param.nbits=loopbits;
LSHparam=param;
LSHparam.L=3;
[ntraining, Dim]=size(Xtraining);                % 训练数据信息：样本数目以及特征维度
Param.Is = lshfunc(LSHparam.L, LSHparam.nbits, Dim);
ntest=size(Xtest,1);
L=length(Param.Is);
for j=1:L
    B_tst{j} = compressLSH(Xtest, Param.Is(j) );
    B_trn{j} = compressLSH(Xtraining, Param.Is(j) );
end
%%
block_size=LSHparam.block_size;
block_num=1;
for i_block=1:block_num
    fprintf('%d ', i_block);
    D=zeros(block_size,ntraining,'uint8');
    D=D+inf;
    block_size=param.block_size;    
    ibase=(i_block-1)*block_size;   
    imax=min(i_block*block_size, ntest); 
    BlockIdx=ibase+1:imax;     

    for j=1:L
        Dhamm = hammingDist(B_tst{j}(BlockIdx,:), B_trn{j});
        D=min(Dhamm,D);
    end
    [foo, Rank] = sort(D, 2,'ascend');
    %Rank是对应排序前的位置
end


% 设定检索数目
idx_train = (1:60000)';
idx_train(exp_data.index,:) = [];
num_show = 36;                                     % 设定检索返回的样本数目
num_row = 6;                                       % 分成6行展示
num_colum = num_show/num_row;                      % 每行展示6个
idx_retrieval = Rank(1:36)';
index = idx_train(idx_retrieval);

% 展示的样式
left=0.5;
botton=0.8;
width=0.08;
height=0.08;

% 显示查询图片
image_query = img1;
figure('Color', [1 1 1]); hold on;
imshow(image_query);
xlabel('查询图像')

% 显示检索结果
I2 = uint8(zeros(32, 32, 3, num_show));                 
for i=1:num_row
    for j=1:num_colum
        % 检索结果索引
        image_retrieval_index = index((i-1)*num_row+j); 
        % 检索结果路径
        img_retrieval_path = ['H:\matlab\图像检索\myprojects\myprojects\datasets\new\img_train\',num2str(image_retrieval_index),'.jpg'];
        % 加载检索的结果
        image = uint8(imread(img_retrieval_path));
        % 将结果放入矩阵，方便显示
        I2(:, :, :, j+(i-1)*num_row) = image;
    end
end

% 可视化
figure('Color', [1 1 1]); hold on;
montage(I2(:, :, :, :));
xlabel('LSH检索结果');


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic I1
X1 = mypic
X2 = I1
Y1 = wpdec2(X1,2,'db10');
plot(Y1);
Y2 = wpdec2(X2,2,'db10');
plot(Y2);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MSES
global compressRatioS
axes(handles.axes2);
hold on
plot(compressRatioS,MSES);
compressRatioS = [];
MSES = [];



function mse = MSE_caculate(RGB,RGBI)
%% 求MSE，RGB为压缩前图片，RGB1为压缩后图片
D=RGB-RGBI;
mse = sum(D(:).*D(:))/prod(size(RGB));

function mask = chooseMask(select_function2)
if(select_function2 ==1)
                mask=[  
             1 0 0  0 0 0 0 0;  
             0 0 0 0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0  0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 ==2)
                mask=[  
             1 1 0  0 0 0 0 0;  
             1  0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0  0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 == 3)
                mask=[  
             1 1 1  0 0 0 0 0;  
             1 1 0  0 0 0 0 0;  
             1 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0  0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 == 4)
                mask=[  
             1 1 1  1 0 0 0 0;  
             1 1 1  0 0 0 0 0;  
             1 1 0  0 0 0 0 0;  
             1 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0  0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 == 5)
                mask=[  
             1 1 1  1 1 0 0 0;  
             1 1 1  1 0 0 0 0;  
             1 1 1  0 0 0 0 0;  
             1 1 0  0 0 0 0 0;  
             1 0 0  0 0 0 0 0;  
             0 0 0  0 0  0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 == 6)
                mask=[  
             1 1 1  1 1 1 0 0;  
             1 1 1  1 1 0 0 0;  
             1 1 1  1 0 0 0 0;  
             1 1 1  0 0 0 0 0;  
             1 1 0  0 0 0 0 0;  
             1 0 0  0 0  0 0 0;  
             0 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 == 7)
                mask=[  
             1 1 1  1 1 1 1 0;  
             1 1 1  1 1 1 0 0;  
             1 1 1  1 1 0 0 0;  
             1 1 1  1 0 0 0 0;  
             1 1 1  0 0 0 0 0;  
             1 1 0  0 0  0 0 0;  
             1 0 0  0 0 0 0 0;  
             0 0 0  0 0 0 0 0;];  
end
if(select_function2 == 8)
                mask=[  
             1 1 1  1 1 1 1 1;  
             1 1 1  1 1 1 1 0;  
             1 1 1  1 1 1 0 0;  
             1 1 1  1 1 0 0 0;  
             1 1 1  1 0 0 0 0;  
             1 1 1  0 0  0 0 0;  
             1 1 0  0 0 0 0 0;  
             1 0 0  0 0 0 0 0;];  
end


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Do_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('DO_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Re_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Re_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Mi_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Mi_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Fa_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Fa_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('So_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('So_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('La_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('La_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Xi_p.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Xi_p')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Do_beisi.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Do_beisi')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Do_guitar.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Do_guitar')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Do_kouqin.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Do_kouqin')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Do_tiqin.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Do_tiqin')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;
% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('Do_xiaohao.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 5000*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('Do_xiaohao')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
X = I1;
Fs = 48000;
X = double(X);
X = (X-39.3)/5000;
% X = rgb2gray(X);
% X = double(X); 
[m n] = size(X);
music = zeros(m*n,1);
for Li = 1:1:m
    for Lj = 1:1:n
        music((Li-1)*n+Lj) = X(Li,Lj);
    end
end
sound(music,Fs);


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('train.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 200*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('train')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('splat.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 200*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('splat')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('mtlb.mat')
y = mtlb;
sound(y,Fs);
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 40*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('mtlb')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('laughter.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 200*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('laughter')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('gong.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 200*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('gong')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
load('chirp.mat')
sound(y,Fs)
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 200*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
axes(handles.axes2)
imshow(image_audio)
title('chirp')
axes(handles.axes3);
imhist(image_audio);
I1 = image_audio;

% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
X = I1;
Fs = 8000;
X = double(X);
X = (X-39.3)/200;
% X = rgb2gray(X);
% X = double(X); 
[m n] = size(X);
music = zeros(m*n,1);
for Li = 1:1:m
    for Lj = 1:1:n
        music((Li-1)*n+Lj) = X(Li,Lj);
    end
end
sound(music,Fs);


% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
X = I1;
X = double(X);   
%对图像用小波进行层小波分解  
[C,S]=wavedec2(X,2,'bior3.7');  
Y=wcodemat(X);   %对图像的数值矩阵进行伪彩色编码
thr=0.5;      %设置阈值
[Xcompress1,cxd,lxd,perf0,  perfl2]=wdencmp('gbl',C,S,'db4',2,thr,'s',0);
%对图像进行全局压缩
Y1=wcodemat(Xcompress1);    %对图像数据进行伪彩色编码
set(0,'defaultFigurePosition',[100,100,1000,500]);  
%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1 1 1])        %修改图形背景颜色的设置
% colormap(gray(nbc));       %设置映射谱图等级
X = uint8(X);
Y = uint8(Y);
Y1 = uint8(Y1);
% Y = immultiply(Y, 15);
% Y1 = immultiply(Y1, 25);
axes(handles.axes1);
imshow(Y,[]);
title('第一次图像压缩');
axis square      %显示
axes(handles.axes5);
imshow(Y1,[]);
axis square
title('第二次图像压缩');
imwrite(X,'com_1.jpg')
imwrite(Y,'com_2.jpg')
imwrite(Y1,'com_3.jpg')
mse1 = MSE_caculate(X,Y)
mse2 = MSE_caculate(X,Y1)
start_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\com_1.jpg');
start_size = start_info.FileSize
s1_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\com_2.jpg');
s1_size = s1_info.FileSize
end_info = imfinfo('H:\matlab\GUI_STUDY\GUI_sum\com_3.jpg');
end_size = end_info.FileSize


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
global I Blurred V PSF
mypic = I1;
select = get(handles.popupmenu4,'value');
%% gaussian模糊
if select == 1 
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('gaussian',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    axes(handles.axes2)
    imshow(Blurred)
end

%% 运动模糊
if select == 2 
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('motion',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    axes(handles.axes2)
    imshow(Blurred)
end

%% 运动模糊
if select == 3
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('gaussian',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    %% 图像模糊化加噪
    V = .002;
    BlurredNoisy = imnoise(Blurred,'gaussian',0,V);
    Blurred = BlurredNoisy;
    axes(handles.axes2)
    imshow(Blurred)
end

%% 运动模糊
if select == 4
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('motion',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    %% 图像模糊化加噪
    V = .002;
    BlurredNoisy = imnoise(Blurred,'gaussian',0,V);
    Blurred = BlurredNoisy;
    axes(handles.axes2)
    imshow(Blurred)
end
mse = MSE_caculate(I,Blurred);
set(handles.listbox2,'string',mse);

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I Blurred V PSF
selectFuctionRecover = get(handles.popupmenu3,'value');
%% 约束最小二乘滤波
if selectFuctionRecover == 1
    NP = V * prod(size(I));
    reg1 = deconvreg(Blurred,PSF,NP);
    axes(handles.axes5)
    imshow(reg1)
    mse = MSE_caculate(I,reg1);
end

%% 维纳滤波
if selectFuctionRecover == 2
    wnr = deconvwnr(Blurred,PSF,0.001);
    axes(handles.axes5)
    imshow(wnr)
    mse = MSE_caculate(I,wnr);
end
%% 维纳滤波
if selectFuctionRecover == 3
    wnr = deconvwnr(Blurred,PSF,0.1);
    axes(handles.axes5)
    imshow(wnr)
    mse = MSE_caculate(I,wnr);
end
%% Lucy滤波
if selectFuctionRecover == 4
    wnr = deconvlucy(Blurred,PSF);
    axes(handles.axes5)
    imshow(wnr)
    mse = MSE_caculate(I,wnr);
end

%% 盲解卷积复原(彩色)
if selectFuctionRecover == 5
    %% 初步复原
    INITPSF = ones(size(PSF));
    [J,P] = deconvblind(Blurred,INITPSF);
    axes(handles.axes5);
    imshow(J);
    mse = MSE_caculate(I,J);
end

%% 盲解卷积复原(灰色)
if selectFuctionRecover == 6
    %% 初步复原
    INITPSF = ones(size(PSF));
    [J,P] = deconvblind(Blurred,INITPSF);
    %% 进一步复原
    WEIGHT = edge(I,'sobel',.28);
    se1 = strel('disk',1);
    se2 = strel('line',13,45);
    WEIGHT = 1- double(imdilate(WEIGHT,[se1 se2]));
    P1 = P;
    P1(find(P1<0.001)) = 0
    [J2,~] = deconvblind(Blurred,P1,50,[],WEIGHT);
    axes(handles.axes5);
    imshow(J2);
    mse = MSE_caculate(I,J);
end

set(handles.listbox2,'string',mse)
% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I=imread('tongxin.jpg');
imshow(I);
% Hint: place code in OpeningFcn to populate axes7


% --- Executes on key press with focus on pushbutton29 and none of its controls.
function pushbutton29_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if double(get(gcf,'CurrentCharacter')) == 81
    pushbutton29_Callback(hObject, eventdata, handles);
    pause(0.5)
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mypic
global I Blurred V PSF
select = get(handles.popupmenu4,'value');
%% gaussian模糊
if select == 1 
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('gaussian',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    axes(handles.axes2)
    imshow(Blurred)
end

%% 运动模糊
if select == 2 
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('motion',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    axes(handles.axes2)
    imshow(Blurred)
end

%% 运动模糊
if select == 3
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('gaussian',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    %% 图像模糊化加噪
    V = .002;
    BlurredNoisy = imnoise(Blurred,'gaussian',0,V);
    Blurred = BlurredNoisy;
    axes(handles.axes2)
    imshow(Blurred)
end

%% 运动模糊
if select == 4
    I = mypic;
    LEN = 31;   
    %% 图像模糊化
    THETA = 11;
    PSF = fspecial('motion',LEN,THETA);
    Blurred = imfilter(I,PSF,'circular','conv');
    %% 图像模糊化加噪
    V = .002;
    BlurredNoisy = imnoise(Blurred,'gaussian',0,V);
    Blurred = BlurredNoisy;
    axes(handles.axes2)
    imshow(Blurred)
end
mse = MSE_caculate(I,Blurred);
set(handles.listbox2,'string',mse);


% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I1
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
    xlabel('压缩率')
    ylabel('MSE')
%     result = [start_size last_size compressRatio MSE];
%     compressRatioS = [compressRatioS compressRatio];
%     MSES = [MSES MSE];
    im = im+1;
    pause(0.01)
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles no6t created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
