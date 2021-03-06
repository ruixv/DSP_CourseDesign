function varargout = piano_3(varargin)
% PIANO_3 MATLAB code for piano_3.fig
%      PIANO_3, by itself, creates a new PIANO_3 or raises the existing
%      singleton*.
%
%      H = PIANO_3 returns the handle to a new PIANO_3 or the handle to
%      the existing singleton*.
%
%      PIANO_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIANO_3.M with the given input arguments.
%
%      PIANO_3('Property','Value',...) creates a new PIANO_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before piano_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to piano_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help piano_3

% Last Modified by GUIDE v2.5 30-Apr-2017 19:27:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @piano_3_OpeningFcn, ...
                   'gui_OutputFcn',  @piano_3_OutputFcn, ...
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


% --- Executes just before piano_3 is made visible.
function piano_3_OpeningFcn(hObject, eventdata, handles, varargin)
global Z
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to piano_3 (see VARARGIN)

hold on
Z = 0.2
axis([Z-0.1, Z, -0.5, 0.5]);        %可通过延长时间观察包络的效果（即模仿乐器，使它们衰减）
1
% Choose default command line output for piano_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes piano_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = piano_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton61.
function pushbutton61_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton62.
function pushbutton62_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton63.
function pushbutton63_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton64.
function pushbutton64_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton65.
function pushbutton65_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton66.
function pushbutton66_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton67.
function pushbutton67_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton68.
function pushbutton68_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton69.
function pushbutton69_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton70.
function pushbutton70_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton71.
function pushbutton71_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton72.
function pushbutton72_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton73.
function pushbutton73_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*138.6*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);

play(p);
pause(5);


% --- Executes on button press in pushbutton74.
function pushbutton74_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*130.8*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton75.
function pushbutton75_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*155.6*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton76.
function pushbutton76_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*146.8*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton77.
function pushbutton77_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*164.8*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton78.
function pushbutton78_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*174.6*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton79.
function pushbutton79_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*185*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton80.
function pushbutton80_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*196*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton81.
function pushbutton81_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*207.7*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton82.
function pushbutton82_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*220*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton83.
function pushbutton83_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*233.1*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton84.
function pushbutton84_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*246.9*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton85.
function pushbutton85_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*277.2*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton86.
function pushbutton86_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*262*t).*exp(-1.5*t);   %乘以衰减系数，表示假如包络
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton87.
function pushbutton87_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*311.1*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton88.
function pushbutton88_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*293.7*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton89.
function pushbutton89_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*329.6*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton90.
function pushbutton90_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*349.2*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton91.
function pushbutton91_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*370*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton92.
function pushbutton92_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*392*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton93.
function pushbutton93_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*415.3*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton94.
function pushbutton94_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*440*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton95.
function pushbutton95_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*446.2*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton96.
function pushbutton96_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*493.9*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton97.
function pushbutton97_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*554.4*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton98.
function pushbutton98_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*523.3*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton99.
function pushbutton99_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*622.3*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton100.
function pushbutton100_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*587.3*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton101.
function pushbutton101_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*659.3*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton102.
function pushbutton102_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton102 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*698.5*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton103.
function pushbutton103_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*740*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton104.
function pushbutton104_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*784*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton105.
function pushbutton105_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*830.6*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton106.
function pushbutton106_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton106 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*880*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton107.
function pushbutton107_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*932.3*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);

% --- Executes on button press in pushbutton108.
function pushbutton108_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*987.8*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton109.
function pushbutton109_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton110.
function pushbutton110_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 44100;
dt = 1.0/Fs;
T = 1;
N = T/dt;
t = linspace(0, T, N);
x = 0.3*sin(2*pi*1047*t).*exp(-1.5*t);
plot(t,x);
%axis([0, 0.01, -0.5, 0.5]);
p = audioplayer(x,Fs);
play(p);
pause(5);


% --- Executes on button press in pushbutton111.
function pushbutton111_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton112.
function pushbutton112_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton113.
function pushbutton113_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton114.
function pushbutton114_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton114 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton115.
function pushbutton115_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton115 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton116.
function pushbutton116_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton117.
function pushbutton117_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton117 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton118.
function pushbutton118_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton118 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton119.
function pushbutton119_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton119 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton120.
function pushbutton120_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton120 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton121.
function pushbutton121_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton121 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% cla(handles.axes,'reset')

