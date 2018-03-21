function varargout = Cube(varargin)
% CUBE MATLAB code for Cube.fig
%      CUBE, by itself, creates a new CUBE or raises the existing
%      singleton*.
%
%      H = CUBE returns the handle to a new CUBE or the handle to
%      the existing singleton*.
%
%      CUBE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUBE.M with the given input arguments.
%
%      CUBE('Property','Value',...) creates a new CUBE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cube_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cube_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cube

% Last Modified by GUIDE v2.5 24-Nov-2017 19:13:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cube_OpeningFcn, ...
                   'gui_OutputFcn',  @Cube_OutputFcn, ...
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


% --- Executes just before Cube is made visible.
function Cube_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cube (see VARARGIN)

% Choose default command line output for Cube
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cube wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Cube_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Calc.
function Calc_Callback(hObject, eventdata, handles)
% hObject    handle to Calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Mass = str2double(get(handles.Mass,'String'));
Force_I = str2double(get(handles.Energy_Initial,'String'));
Height = str2double(get(handles.Height,'String'));
Air_Density = str2double(get(handles.Air_Density,'String'));
Friction = str2double(get(handles.Friction,'String'));
Wind_Speed = str2double(get(handles.Wind_Speed,'String'));
Gravity = str2double(get(handles.Gravity,'String'));

cla

Area = Height^2 ;

Normal_Force = Mass * Gravity ;

Velocity_Initial = sqrt((2 * Force_I)/Mass) ; 
 
Drag_F = (1.05 * ((Air_Density  * (Velocity_Initial^2)) / 2) * Area)/1000;

if Wind_Speed >= 0
    Wind_F = -(.5 * Air_Density * (Wind_Speed^2) * Area) ; 
else
    Wind_F = .5 * Air_Density * (Wind_Speed^2) * Area;
end
    
FF = Friction*Normal_Force ;

Net_Force = FF + Drag_F + Wind_F ;

Acceleration = Net_Force/Mass;
 
Distance = (Velocity_Initial^2)/(2*Acceleration) ;

Results_Value1 = sprintf('Initial Velocity = %.02f (m/s)\n Wind Force = %.02f (N)\n Drag Force = %.02f (N)\n Friction = %.02f (N)\n Net Force = %.02f (N)\n Distance = %.02f (m)',Velocity_Initial,Wind_F,Drag_F,FF,Net_Force,Distance);
set(handles.Results, 'String',Results_Value1);

axes(handles.Graph); 
square = [0, Height, Height, 0;0, 0, Height, Height];
xmin = -5;
xmax = Distance + 5 + Height;
ymin = -5;
ymax = Height + 5;
axis equal
axis([xmin xmax ymin ymax])
hold on

t = linspace(0,Distance,100); 
trajectory = linspace(0,Distance,100);

h1 = fill(square(1,:) + t(1),square(2,:) + trajectory(1),'bl');
K = .01111;

for i = 2:100
    set(h1,'XData',square(1,:) + t(i),'YData',square(2,:));
    hold on;
    K = K * 1.015999;
    pause(K)
end

% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.Mass, 'String',''); 
set(handles.Energy_Initial, 'String','');
set(handles.Height, 'String','');
set(handles.Friction, 'String','');
set(handles.Wind_Speed, 'String','');
set(handles.Air_Density, 'String','');
set(handles.Gravity, 'String','');
Results_Value = sprintf('Initial Velocity = \n Wind Force = \n Drag Force = \n Friction = \n Net Force = \n Distance = ');
set(handles.Results, 'String',Results_Value);
cla
set(handles.Menu, 'Value',1);
set(handles.Math, 'String','');

% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

T = sprintf('This program is designed to aid in understanding the effects that MASS,\n INITIAL FORCE, HEIGHT, AIR DENSITY, FRICTION, WIND SPEED, and GRAVITY.\n\nThe input boxes in the OBJECT and EXTERNAL FACTORS EFFECTING \nTHE OBJECT tabs can be used to define the situation you want to test.\n\nThe Graph projects the distance the block will travel given the input values.\n\nIn the RESULTS tab the program will calculate INITIAL VELOCITY,\nWIND FORCE, DRAG FORCE, FRICTION FORCE, NET FORCE, AND DISTANCE.\n\nThe LEARN THE CALCULATIONS tab allows the user to understand \nhow the calculations are made. Selecting an option from the \ndrop-down menu will show the calculations for that topic.\n\nUNITS \nkg – Kilogram | N - Newton | m – Meter |\nkg/m^3 – Kilograms per meter cubed | m/s – Meter per second');

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 12);
insdati = msgbox(T);
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);


