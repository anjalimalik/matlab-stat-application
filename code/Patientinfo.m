function varargout = Patientinfo(varargin)
% PATIENTINFO MATLAB code for Patientinfo.fig
%      PATIENTINFO, by itself, creates a new PATIENTINFO or raises the existing
%      singleton*.
%
%      H = PATIENTINFO returns the handle to a new PATIENTINFO or the handle to
%      the existing singleton*.
%
%      PATIENTINFO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PATIENTINFO.M with the given input arguments.
%
%      PATIENTINFO('Property','Value',...) creates a new PATIENTINFO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Patientinfo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Patientinfo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Patientinfo

% Last Modified by GUIDE v2.5 10-Apr-2017 20:16:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Patientinfo_OpeningFcn, ...
                   'gui_OutputFcn',  @Patientinfo_OutputFcn, ...
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


% --- Executes just before Patientinfo is made visible.
function Patientinfo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Patientinfo (see VARARGIN)

% Choose default command line output for Patientinfo
handles.output = hObject;

%%Save button not available
handles.EditOk=false(1,5);
set(handles.pushbutton6,'Enable', 'off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Patientinfo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Patientinfo_OutputFcn(hObject, eventdata, handles) 
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
close Patientinfo;
run HomePage;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.Name = get(handles.edit1, 'String'); 

%%Determine if Name is filled out
if ~isempty(str2num(handles.Name))
    handles.EditOk(1)=false;
else
    handles.EditOk(1)=true;
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton6, 'Enable', 'on');
end
setappdata(0, 'Name', handles.Name);
guidata(hObject, handles);

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

age=get(hObject,'String');
%%Checks that the input for age is a number
if isempty(str2num(age))
    set(hObject,'string','0');
    warndlg('Input must be numerical'); %%Displays a warning if not a number
end
%%Determine the age is 5 to 12
if (str2num(age))<13 && (str2num(age))>=5
    handles.Age = age;
    handles.EditOk(2)=true;
else
    handles.EditOk(2)=false;
    set(hObject,'string','0');
    warndlg('User must be 5 to 12 years old'); %%Displays a warning if not 5 to 12
end

%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton6, 'Enable', 'on');
end

%set(handles.check, 'string', handles.Name);
setappdata(0, 'Age', handles.Age);
guidata(hObject, handles);

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
handles.Severity = get(handles.edit3, 'String'); 
if ~isempty(str2num(handles.Severity))
    handles.EditOk(4)=false;
else 
    handles.EditOk(4)=true;
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton6, 'Enable', 'on');
end
setappdata(0, 'Severity', handles.Severity);
guidata(hObject, handles);

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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.History = get(handles.edit4, 'String'); 

if ~isempty(str2num(handles.History))
    handles.EditOk(5)=false;
else 
    handles.EditOk(5)=true;
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton6, 'Enable', 'on');
end
setappdata(0, 'History', handles.History);
guidata(hObject, handles);

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


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

male=get(handles.radiobutton2, 'Value'); 

%%Determine if am is on
if male==1
    set(handles.radiobutton3,'Value', 0); %Turns off pm
    handles.EditOk(3)=true;
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton6, 'Enable', 'on');
end

handles.male = male;
setappdata(0, 'male', handles.male);
guidata(hObject, handles);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
female=get(handles.radiobutton3, 'Value'); 

%%Determine if am is on
if female==1
    set(handles.radiobutton2,'Value', 0); %Turns off pm
    handles.EditOk(3)=true;
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton6, 'Enable', 'on');
end

handles.female = female;
setappdata(0, 'female', handles.female);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function text10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientinfo;
run Parent_Info_New;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientinfo;
run Patientnumber;


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.asthma = get(handles.checkbox2,'Value');
setappdata(0, 'asthma', handles.asthma);
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Patientinfo;
run Patientprofilesaved;
