function [angle]=Line_Fn(line);
hcamera=webcam;
clc;
clear all;
close all;

%%
I = imread('Line.jpg');
I= rgb2gray(I);
figure
imshow(I)
%%
A=max(max(I));
B=I>(A-65);
figure 
imshow(B)
%%
B= bwareaopen(B, 5);
B= imfill(B,'holes');
figure
imshow(B);
%%
stat = regionprops(B, I, {'Centroid','WeightedCentroid'});
figure
imshow(B)
hold all
numObj = size(stat);
for k = 1 : numObj
    plot(stat(k).WeightedCentroid(1), stat(k).WeightedCentroid(2), 'r*');
    plot(stat(k).Centroid(1), stat(k).Centroid(2), 'bo');
end
centroid=(stat.Centroid)
WC=stat.WeightedCentroid
[m,n]=size(B)
plot(n/2,m,'y*');
plot(n/2,m/2,'g*');
OA=(centroid-[n/2,m])
OB=([n/2,m/2]-[n/2,m])
angle= anglevec(OA,OB)/(2*pi/360)
hold off
%% checking for contour
p = zeros(2);
index=1;
for i=2:199
    for j=2:266
        sum = I(i,j) + I(i+1,j) + I(i,j-1) + I(i+1,j-1) + I(i,j+1) + I(i+1,j+1);
        if(index==1)
            if sum==5 || sum==4
            p(1,index) = i;
            p(2,index) = j;
            index=index+1;
            end
        end
        if(index==2)
            if sum==5 || sum==4
            p(1,index) = i;
            p(2,index) = j;
            index=index+1;
            end
        end  
   end
end
%%
