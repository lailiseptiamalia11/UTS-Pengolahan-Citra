function varargout = UTSPengolahanCitra(varargin)
% UTSPengolahanCitra MATLAB code for UTSPengolahanCitra.fig
%      UTSPengolahanCitra, by itself, creates a new UTSPengolahanCitra or raises the existing
%      singleton*.
%
%      H = UTSPengolahanCitra returns the handle to a new UTSPengolahanCitra or the handle to
%      the existing singleton*.
%
%      UTSPengolahanCitra('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTSPengolahanCitra.M with the given input arguments.
%
%      UTSPengolahanCitra('Property','Value',...) creates a new UTSPengolahanCitra or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UTSPengolahanCitra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UTSPengolahanCitra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UTSPengolahanCitra

% Last Modified by GUIDE v2.5 06-May-2021 17:58:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UTSPengolahanCitra_OpeningFcn, ...
                   'gui_OutputFcn',  @UTSPengolahanCitra_OutputFcn, ...
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


% --- Executes just before UTSPengolahanCitra is made visible.
function UTSPengolahanCitra_OpeningFcn(hObject, eventdata, handles, varargin)

%Menambah background
handles.output = hObject;
guidata(hObject, handles);
background=axes('unit', 'normalized', 'position', [0 0 1 1]);
bg=imread('like.png'); imagesc(bg);
set(background, 'handlevisibility','off','visible', 'off')


% --- Outputs from this function are returned to the command line.
function varargout = UTSPengolahanCitra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Mengambil gambar dan Menampilkan gambar di axes1
[filename,pathname]=uigetfile({'*.png';'*.jpeg';'*.jpg';'*.tif'});
setappdata(0, 'filename', filename);
img=imread(fullfile(pathname,filename));
axes(handles.axes1);
imshow(img);
setappdata(0,'img',img);
setappdata(0,'filename',img);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar awal
img=getappdata(0, 'img');
imshow(img);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menutup aplikasi 
close();

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar layer RED
img=getappdata(0,'img');
red=img;
red(:,:,2:3)=0;
setappdata(0, 'filename', red);
setappdata(0, 'ImRotation', red);
axes(handles.axes2);
imshow(red);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar layer GREEN
img=getappdata(0,'img');
green=img;
green(:,:,1)=0;
green(:,:,3)=0;
setappdata(0, 'filename', green);
setappdata(0, 'ImRotation', green);
axes(handles.axes2);
imshow(green);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar layer BLUE
img=getappdata(0,'img');
blue=img;
blue(:,:,1:2)=0;
setappdata(0, 'filename', blue);
setappdata(0, 'ImRotation', blue);
axes(handles.axes2);
imshow(blue);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar GRAYSCALE
img=getappdata(0,'img');
img_gray=rgb2gray(img);
setappdata(0, 'filename', img_gray);
axes(handles.axes2);
imshow(img_gray);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar BLACK & WHITE
img=getappdata(0, 'img');
img_bw=im2bw(img, .60);
axes(handles.axes2);
imshow(img_bw);
setappdata(0, 'filename', img_bw);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan HISTOGRAM
img=getappdata(0, 'img');
hist=img;
hist=rgb2gray(hist);
axes(handles.axes2);
imhist(hist);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar NEGATIF
img=getappdata(0,'img');
img_negatif=255-img;
axes(handles.axes2);
imshow(img_negatif);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Merotasi gambar dg kemiringan 90°
img=getappdata(0, 'img');
rotate=imrotate(img, 90);
axes(handles.axes2);
imshow(rotate);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menyimpan gambar di axes2
axes(handles.axes2);
[nama_file_simpan, path_simpan]=uiputfile({'*.jpg','(*.jpg)';
    '*.*','All File(*.*)'}, 'Save Picture');
nama = fullfile(path_simpan, nama_file_simpan);
F=getframe(handles.axes2);
W=frame2im(F);
imwrite(W, nama);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar dg SALT & PEPPER NOISE
img=getappdata(0, 'img');
noise=imnoise(img, 'salt & pepper');
axes(handles.axes2);
imshow(noise);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menampilkan gambar dengan GAUSSIAN NOISE
img=getappdata(0, 'img');
noise=imnoise(img, 'gaussian');
axes(handles.axes2);
imshow(noise);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Membalik gambar secara HORIZONTAL
Hor=getappdata(0, 'img');
Horiz=flipdim(Hor,2);
axes(handles.axes2);
imshow(Horiz);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Membalik gambar secara VERTICAL
Ver=getappdata(0, 'img');
Verti=flipdim(Ver,1);
axes(handles.axes2);
imshow(Verti);


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Meningkatkan kecerahan gambar
img=getappdata(0,'img');
img_bright=img+100;
axes(handles.axes2);
imshow(img_bright);



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



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


             
 
