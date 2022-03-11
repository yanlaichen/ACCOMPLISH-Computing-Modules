%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Integration GUI MATLAB

% Creator: Dr. Zheng Chen, 
% Mathematics Department, University of Massachusetts Dartmouth 
% Contact: zchen2@umassd.edu
% This is a GUI MATLAB generated for ACCOMPLISH course module. 
% More details are in https://accomplish.sites.umassd.edu/course-modules/.

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function varargout = integration_GUI(varargin)
% INTEGRATION_GUI MATLAB code for integration_GUI.fig
%      INTEGRATION_GUI, by itself, creates a new INTEGRATION_GUI or raises the existing
%      singleton*.
%
%      H = INTEGRATION_GUI returns the handle to a new INTEGRATION_GUI or the handle to
%      the existing singleton*.
%
%      INTEGRATION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGRATION_GUI.M with the given input arguments.
%
%      INTEGRATION_GUI('Property','Value',...) creates a new INTEGRATION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before integration_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to integration_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help integration_GUI

% Last Modified by GUIDE v2.5 23-Aug-2021 15:57:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @integration_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @integration_GUI_OutputFcn, ...
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


% --- Executes just before integration_GUI is made visible.
function integration_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to integration_GUI (see VARARGIN)

% Choose default command line output for integration_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes integration_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = integration_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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




function edit_trap_Callback(hObject, eventdata, handles)
% hObject    handle to edit_trap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_trap as text
%        str2double(get(hObject,'String')) returns contents of edit_trap as a double


% --- Executes during object creation, after setting all properties.
function edit_trap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_trap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function functionyx_Callback(hObject, eventdata, handles)
% hObject    handle to functionyx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of functionyx as text
%        str2double(get(hObject,'String')) returns contents of functionyx as a double


% --- Executes during object creation, after setting all properties.
function functionyx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to functionyx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculate_pushbutton.
function Calculate_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x1 = str2double(get(handles.fromx,'String'));
x2 = str2double(get(handles.tox,'String'));

fx = vectorize(inline(get(handles.functionyx,'String')));
X = [x1:0.01:x2];
values = feval(fx,X);
maxi=max(values);
mini=(min(values));
if mini > 0
    mini = 0;
end
method = get(handles.integration_method,'Value');
axes(handles.plot);
cla(handles.plot);
set(handles.integration_result,'String','Result');

%% Monte Carlo
if method == 2     
     Nt = 100000;
     n = 0;
     dx = (x2-x1)/Nt;
     X = [x1:dx:x2];
     values = feval(fx,X);
     maxi = max(values);
     mini = min(values);
     
     vyminus = [];
     vxminus = [];
     vy = [];
     vx = [];
     
     rx = round(((x2-x1)*rand(Nt+1,1))/(dx)); 
     if mini<0 && maxi>0
        ry = mini + (maxi-mini).*rand(Nt+1,1);
     elseif maxi<0
        ry = mini + (0-mini).*rand(Nt+1,1);
     else
        ry = (maxi).*rand(Nt+1,1);
     end
     
     for i = 1:Nt
         if ry(i)<0
            if ry(i,1) >= (values(rx(i,1)+1))
                n = n-1;
                vyminus = [vyminus, ry(i,1)];
                vxminus = [vxminus, (rx(i,1)*(x2-x1)/Nt+x1)];
            end
         elseif ry(i,1) <= (values(rx(i,1)+1))
            n = n+1;
             vx = [vx, (rx(i,1)*(x2-x1)/Nt+x1)];
             vy = [vy, ry(i,1)];
         end
     end
     
     if mini <0 && maxi>0
        integral = (n/Nt)*(maxi-mini)*(x2-x1);
     elseif maxi<0
        integral = (n/Nt)*(0-mini)*(x2-x1);
     else
         integral = (n/Nt)*(maxi)*(x2-x1);
     end
     set(handles.integration_result,'String',integral);
end

%% Midpoint Rule
if method == 3
   
    % Code here to calculate the approximation of integration by Midpoint
    % Rule and assign the result to variable "integral"
    
    set(handles.integration_result,'String',integral);
end

%% Trapezoidal Rule
if method == 4
   
    % Code here to calculate the approximation of integration by Trapezoidal
    % Rule and assign the result to variable "integral"

    set(handles.integration_result,'String',integral);
end

