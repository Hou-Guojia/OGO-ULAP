%% 
% This code is for the paper "Underwater image restoration using oblique gradient operator and light attenuation prior"
% 
% created by Jingyi Li (ljy_hqu@163.com) and Goujia Hou (hgjouc@126.com)
% 
% Copyright @ Jingyi Li and Guojia Hou, 2022. 
%This software is free for academic usage. 
%If you publish results obtained using this software, please cite our paper.
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