function Mass_Callback(hObject, eventdata, handles)
% hObject    handle to Mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mass as text
%        str2double(get(hObject,'String')) returns contents of Mass as a double

Mass = str2double(get(handles.Mass,'String'));
if isnan(Mass) || Mass < 0  || Mass == ''
    errordlg ('The value entered for MASS is not valid. Enter a positive number')
    set(handles.Mass, 'String',''); 
end

% --- Executes during object creation, after setting all properties.
function Mass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Energy_Initial_Callback(hObject, eventdata, handles)
% hObject    handle to Energy_Initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Energy_Initial as text
%        str2double(get(hObject,'String')) returns contents of Energy_Initial as a double

Force_I = str2double(get(handles.Energy_Initial,'String'));
if isnan(Force_I) || Force_I < 0 
    errordlg ('The value entered for INITIAL FORCE APPLIED TO OBJECT is not valid. Enter a positive number')
    set(handles.Energy_Initial, 'String','');
end

% --- Executes during object creation, after setting all properties.
function Energy_Initial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Energy_Initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Air_Density_Callback(hObject, eventdata, handles)
% hObject    handle to Air_Density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Air_Density as text
%        str2double(get(hObject,'String')) returns contents of Air_Density as a double

Air_Density = str2double(get(handles.Air_Density,'String'));
if isnan(Air_Density) 
    errordlg ('The value entered for AIR DENSITY is not valid. Enter a number')
    set(handles.Air_Density, 'String','');
end

% --- Executes during object creation, after setting all properties.
function Air_Density_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Air_Density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Friction_Callback(hObject, eventdata, handles)
% hObject    handle to Friction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Friction as text
%        str2double(get(hObject,'String')) returns contents of Friction as a double

Friction = str2double(get(handles.Friction,'String'));
if isnan(Friction)% || Friction < 0 
    errordlg ('The value entered for FRICTION is not valid. Enter a positive number')
    set(handles.Friction, 'String','');
end

% --- Executes during object creation, after setting all properties.
function Friction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Friction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wind_Speed_Callback(hObject, eventdata, handles)
% hObject    handle to Wind_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wind_Speed as text
%        str2double(get(hObject,'String')) returns contents of Wind_Speed as a double

Wind_Speed = str2double(get(handles.Wind_Speed,'String'));
if isnan(Wind_Speed)
    errordlg ('The value entered for AVERAGE WIND SPEED is not valid. Enter a number')
    set(handles.Wind_Speed, 'String','');
end

