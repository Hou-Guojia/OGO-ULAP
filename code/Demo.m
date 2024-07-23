%% 
% This code is for the paper "Underwater image restoration using oblique gradient operator and light attenuation prior"
% Jingyi Li, Guojia Hou*, Guodong Wang
% Multimedia Tools and Applications (2023) 82:6625-6645
% https://doi.org/10.1007/s11042-022-13605-5
%This code is free for academic usage. 

%%
%This matlab code is tested on Windows 10 64bit with MATLAB 2016b.
%--------------------------------------------------------------------------------------------------------------
clear all;close all;clc
img_path='../images/test.png';
result_path='../images/test_result.png';

Iori=imread(img_path);
Igray=double(rgb2gray(Iori));
I=double(Iori)./255;

BL=BackgroundLight(I);

trans=TransmissionMaps(I,Igray,BL);
t0=0.1;

J=zeros(size(I));
for ind = 1:3
    J(:,:,ind) =BL(ind)+(I(:,:,ind)-BL(ind))./max(trans(:,:,ind),t0);
end
J(J < 0) = 0;
J(J > 1) = 1;
imshow([I,J]);
imwrite(J,result_path);
