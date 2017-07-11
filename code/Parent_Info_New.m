function varargout = Parent_Info_New(varargin)
% PARENT_INFO_NEW MATLAB code for Parent_Info_New.fig
%      PARENT_INFO_NEW, by itself, creates a new PARENT_INFO_NEW or raises the existing
%      singleton*.
%
%      H = PARENT_INFO_NEW returns the handle to a new PARENT_INFO_NEW or the handle to
%      the existing singleton*.
%
%      PARENT_INFO_NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARENT_INFO_NEW.M with the given input arguments.
%
%      PARENT_INFO_NEW('Property','Value',...) creates a new PARENT_INFO_NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Parent_Info_New_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Parent_Info_New_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Parent_Info_New

% Last Modified by GUIDE v2.5 24-Apr-2017 19:58:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Parent_Info_New_OpeningFcn, ...
                   'gui_OutputFcn',  @Parent_Info_New_OutputFcn, ...
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


% --- Executes just before Parent_Info_New is made visible.
function Parent_Info_New_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Parent_Info_New (see VARARGIN)

% Choose default command line output for Parent_Info_New
 handles.output = hObject;

%%Set opening screen 
set(handles.edit4,'String','MM');
set(handles.edit5,'String','DD');
set(handles.edit6,'String','YYYY');
%%Ok button not available
handles.EditOk=false(1,3);
set(handles.pushbutton1,'Enable', 'off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Parent_Info_New wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Parent_Info_New_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

%%Get the name of the medication
meds=get(handles.edit2, 'string');
%%Saves the value for month to be available of other GUI pages
handles.meds=meds;
setappdata(0, 'meds', handles.meds);
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



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save=get(handles.pushbutton1, 'Value'); 

%%Gets the value from date selection
handles.date=getappdata(0,'date');
date=handles.date
handles.date=date
setappdata(0,'date', handles.date);
guidata(hObject, handles);

if save==1
  close('Parent_Info_New');
  run('Parent_Info_Old') 
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
returnbut=get(handles.pushbutton2, 'Value'); 
if returnbut==1
  close('Parent_Info_New');
  run('Patientnumber')  
end



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


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

 severity = [cellstr('Severe') ; cellstr('Moderate'); cellstr('Mild')];

 % load the cell array into the listbox (assumed to be named listbox2)
 set(handles.listbox2,'String',severity);
 attacktype=get(hObject, 'Value');

 %%Determine Type of Attack
 if attacktype==1
     type='Severe'
 elseif attacktype==2
     type='Moderate'
 elseif attacktype==3
     type='Mild'
 end  
handles.type=type;
setappdata(0,'type', handles.type);
guidata(hObject, handles);
 

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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

%%Saves the string for the month
month=get(hObject,'String');
%%Checks that the input for month is a number
if isempty(str2num(month))
    set(hObject,'string','0');
    warndlg('Input must be numerical'); %%Displays a warning if not a number
end
%%Determine the number for month is 1 to 12
if (str2num(month))<13 && (str2num(month))>=1
    handles.EditOk(1)=true;
else
    handles.EditOk(1)=false;
    set(hObject,'string','0');
    warndlg('Input must be 1 to 12'); %%Displays a warning if not 1 to 12
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton1, 'Enable', 'on');
end
%%Saves the value for month to be available of other GUI pages
handles.month=month;
setappdata(0, 'month', handles.month);
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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

%%Saves the String for day
day=get(hObject,'String');
%%Determines if the value for day is a number
if isempty(str2num(day))
    set(hObject,'string','0');
    warndlg('Input must be numerical'); %%Display warning that input is not a number
end
%%Determine the length is within a typical month
if (str2num(day))<32 && (str2num(day))>=1
    handles.EditOk(2)=true;
else
    handles.EditOk(2)=false;
    set(hObject,'string','0');
    warndlg('Input must be 1 to 31'); %%Display warning that the date is not 1 to 31
end
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton1, 'Enable', 'on');
end
%%Sets day to be available to other GUI pages
handles.day=day;
setappdata(0,'day', handles.day);
guidata(hObject, handles);



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

%%Saves the string for the year
year=get(hObject,'String');
%%Ensures that the string is a numerical value
if isempty(str2num(year))
    set(hObject,'string','0');
    warndlg('Input must be numerical'); %%Warning if it isn't a number
end
%%Determine the length of the numbers
if (str2num(year))>2016 %%Assume this product is available starting 2017
    handles.EditOk(3)=true;
else
    handles.EditOk(3)=false;
    set(hObject,'string','0');
    warndlg('Input must be 2017 or later'); %%Warning if it isn't the right date
end
%%Set the year to transfer between GUI pages
handles.year=year;
setappdata(0,'year', handles.year);
%%Check Availability to Press Ok
if all(handles.EditOk)
    set(handles.pushbutton1, 'Enable', 'on');
    handles.month=getappdata(0,'month');
    month=handles.month;
    handles.day=getappdata(0,'day');
    day=handles.day;
    %%Creates a single string of the date
    date = strcat(month,'/',day, '/', year);
    handles.date=date;
    setappdata(0,'date', handles.date);
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