hold off
plot(1,1)
axis([0, 0.1, -0.5, 0.5]);        %可通过延长时间观察包络的效果（即模仿乐器，使它们衰减）
hold on


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global Z
v = get(handles.slider1,'Value')
Z = 2*0.5*v;
axis([Z-0.1, Z, -0.5, 0.5]);        %可通过延长时间观察包络的效果（即模仿乐器，使它们衰减）
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton122.
function pushbutton122_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton122 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('mtlb.mat','mtlb');
y = (y.mtlb)./2;
Fs = load('mtlb.mat','Fs');
Fs = Fs.Fs;
t = 0.0004:0.0004:length(y)/2500;
plot(t,y);
% y = mtlb
sound(y,Fs);


% --- Executes on button press in pushbutton123.
function pushbutton123_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton123 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('gong.mat','y');
y = y.y;
% y = y(1:4001)
Fs = load('gong.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);


% --- Executes on button press in pushbutton124.
function pushbutton124_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton124 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('train.mat','y');
y = y.y;
% y = y(1:4001)
Fs = load('train.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);

% --- Executes on button press in pushbutton125.
function pushbutton125_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton125 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('splat.mat','y');
y = y.y;
% y = y(1:4001)
Fs = load('splat.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);

% --- Executes on button press in pushbutton126.
function pushbutton126_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton126 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('laughter.mat','y');
y = y.y;
% y = y(1:4001)
Fs = load('laughter.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);

% --- Executes on button press in pushbutton127.
function pushbutton127_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton127 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('handel.mat','y');
y = y.y;
% y = y(1:4001)
Fs = load('handel.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);

% --- Executes on button press in pushbutton128.
function pushbutton128_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton128 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('chirp.mat','y');
y = y.y;
% y = y(1:4001);
Fs = load('chirp.mat','Fs');
Fs = Fs.Fs;
t = 0.0001:0.0001:length(y)/10000;
plot(t,y);
sound(y);


% --- Executes on button press in pushbutton129.
function pushbutton129_Callback(hObject, eventdata, handles)
global x
% hObject    handle to pushbutton129 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.mp3','Select mp3 File');
path = strcat(PathName,FileName);
[y,Fs] = audioread(path,[1500000,2100000]);
% y = y(:,1);
t = 0.00001:0.00001:length(y)/100000
plot(t,y)
sound(y,Fs)
x = 0
while(x<4.15)
    axis([x,x+2,-0.5,0.5])
    x = x+0.005725
    pause(0.025)
end


% --- Executes on button press in pushbutton130.
function pushbutton130_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton130 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound


% --- Executes on button press in pushbutton131.
function pushbutton131_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton131 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x
x = 100


% --- Executes on button press in pushbutton133.
function pushbutton133_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Do_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Do_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton134.
function pushbutton134_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton134 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Re_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Re_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton135.
function pushbutton135_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Mi_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Mi_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton136.
function pushbutton136_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton136 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Fa_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Fa_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton137.
function pushbutton137_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton137 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('So_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('So_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton138.
function pushbutton138_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton138 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('La_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('La_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton139.
function pushbutton139_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton139 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Xi_p.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Xi_p.mat','Fs');
Fs = Fs.Fs;
t = 0.00002:0.00002:length(y)/50000;
plot(t,y);
sound(y,Fs);

% --- Executes during object creation, after setting all properties.
function pushbutton133_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton133 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton140.
function pushbutton140_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton140 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Do_tiqin.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Do_tiqin.mat','Fs');
Fs = Fs.Fs;
t = 0.00001:0.00001:length(y)/100000;
plot(t,y);
sound(y,Fs);

% --- Executes on button press in pushbutton141.
function pushbutton141_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton141 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Do_guitar.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Do_guitar.mat','Fs');
Fs = Fs.Fs;
t = 0.00001:0.00001:length(y)/100000;
plot(t,y);
sound(y,Fs);


% --- Executes on button press in pushbutton142.
function pushbutton142_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton142 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Do_beisi.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Do_beisi.mat','Fs');
Fs = Fs.Fs;
t = 0.00001:0.00001:length(y)/100000;
plot(t,y);
sound(y,Fs);


% --- Executes on button press in pushbutton143.
function pushbutton143_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton143 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Do_xiaohao.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Do_xiaohao.mat','Fs');
Fs = Fs.Fs;
t = 0.00001:0.00001:length(y)/100000;
plot(t,y);
sound(y,Fs);


% --- Executes on button press in pushbutton144.
function pushbutton144_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton144 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = load('Do_kouqin.mat','y');
y = 10*(y.y);
% y = y(1:4001)
Fs = load('Do_kouqin.mat','Fs');
Fs = Fs.Fs;
t = 0.00001:0.00001:length(y)/100000;
plot(t,y);
sound(y,Fs);


% --- Executes on button press in pushbutton145.
function pushbutton145_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton145 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
