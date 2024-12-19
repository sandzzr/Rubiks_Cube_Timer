function varargout = timmmer(varargin)
% TIMMMER MATLAB code for timmmer.fig
%      TIMMMER, by itself, creates a new TIMMMER or raises the existing
%      singleton*.
%
%      H = TIMMMER returns the handle to a new TIMMMER or the handle to
%      the existing singleton*.
%
%      TIMMMER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIMMMER.M with the given input arguments.
%
%      TIMMMER('Property','Value',...) creates a new TIMMMER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before timmmer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to timmmer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help timmmer

% Last Modified by GUIDE v2.5 21-Apr-2022 08:18:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @timmmer_OpeningFcn, ...
                   'gui_OutputFcn',  @timmmer_OutputFcn, ...
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


% --- Executes just before timmmer is made visible.
function timmmer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to timmmer (see VARARGIN)

% Choose default command line output for timmmer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes timmmer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = timmmer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2
var = get(hObject,'Value');
if var ==1  
      c = clock;
        global a h s m
        a=0;
        s=0;
        m=0;
        
        while a==0
            c1 = clock;
            if c1(5)~=c(5)
              s = c1(6)-c(6)+60;
              m=m+1;
              c(5)= c1(5);
            else 
              s = c1(6)-c(6)+60*m;
            end
           A(1)= floor(s/3600);
           A(2)= floor((s-A(1)*3600)/60);
           A(3)=(s-A(1)*3600-A(2)*60);
           set(handles.edit1,'string',[num2str(A(1),'%02.0f'),':',num2str(A(2),'%02.0f'),':',num2str(A(3),'%02.02f')]);
           pause (0.01);
       end
        axes(handles.axes9)
        d = imread('left.png');
        imshow(d);
        
        e = imread('right.png');
        axes(handles.axes10)
        imshow(e);
else
        
        global a 
        a= 1;

        %for generating the scrambles
        dirn = [" ", "'", "2"];
        move = ["F", "B", "R", "L", "U", "D"];
        sd = datasample(dirn,16);
        sm = datasample(move,16);
        for i=2:length(sm)
            if sm(i)==sm(i-1)
                sm(i)=sm(randi(length(sm)));
            end
        end
        scr = append(sm,sd);
        set(handles.text15,'string',scr);
        
        
        %Shifting Time data
        ti10= get (handles.t9,'string');
        set(handles.t10,'string',ti10);

        ti9= get (handles.t8,'string');
        set(handles.t9,'string',ti9);

        ti8= get (handles.t7,'string');
        set(handles.t8,'string',ti8);

        ti7= get (handles.t6,'string');
        set(handles.t7,'string',ti7);

        ti6= get (handles.t5,'string');
        set(handles.t6,'string',ti6);

        ti5= get (handles.t4,'string');
        set(handles.t5,'string',ti5);

        ti4= get (handles.t3,'string');
        set(handles.t4,'string',ti4); 

        ti3= get (handles.t2,'string');
        set(handles.t3,'string',ti3); 

        ti2= get (handles.t1,'string');
        set(handles.t2,'string',ti2);

        ti1= get (handles.edit1,'string');
        set(handles.t1,'string',ti1);
        
        
        %extracting seconds minute and hours in string form and converting
        %to numeric form for further operation
        
        hrs1 = str2double(ti1([1,2]));
        min1 = str2double(ti1([4,5]));
        sec1 = str2double(ti1(7:strlength(ti1)));

        hrs2 = str2double(ti2([1,2]));
        min2 = str2double(ti2([4,5]));
        sec2 = str2double(ti2(7:strlength(ti2)));       

        hrs3 = str2double(ti3([1,2]));
        min3 = str2double(ti3([4,5]));
        sec3 = str2double(ti3(7:strlength(ti3)));
        
        hrs4 = str2double(ti4([1,2]));
        min4 = str2double(ti4([4,5]));
        sec4 = str2double(ti4(7:strlength(ti4)));
        
        hrs5 = str2double(ti5([1,2]));
        min5 = str2double(ti5([4,5]));
        sec5 = str2double(ti5(7:strlength(ti5)));

        hrs6 = str2double(ti6([1,2]));
        min6 = str2double(ti6([4,5]));
        sec6 = str2double(ti6(7:strlength(ti6)));
        
        hrs7 = str2double(ti7([1,2]));
        min7 = str2double(ti7([4,5]));
        sec7 = str2double(ti7(7:strlength(ti7)));
        
        hrs8 = str2double(ti8([1,2]));
        min8 = str2double(ti8([4,5]));
        sec8 = str2double(ti8(7:strlength(ti8)));
        
        hrs9 = str2double(ti9([1,2]));
        min9 = str2double(ti9([4,5]));
        sec9 = str2double(ti9(7:strlength(ti9)));
        
        hrs10 = str2double(ti10([1,2]));
        min10 = str2double(ti10([4,5]));
        sec10 = str2double(ti10(7:strlength(ti10)));
        
        
        
        %To convert time to number and perform operations by transferring the data
        %to a vector ti.
        ti=zeros(1,10);
        ts1= sec1+min1*60+hrs1*3600;
        ts2= sec2+min2*60+hrs2*3600;
        ts3= sec3+min3*60+hrs3*3600;
        ts4= sec4+min4*60+hrs4*3600;
        ts5= sec5+min5*60+hrs5*3600;
        ts6= sec6+min6*60+hrs6*3600;
        ts7= sec7+min7*60+hrs7*3600;
        ts8= sec8+min8*60+hrs8*3600;
        ts9= sec9+min9*60+hrs9*3600;
        ts10= sec10+min10*60+hrs10*3600;    
        
        ti= [ts1, ts2 ,ts3, ts4, ts5, ts6, ts7, ts8, ts9, ts10];

      
        %Showing the data in stastics
        set(handles.Best,'string',strcat('Best                           :',num2str(min(ti),'%0.2f')));
        set(handles.worst,'string',strcat('Worst                         :',num2str(max(ti),'%0.2f')));
        set(handles.mean,'string',strcat('Average of 10            :',num2str(mean(ti),'%0.2f')));
        set(handles.median,'string',strcat('Median of 10             :',num2str(median(ti),'%0.2f')));
        set(handles.stddev,'string',strcat('Std Deviation of 10   :',num2str(std(ti),'%0.2f')));
        %set(handles.mean,'string',strcat('Average of 5          :',num2str(mean( ti([1:5])),'%0.2f')));
              

        %plotting the graph on the axes
        x=[1,2,3,4,5,6,7,8,9,10];
        axes(handles.axes2);
        plot(x, ti,'k*-'); 
        xlabel(handles.axes2,'Number of Solves');
        ylabel(handles.axes2,'Time');

