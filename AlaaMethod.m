clear;close all;clc;
%dont need: horproj, notevalue

img = im2double(imread('aa.png'));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% line detecton %%%%%%%
 I = rgb2gray(img);
    % Invert image
 I = imcomplement(I);
 edge = edge(I, 'canny');
 [H,T,R] = hough(edge,'Theta',-90:0.01:89,'RhoResolution',0.9);

imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit')
        xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

 P  = houghpeaks(H,10,'threshold',0.2*max(H(:)));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(edge,T,R,P,'FillGap',100,'MinLength',50);
figure, imshow(I), hold on
max_len = 0;

for k = 1:length(lines);
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Determine the shortest distance between too lines 
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end





