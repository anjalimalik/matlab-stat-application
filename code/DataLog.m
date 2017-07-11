function varargout = DataLog(varargin)
% DATALOG MATLAB code for DataLog.fig
%      DATALOG, by itself, creates a new DATALOG or raises the existing
%      singleton*.
%
%      H = DATALOG returns the handle to a new DATALOG or the handle to
%      the existing singleton*.
%
%      DATALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATALOG.M with the given input arguments.
%
%      DATALOG('Property','Value',...) creates a new DATALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataLog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataLog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataLog

% Last Modified by GUIDE v2.5 28-Mar-2017 21:14:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataLog_OpeningFcn, ...
                   'gui_OutputFcn',  @DataLog_OutputFcn, ...
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


% --- Executes just before DataLog is made visible.
function DataLog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataLog (see VARARGIN)

% Choose default command line output for DataLog
handles.output = hObject;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataLog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataLog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton1.

edit=get(handles.pushbutton1, 'Value'); 
if edit==1
  close('DataLog');
  run Patientnumber; 
end


% --- Executes on button press in plotdata.
function plotdata_Callback(hObject, eventdata, handles)
% hObject    handle to plotdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.fileName = getappdata(0, 'fileName'); 

a = xlsread(handles.fileName);

minute = a(:,1); %time in minutes
BR = a(:,2); %breathing rate
HR = a(:,3); %heart rate


plot(minute, BR, 'r', minute, HR, 'b');
title('Subject Vitals');
xlabel('Time of Day');
datetick('x','keepticks', 'keeplimits'); 
ylabel('Breaths per Minute and Beats per Minute');

legend('Breathing Rate', 'Heart Rate');




guidata(hObject, handles);