end


% --- Executes during object creation, after setting all properties.
function pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t1_Callback(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of t1 as text
%        str2double(get(hObject,'String')) returns contents of t1 as a double


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t4_Callback(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t4 as text
%        str2double(get(hObject,'String')) returns contents of t4 as a double


% --- Executes during object creation, after setting all properties.
function t4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t3_Callback(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t3 as text
%        str2double(get(hObject,'String')) returns contents of t3 as a double


% --- Executes during object creation, after setting all properties.
function t3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t2 as text
%        str2double(get(hObject,'String')) returns contents of t2 as a double


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t5_Callback(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t5 as text
%        str2double(get(hObject,'String')) returns contents of t5 as a double


% --- Executes during object creation, after setting all properties.
function t5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Best_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Best (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
function worst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to worst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function t6_Callback(hObject, eventdata, handles)
% hObject    handle to t6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t6 as text
%        str2double(get(hObject,'String')) returns contents of t6 as a double


% --- Executes during object creation, after setting all properties.
function t6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t9_Callback(hObject, eventdata, handles)
% hObject    handle to t9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t9 as text
%        str2double(get(hObject,'String')) returns contents of t9 as a double


% --- Executes during object creation, after setting all properties.
function t9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t8_Callback(hObject, eventdata, handles)
% hObject    handle to t8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t8 as text
%        str2double(get(hObject,'String')) returns contents of t8 as a double


% --- Executes during object creation, after setting all properties.
function t8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t7_Callback(hObject, eventdata, handles)
% hObject    handle to t7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t7 as text
%        str2double(get(hObject,'String')) returns contents of t7 as a double


% --- Executes during object creation, after setting all properties.
function t7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t10_Callback(hObject, eventdata, handles)
% hObject    handle to t10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t10 as text
%        str2double(get(hObject,'String')) returns contents of t10 as a double


% --- Executes during object creation, after setting all properties.
function t10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
