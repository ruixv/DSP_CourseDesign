function varargout = dsp_for_inspection(varargin)
% DSP_FOR_INSPECTION MATLAB code for dsp_for_inspection.fig
%      DSP_FOR_INSPECTION, by itself, creates a new DSP_FOR_INSPECTION or raises the existing
%      singleton*
%
%      H = DSP_FOR_INSPECTION returns the handle to a new DSP_FOR_INSPECTION or the handle to
%      the existing singleton*.
%
%      DSP_FOR_INSPECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSP_FOR_INSPECTION.M with the given input arguments.
%
%      DSP_FOR_INSPECTION('Property','Value',...) creates a new DSP_FOR_INSPECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dsp_for_inspection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dsp_for_inspection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dsp_for_inspection

% Last Modified by GUIDE v2.5 20-May-2017 10:17:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dsp_for_inspection_OpeningFcn, ...
                   'gui_OutputFcn',  @dsp_for_inspection_OutputFcn, ...
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


% --- Executes just before dsp_for_inspection is made visible.
function dsp_for_inspection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dsp_for_inspection (see VARARGIN)
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('uestc3.jpg');
image(II)
colormap gray
% Choose default command line output for dsp_for_inspection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dsp_for_inspection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dsp_for_inspection_OutputFcn(hObject, eventdata, handles) 
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
run('time1.m')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('video_processing.m')

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('zishiyingjunhengqi.m')

function axes1_CreateFcn(hObject, eventdata, handles)
I=imread('uestc.jpg');
imshow(I);


function axes2_CreateFcn(hObject, eventdata, handles)
I=imread('tongxin.jpg');
imshow(I);
