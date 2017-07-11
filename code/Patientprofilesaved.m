function varargout = Patientprofilesaved(varargin)
% PATIENTPROFILESAVED MATLAB code for Patientprofilesaved.fig
%      PATIENTPROFILESAVED, by itself, creates a new PATIENTPROFILESAVED or raises the existing
%      singleton*.
%
%      H = PATIENTPROFILESAVED returns the handle to a new PATIENTPROFILESAVED or the handle to
%      the existing singleton*.
%
%      PATIENTPROFILESAVED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PATIENTPROFILESAVED.M with the given input arguments.
%
%      PATIENTPROFILESAVED('Property','Value',...) creates a new PATIENTPROFILESAVED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Patientprofilesaved_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Patientprofilesaved_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Patientprofilesaved

% Last Modified by GUIDE v2.5 11-Apr-2017 00:19:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Patientprofilesaved_OpeningFcn, ...
                   'gui_OutputFcn',  @Patientprofilesaved_OutputFcn, ...
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


% --- Executes just before Patientprofilesaved is made visible.
function Patientprofilesaved_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Patientprofilesaved (see VARARGIN)

% Choose default command line output for Patientprofilesaved
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Patientprofilesaved wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Patientprofilesaved_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
handles.Name = getappdata(0, 'Name');
set(handles.text8,'string', handles.Name);
handles.Age = getappdata(0, 'Age');
set(handles.text9,'string', handles.Age);
handles.Severity = getappdata(0, 'Severity');
set(handles.text13,'string', handles.Severity);
handles.History = getappdata(0, 'History');
set(handles.text11,'string', handles.History);
handles.male = getappdata(0, 'male');
handles.female = getappdata(0, 'female');
if handles.male == 1
    set(handles.text10,'string','Male');
elseif handles.female == 1
    set(handles.text10,'string','Female');
end
handles.asthma = getappdata(0, 'asthma');
if handles.asthma == 1
    set(handles.text12,'string','Yes');
else
    set(handles.text12,'string','No');
end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientprofilesaved;
run Patientnumber;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientprofilesaved;
run Patientnumber;