% --- Executes during object creation, after setting all properties.
function Wind_Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wind_Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Height_Callback(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height as text
%        str2double(get(hObject,'String')) returns contents of Height as a double

Height = str2double(get(handles.Height,'String'));
if isnan(Height) || Height < 0 
    errordlg ('The value entered for HEIGHT/WIDTH/LENGTH is not valid. Enter a positive number')
    set(handles.Height, 'String','');
end

% --- Executes during object creation, after setting all properties.
function Height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Gravity_Callback(hObject, eventdata, handles)
% hObject    handle to Gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gravity as text
%        str2double(get(hObject,'String')) returns contents of Gravity as a double

Gravity = str2double(get(handles.Gravity,'String'));
if isnan(Gravity) || Gravity < 0 
    errordlg ('The value entered for GRAVITY is not valid. Enter a positive number')
    set(handles.Gravity, 'String','');
end  

% --- Executes during object creation, after setting all properties.
function Gravity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Menu.
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menu

Mass = str2double(get(handles.Mass,'String'));
Force_I = str2double(get(handles.Energy_Initial,'String'));
Height = str2double(get(handles.Height,'String'));
Air_Density = str2double(get(handles.Air_Density,'String'));
Friction = str2double(get(handles.Friction,'String'));
Wind_Speed = str2double(get(handles.Wind_Speed,'String'));
Gravity = str2double(get(handles.Gravity,'String'));

Area = Height^2 ;

Normal_Force = Mass * Gravity ;

Velocity_Initial = sqrt((2 * Force_I)/Mass) ; 
 
Drag_F = (1.05 * ((Air_Density  * (Velocity_Initial^2)) / 2) * Area)/1000;

Wind_F = .5 * Air_Density * (Wind_Speed^2) * Area ; 

FF = Friction*Normal_Force ;

Net_Force = FF + Drag_F + Wind_F ;

Acceleration = Net_Force/Mass;
 
Distance = (Velocity_Initial^2)/(2*Acceleration) ;

Results_Value1 = sprintf('Initial Velocity = %.02f (m/s)\n Wind Force = %.02f (N)\n Drag Force = %.02f (N)\n Friction = %.02f (N)\n Net Force = %.02f (N)\n Distance = %.02f (m)',Velocity_Initial,Wind_F,Drag_F,FF,Net_Force,Distance);
set(handles.Results, 'String',Results_Value1);

menu_choice = get(handles.Menu, 'Value');  
switch menu_choice
    case 1
        Results1 = sprintf('');
        set(handles.Math, 'String',Results1);
    case 2
        Results1 = sprintf('In order to calcuate Initial Velocity we use the formula \n\n          (    2 * Initial Force      ) \n  sqrt  ( --------------------------- )      = Initial Velocity\n          (            Mass            )\n\nUsing the values entered and caluclated we see that\n\n sqrt((2 * %.02f (N)) / %.02f (kg)) = %.02f (m/s)',Force_I,Mass,Velocity_Initial);
        set(handles.Math, 'String',Results1);     
    case 3
        Results1 = sprintf('In order to calculate the effect that wind has on the objects motion we use the formula\n Air Density * (Wind Speed^2) * Area \n-------------------------------------------------------  = Wind Force\n                         2\nUsing the values entered and caluclated we see that\n( %.02f (kg/m^3) * (%.02f (m/s) ^2) * %.02f (m^2) ) / 2  = %.02f (N)\nWhen calculating the force of wind it is important to know the dircection of the wind. In this case positive winds will push the block forward, negative values will push against the block.',Air_Density,Wind_Speed,Area,Wind_F);
        set(handles.Math, 'String',Results1);       
    case 4
        Results1 = sprintf('In order to calculate the Drag force we use the formula\n\n                      Air Density * (Initial Velocity^2)\n1.05 * Area * -------------------------------------------------  = Drag Force\n                                         2\n------------------------------------------------------------------\n                                  1000\n\nUsing the values entered and caluclated we see that\n\n ( 1.05 * %.02f (m^2) * ((%.02f (kg/m^3) * (%.02f (m/s) ^2)) / 2) ) / 1000 = %.02f (N)',Area,Air_Density,Velocity_Initial,Drag_F);
        set(handles.Math, 'String',Results1);
    case 5
        Results1 = sprintf('In order to calculate the Friction force we use the formula\n\n (Friction) * (Mass * Gravity) = Friction Force\n\nUsing the values entered and caluclated we see that\n\n %.02f * (%.02f (kg) *  %.02f (m/s) ) = %.02f (N)',Friction,Mass,Gravity,FF);
        set(handles.Math, 'String',Results1);       
    case 6
        Results1 = sprintf('In order to calculate the Net forces on the object we use the formula\n\nFriction Force + Drag Force + Wind Force = Net Force\n\nUsing the values entered and caluclated we see that\n\n %.02f + %.02f + %.02f = %.02f (N)',FF,Drag_F,Wind_F,Net_Force);
        set(handles.Math, 'String',Results1);
    case 7
        Results1 = sprintf('In order to calculate the total distance traveled we use the formula\n\n       (Initial Velocity^2)\n---------------------------------------- = Distance\n  (2 * (Net Force / Mass))\n\nUsing the values entered and caluclated we see that\n\n (%.02f (m/s) ^2) / (2 * (%.02f (N) / %.02f (kg))) = %.02f (m)',Velocity_Initial,Net_Force,Mass,Distance);
        set(handles.Math, 'String',Results1);
end


% --- Executes during object creation, after setting all properties.
function Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DensityEx.
function DensityEx_Callback(hObject, eventdata, handles)
% hObject    handle to DensityEx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Xf = sprintf('Here is a list of the more common Gases your \nobject could be moving through,select one to be use.');

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 14);
X = menu(Xf,'Air (1.205)','Carbon Dioxide (1.842)','Carbon Monoxide (1.165)','Chlorine (2.994)','Helium (0.1664)','Hydrogen (0.0899)','Methane (0.668)','Neon (0.8999)','Nitrogen (1.165)','Oxygen (1.331)');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);


