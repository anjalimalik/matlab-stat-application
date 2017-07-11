function varargout = Patientnumber(varargin)
% PATIENTNUMBER MATLAB code for Patientnumber.fig
%      PATIENTNUMBER, by itself, creates a new PATIENTNUMBER or raises the existing
%      singleton*.
%
%      H = PATIENTNUMBER returns the handle to a new PATIENTNUMBER or the handle to
%      the existing singleton*.
%
%      PATIENTNUMBER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PATIENTNUMBER.M with the given input arguments.
%
%      PATIENTNUMBER('Property','Value',...) creates a new PATIENTNUMBER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Patientnumber_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Patientnumber_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Patientnumber

% Last Modified by GUIDE v2.5 24-Apr-2017 20:30:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Patientnumber_OpeningFcn, ...
                   'gui_OutputFcn',  @Patientnumber_OutputFcn, ...
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


% --- Executes just before Patientnumber is made visible.
function Patientnumber_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Patientnumber (see VARARGIN)

% Choose default command line output for Patientnumber
handles.output = hObject;

%%Pushbuttons turned off
set(handles.pushbutton3,'Enable', 'off'); %Comparison
set(handles.DataLog,'Enable', 'off'); %Data Log
set(handles.pushbutton6,'Enable', 'off'); %Statistics
set(handles.pushbutton7,'Enable', 'off'); %Patient Info
set(handles.pushbutton8,'Enable', 'off'); %Parent Info

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Patientnumber wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Patientnumber_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientnumber; 
run Comparison;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientnumber; 
run Statistics;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientnumber;
run Patientprofilesaved;



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientnumber;
run Parent_Info_New;

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientnumber;
run HomePage;


% --- Executes on button press in DataLog.
function DataLog_Callback(hObject, eventdata, handles)
% hObject    handle to DataLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientnumber;
run DataLog; 


% --- Executes on button press in UploadFile.
function UploadFile_Callback(hObject, eventdata, handles)
% hObject    handle to UploadFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.fileName = uigetfile('*.xlsx');

setappdata(0, 'fileName', handles.fileName); 
%%Determine if file uploaded
if ~isempty(handles.fileName)
    set(handles.pushbutton3, 'Enable', 'on'); %Comparison
    set(handles.DataLog,'Enable', 'on'); %Data Log
    set(handles.pushbutton6,'Enable', 'on'); %Statistics
    set(handles.pushbutton7,'Enable', 'on'); %Patient Info
    set(handles.pushbutton8,'Enable', 'on'); %Parent Info
end

guidata(hObject, handles)