%% Simpsons
if method == 5     
    
    % Code here to calculate the approximation of integration by Simpsons
    % Rule and assign the result to variable "integral"
    
    set(handles.integration_result,'String',integral);
end

%% Simpsons 3/8
if method == 6      
    
    % Code here to calculate the approximation of integration by Simpsons
    % 3/8 Rule and assign the result to variable "integral"
    
    set(handles.integration_result,'String',integral);
end

%% Composite Midpoint Rule
if method == 7     
    N = str2double(get(handles.edit_trap,'String')); % number of subintervals
    
    % Code here to calculate the approximation of integration by Composite 
    % Midpoint Rule and assign the result to variable "integral"
    
    set(handles.integration_result,'String',integral);
end


%% Composite Trapezoidal Rule
if method == 8
   N = str2double(get(handles.edit_trap,'String')); % number of subintervals
    
    % Code here to calculate the approximation of integration by Composite 
    % Trapezoidal Rule and assign the result to variable "integral"
    
   set(handles.integration_result,'String',integral);
end


%% Plotting
if mini > 0
        mini = 0;
end
if maxi < 0 
        maxi = 0;
end

if method == 2 % Monte Carlo
    plot(vxminus,vyminus,'o','MarkerSize',1,'MarkerEdgeColor','r','MarkerFaceColor','r'); hold on;
    plot(vx,vy,'o','MarkerSize',1,'MarkerEdgeColor','b','MarkerFaceColor','b'); hold on;
    plot(X,values,'LineWidth',2); ylim([mini,maxi]); hold off
elseif method == 3 % Midpoint Rule
    plot((x1+x2)/2,A,'o','MarkerEdgeColor','r','MarkerFaceColor','r'); hold on;
    xplot=linspace(x1,x2);
    yplot=A*ones(size(xplot));
    H1=area(xplot,yplot);hold on
    plot(X,values,'b','LineWidth',2); hold off; ylim([mini,maxi]);
elseif method == 4 % Trapezoidal Rule
    plot([x1,x2],[A,B],'o','MarkerEdgeColor','r','MarkerFaceColor','r'); hold on;
    xplot=[x1,x2];
    yplot=[A,B];
    H1=area(xplot,yplot);hold on
    plot(X,values,'b','LineWidth',2); hold off; ylim([mini,maxi]);
elseif method == 7 % Composite Midpoint Rule
    xx=linspace(x1,x2,N+1);
    yy=feval(fx,(xx(1:end-1)+xx(2:end))./2);
    xplot = [xx(1),repelem(xx(2:end-1),2),xx(end)];
    yplot = repelem(yy,2);
    plot((xx(1:end-1)+xx(2:end))./2,yy,'o','MarkerEdgeColor','r','MarkerFaceColor','r'); hold on;
    H1=area(xplot,yplot);hold on
    plot(X,values,'b','LineWidth',2); hold off; ylim([mini,maxi]);
elseif method == 8 % Composite Trapezoidal Rule
    xx=linspace(x1,x2,N+1);
    yy=feval(fx,xx);
    xplot = [xx(1),repelem(xx(2:end-1),2),xx(end)];
    yplot = [yy(1),repelem(yy(2:end-1),2),yy(end)];
    plot(xplot,yplot,'o','MarkerEdgeColor','r','MarkerFaceColor','r'); hold on;
    H1=area(xplot,yplot);hold on
    plot(X,values,'b','LineWidth',2); hold off; ylim([mini,maxi]);
else
    plot(X,values,'LineWidth',2); ylim([mini,maxi]);
end



function fromx_Callback(hObject, eventdata, handles)
% hObject    handle to fromx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fromx as text
%        str2double(get(hObject,'String')) returns contents of fromx as a double


% --- Executes during object creation, after setting all properties.
function fromx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fromx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tox_Callback(hObject, eventdata, handles)
% hObject    handle to tox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tox as text
%        str2double(get(hObject,'String')) returns contents of tox as a double


% --- Executes during object creation, after setting all properties.
function tox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in integration_method.
function integration_method_Callback(hObject, eventdata, handles)
% hObject    handle to integration_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns integration_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from integration_method
h = get(handles.integration_method,'Value');
if ismember(h, [7,8,9])
    set(handles.text_trap,'Visible','on');
    set(handles.edit_trap,'Visible','on');
else
    set(handles.text_trap,'Visible','off');
    set(handles.edit_trap,'Visible','off');
end

% --- Executes during object creation, after setting all properties.
function integration_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to integration_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
