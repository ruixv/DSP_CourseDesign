function varargout = adaptive(varargin)
% ADAPTIVE MATLAB code for adaptive.fig
%      ADAPTIVE, by itself, creates a new ADAPTIVE or raises the existing
%      singleton*.
%
%      H = ADAPTIVE returns the handle to a new ADAPTIVE or the handle to
%      the existing singleton*.
%
%      ADAPTIVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADAPTIVE.M with the given input arguments.
%
%      ADAPTIVE('Property','Value',...) creates a new ADAPTIVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before adaptive_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to adaptive_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help adaptive

% Last Modified by GUIDE v2.5 04-Jun-2017 23:36:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @adaptive_OpeningFcn, ...
                   'gui_OutputFcn',  @adaptive_OutputFcn, ...
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


% --- Executes just before adaptive is made visible.
function adaptive_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to adaptive (see VARARGIN)
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('uestc10.jpg');
image(II)
colormap gray
% Choose default command line output for adaptive
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes adaptive wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = adaptive_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%产生信息
message = get(handles.edit1,'string');
% message='when i was a boy,my mother told me "you will finish a great thing!" ';
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
delta=str2double(get(handles.edit5,'string'));
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
axes(handles.axes4)
stem(y);
title('经过信道并加噪后的信号')
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
axes(handles.axes3)
stem(xn);
title('原来的信号')

axes(handles.axes1)
stem(info,'red');title('原码和未经均衡器的输出码的对比图');
hold on;
stem(yn,'blue');
axes(handles.axes2)
stem(info,'red');title('源码和经过均衡器的输出码的对比图');
hold on;
stem(temp,'blue');
%译码：
temp=temp(1:end-7);
recieve1=decode(yn);
set(handles.edit4,'string',recieve1)
recieve=decode(temp);
set(handles.edit2,'string',recieve)
mesav=mean(mes);
set(handles.edit3,'string',num2str(mesav))



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
