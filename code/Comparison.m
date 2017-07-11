function varargout = Comparison(varargin)
% COMPARISON MATLAB code for Comparison.fig
%      COMPARISON, by itself, creates a new COMPARISON or raises the existing
%      singleton*.
%
%      H = COMPARISON returns the handle to a new COMPARISON or the handle to
%      the existing singleton*.
%
%      COMPARISON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARISON.M with the given input arguments.
%
%      COMPARISON('Property','Value',...) creates a new COMPARISON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Comparison_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Comparison_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Comparison

% Last Modified by GUIDE v2.5 18-Apr-2017 23:58:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Comparison_OpeningFcn, ...
                   'gui_OutputFcn',  @Comparison_OutputFcn, ...
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


% --- Executes just before Comparison is made visible.
function Comparison_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Comparison (see VARARGIN)

% Choose default command line output for Comparison
handles.output = hObject;

handles.fileName = getappdata(0, 'fileName'); 
a = xlsread(handles.fileName);
minute = a(:,1); %time in minutes
BR = a(:,2); %breathing rate
HR = a(:,3); %heart rate

maxHR = max(HR);%Maximum HR
maxBR = max(BR);%Maximum BR
avgHR = mode(HR); %Find Avg HR
avgBR = mode(BR); %Find Avg BR

%%Determine threshold HR
i=1;
for b=1:size(HR)
    if HR(b)>avgHR
        peakHR(i)=HR(b);
        i=i+1;
        attackHR = min(peakHR);
        thresholdHR = attackHR - 1;
        set(handles.text9,'String',num2str(maxHR)); %Heart Rate during attack
        set(handles.text23,'String',num2str(thresholdHR)); %Heart rate threshold
    elseif HR(b)<avgHR
        peakHR(i)=HR(b);
        i=i+1;
        attackHR = min(peakHR);
        thresholdHR = attackHR + 1;
        set(handles.text9,'String',num2str(maxHR)); %Heart Rate during attack
        set(handles.text23,'String',num2str(thresholdHR)); %Heart rate threshold
    end
end

if HR(1:1439) == avgHR
    set(handles.text9,'String','None'); %Heart Rate during attack
    set(handles.text23,'String','None'); %Heart rate threshold
end

%%Determine BR threshold
i=1;
j=1;
for c=1:size(BR)
    if BR(c)> avgBR
        peakBR(i)=BR(c);
        i=i+1; 
        attackBR = min(peakBR);
        thresholdBR = attackBR - 1;
        set(handles.text13,'String',num2str(maxBR)); %Respiration Rate during attack
        set(handles.text30,'String',num2str(thresholdBR)); %Respiration Rate Threshold
    elseif BR(c)< avgBR
        peakBR(i)=BR(c);
        i=i+1; 
        attackBR = min(peakBR);
        thresholdBR = attackBR + 1;
        set(handles.text13,'String',num2str(maxBR)); %Respiration Rate during attack
        set(handles.text30,'String',num2str(thresholdBR)); %Respiration Rate Threshold
    elseif c~=1&&BR(c)< BR(c-1)
        numattacks=j; %%Calculate number of attacks
        j=j+1;
        set(handles.text19,'String',num2str(numattacks)); %Frequency of attacks per day
    elseif c~=1&&BR(c)> BR(c-1)
        numattacks=j; %%Calculate number of attacks
        j=j+1;
        set(handles.text19,'String',num2str(numattacks)); %Frequency of attacks per day
      end
end

if BR(1:1439) == avgBR
    set(handles.text13,'String','None'); %Respiration Rate during attack
    set(handles.text30,'String','None'); %Respiration Rate Threshold
    set(handles.text19,'String','None'); %Frequency of attacks per day
end

%%All of the text boxes are set to blank
set(handles.text10,'String','');
set(handles.text14,'String',''); 
set(handles.text20,'String','');
set(handles.text26,'String',''); 
set(handles.text31,'String',''); 

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Comparison wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Comparison_OutputFcn(hObject, eventdata, handles) 
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

returnbut=get(handles.pushbutton1, 'Value'); 

%%Determine if Return Button was pressed
if returnbut==1
  close('Comparison');
  run Patientnumber;
end


% --- Executes on button press in loadnewdata.
function loadnewdata_Callback(hObject, eventdata, handles)
% hObject    handle to loadnewdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.fileName2 = uigetfile('*.xlsx');
a = xlsread(handles.fileName2);
minute = a(:,1); %time in minutes
BR = a(:,2); %breathing rate
HR = a(:,3); %heart rate

maxHR = max(HR);
maxBR = max(BR);
avgHR = mode(HR); %Find Avg HR
avgBR = mode(BR); %Find Avg BR

%%Determine threshold HR
i=1;
for b=1:size(HR)
    if HR(b)>avgHR
        peakHR(i)=HR(b);
        i=i+1;
        attackHR = min(peakHR);
        thresholdHR = attackHR - 1;
        set(handles.text10,'String',num2str(maxHR)); %Heart Rate during attack
        set(handles.text26,'String',num2str(thresholdHR)); %Heart rate threshold
    elseif HR(b)<avgHR
        peakHR(i)=HR(b);
        i=i+1;
        attackHR = min(peakHR);
        thresholdHR = attackHR + 1;
        set(handles.text10,'String',num2str(maxHR)); %Heart Rate during attack
        set(handles.text26,'String',num2str(thresholdHR)); %Heart rate threshold
    end
end

if HR(1:1439) == avgHR
    set(handles.text10,'String','None'); %Heart Rate during attack
    set(handles.text26,'String','None'); %Heart rate threshold
end

%%Determine BR threshold
i=1;
j=1;
for c=1:size(BR)
    if BR(c)> avgBR
        peakBR(i)=BR(c);
        i=i+1; 
        attackBR = min(peakBR);
        thresholdBR = attackBR - 1;
        set(handles.text14,'String',num2str(maxBR)); %Respiration Rate during attack
        set(handles.text31,'String',num2str(thresholdBR)); %Respiration Rate Threshold
    elseif BR(c)< avgBR
        peakBR(i)=BR(c);
        i=i+1; 
        attackBR = min(peakBR);
        thresholdBR = attackBR + 1;
        set(handles.text14,'String',num2str(maxBR)); %Respiration Rate during attack
        set(handles.text31,'String',num2str(thresholdBR)); %Respiration Rate Threshold
    elseif c~=1&&BR(c)< BR(c-1)
        numattacks=j; %%Calculate number of attacks
        j=j+1;
        set(handles.text20,'String',num2str(numattacks)); %Frequency of attacks per day
    elseif c~=1&&BR(c)> BR(c-1)
        numattacks=j; %%Calculate number of attacks
        j=j+1;
        set(handles.text20,'String',num2str(numattacks)); %Frequency of attacks per day
    end
end

if BR(1:1439) == avgBR
    set(handles.text14,'String','None'); %Respiration Rate during attack
    set(handles.text31,'String','None'); %Respiration Rate Threshold
    set(handles.text20,'String','None'); %Frequency of attacks per day
end