if X == 1
    set(handles.Air_Density, 'String',1.205);
elseif X == 2 
    set(handles.Air_Density, 'String',1.842);
elseif X == 3 
    set(handles.Air_Density, 'String',1.165);
elseif X == 4 
    set(handles.Air_Density, 'String',2.994);
elseif X == 5    
    set(handles.Air_Density, 'String',0.1664);
elseif X == 6
    set(handles.Air_Density, 'String',0.0899);
elseif X == 7    
    set(handles.Air_Density, 'String',0.668);
elseif X == 8   
    set(handles.Air_Density, 'String',0.899);
elseif X == 9 
    set(handles.Air_Density, 'String',1.165);
elseif X == 10 
    set(handles.Air_Density, 'String',1.331);
end    
% --- Executes on button press in FrictionEx.
function FrictionEx_Callback(hObject, eventdata, handles)
% hObject    handle to FrictionEx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
Zf = sprintf('Here is a list of the more common Frictions your \nobject could be experienceing,select one to be use.');

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 14);
Z = menu(Zf,'Car tire on Aphalt (0.72)','Diamond on Metal(0.10)','Glass on Glass (0.9)','Glass on Metal (0.5)','Ice on Ice (0.02)','Ice on Steel (0.03)','Iron on Iron (1.0)','Leather on Wood (0.3)','Oak on Oak (0.62)','Skin on Metal (0.8)');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);

if Z == 1
    set(handles.Friction, 'String',0.72);
elseif Z == 2 
    set(handles.Friction, 'String',0.10);
elseif Z == 3 
    set(handles.Friction, 'String',0.9);
elseif Z == 4 
    set(handles.Friction, 'String',0.5);
elseif Z == 5    
    set(handles.Friction, 'String',0.02);
elseif Z == 6
    set(handles.Friction, 'String',0.03);
elseif Z == 7    
    set(handles.Friction, 'String',1.0);
elseif Z == 8   
    set(handles.Friction, 'String',0.3);
elseif Z == 9 
    set(handles.Friction, 'String',0.62);
elseif Z == 10 
    set(handles.Friction, 'String',0.8);
end 

% --- Executes on button press in GravityEx.
function GravityEx_Callback(hObject, eventdata, handles)
% hObject    handle to GravityEx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Yf = sprintf('Here is a list of the more common Gravities your \nobject could be moving through,select one to be use.');

UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
set(0, 'DefaultUIControlFontSize', 14);
Y = menu(Yf,'Sun (274)','Jupiter (24.92)','Neptune (11.15)','Saturn (10.44)','Earth (9.81)','Uranus / Venus (8.87)','Mars / Mercury (3.705)','Moon (1.62)','Pluto (0.58)');
set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);

if Y == 1
    set(handles.Gravity, 'String',274);
elseif Y == 2 
    set(handles.Gravity, 'String',24.92);
elseif Y == 3 
    set(handles.Gravity, 'String',11.15);
elseif Y == 4 
    set(handles.Gravity, 'String',10.44);
elseif Y == 5    
    set(handles.Gravity, 'String',9.81);
elseif Y == 6
    set(handles.Gravity, 'String',8.87);
elseif Y == 7    
    set(handles.Gravity, 'String',3.705);
elseif Y == 8   
    set(handles.Gravity, 'String',1.62);
elseif Y == 9 
    set(handles.Gravity, 'String',0.58);
end  
