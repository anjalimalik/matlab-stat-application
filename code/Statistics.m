function varargout = Statistics(varargin)
% STATISTICS MATLAB code for Statistics.fig
%      STATISTICS, by itself, creates a new STATISTICS or raises the existing
%      singleton*.
%
%      H = STATISTICS returns the handle to a new STATISTICS or the handle to
%      the existing singleton*.
%
%      STATISTICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATISTICS.M with the given input arguments.
%
%      STATISTICS('Property','Value',...) creates a new STATISTICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Statistics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Statistics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Statistics

% Last Modified by GUIDE v2.5 24-Apr-2017 20:32:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Statistics_OpeningFcn, ...
                   'gui_OutputFcn',  @Statistics_OutputFcn, ...
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


% --- Executes just before Statistics is made visible.
function Statistics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Statistics (see VARARGIN)

handles.fileName = getappdata(0, 'fileName'); 

a = xlsread(handles.fileName);
minute = a(:,1); %time in minutes
BR = a(:,2); %breathing rate
HR = a(:,3); %heart rate

maxBR = 25;
maxHR = 120;
avgHR = mode(HR); %Find Avg HR
avgBR = mode(BR); %Find Avg BR

%%Determine HR threshold
i=1;
for b=1:size(HR)
    if HR(b)>avgHR
        peakHR(i)=HR(b);
        i=i+1;
        attackHR = min(peakHR);
        thresholdHR = attackHR - 1;
        set(handles.text9,'String',num2str(thresholdHR)); %Heart rate threshold
    elseif HR(b)<avgHR
        peakHR(i)=HR(b);
        i=i+1;
        attackHR = min(peakHR);
        thresholdHR = attackHR + 1;
        set(handles.text9,'String',num2str(thresholdHR)); %Heart rate threshold
    end
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
        set(handles.text17,'String',num2str(thresholdBR)); %Respiration Rate Threshold
    elseif BR(c)< avgBR
        peakBR(i)=BR(c);
        i=i+1; 
        attackBR = min(peakBR);
        thresholdBR = attackBR + 1;
        set(handles.text17,'String',num2str(thresholdBR)); %Respiration Rate Threshold
    elseif c~=1&&BR(c)< BR(c-1)
        numattacks=j; %%Calculate number of attacks
        j=j+1;
        set(handles.text13,'String',num2str(numattacks)); %Frequency of attacks per day
        set(handles.text14,'string',num2str(numattacks)); %Sets Number of attacks weekly
        set(handles.text15,'string',num2str(numattacks)); %Sets Number of attacks monthly
    elseif c~=1&&BR(c)> BR(c-1)
        numattacks=j; %%Calculate number of attacks
        j=j+1;
        set(handles.text13,'String',num2str(numattacks)); %Frequency of attacks per day
        set(handles.text14,'string',num2str(numattacks)); %Sets Number of attacks weekly
        set(handles.text15,'string',num2str(numattacks)); %Sets Number of attacks monthly

    end
end

%Set the remaining text boxes
if HR(1:1439) == avgHR
    set(handles.text9,'String','None'); %Heart rate threshold
    set(handles.text17,'String','None'); %Respiration Rate Threshold
    set(handles.text13,'String','None'); %Frequency of attacks per day
    set(handles.text14,'string','None'); %Sets Number of attacks weekly
    set(handles.text15,'string','None'); %Sets Number of attacks monthly
    set(handles.text10,'string','None'); %Sets Average Heart Rate
    set(handles.text11,'string','None'); %Sets Average Respiration Rate
    set(handles.text13,'string','None'); %Sets Number of peaks per day
    set(handles.text14,'string','None'); %Sets Number of attacks weekly
    set(handles.text15,'string','None'); %Sets Number of attacks monthly
else
    set(handles.text10,'string',num2str(avgHR)); %Sets Average Heart Rate
    set(handles.text11,'string',num2str(avgBR)); %Sets Average Respiration Rate
    set(handles.text13,'string',num2str(numattacks)); %Sets Number of peaks per day
    set(handles.text14,'string',num2str(numattacks)); %Sets Number of attacks weekly
    set(handles.text15,'string',num2str(numattacks)); %Sets Number of attacks monthly
end

% Choose default command line output for HomePage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HomePage wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = Statistics_OutputFcn(hObject, eventdata, handles) 
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

%%Determine if Return button selected
if returnbut==1
  close('Statistics');
  run Patientnumber;
end
