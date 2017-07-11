function varargout = Parent_Info_Old(varargin)
% PARENT_INFO_OLD MATLAB code for Parent_Info_Old.fig
%      PARENT_INFO_OLD, by itself, creates a new PARENT_INFO_OLD or raises the existing
%      singleton*.
%
%      H = PARENT_INFO_OLD returns the handle to a new PARENT_INFO_OLD or the handle to
%      the existing singleton*.
%
%      PARENT_INFO_OLD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARENT_INFO_OLD.M with the given input arguments.
%
%      PARENT_INFO_OLD('Property','Value',...) creates a new PARENT_INFO_OLD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Parent_Info_Old_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Parent_Info_Old_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Parent_Info_Old

% Last Modified by GUIDE v2.5 02-Apr-2017 17:38:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Parent_Info_Old_OpeningFcn, ...
                   'gui_OutputFcn',  @Parent_Info_Old_OutputFcn, ...
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


% --- Executes just before Parent_Info_Old is made visible.
function Parent_Info_Old_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Parent_Info_Old (see VARARGIN)

% Choose default command line output for Parent_Info_Old
handles.output = hObject;

%%Need to get the date, meds, and type input
handles.date=getappdata(0,'date');
date=handles.date;
handles.meds=getappdata(0,'meds');
meds=handles.meds;
handles.type=getappdata(0,'type');
type=handles.type;
set(handles.text3,'String',date); %Date
set(handles.text7,'String',meds); %Meds
set(handles.text9,'String',type); %Type


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Parent_Info_Old wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Parent_Info_Old_OutputFcn(hObject, eventdata, handles) 
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
edit=get(handles.pushbutton1, 'Value');

%%Gets the value from date selection
handles.date=getappdata(0,'date');
date=handles.date
handles.date=date
setappdata(0,'date', handles.date);
guidata(hObject, handles);

if edit==1
  close('Parent_Info_Old');
  run('Parent_Info_New') 
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
returnbut=get(handles.pushbutton2, 'Value'); 

if returnbut==1
  close('Parent_Info_Old');
  run('Patientnumber') 
end




