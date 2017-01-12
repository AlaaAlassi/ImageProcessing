clear;close all;clc;
%dont need: horproj, notevalue

img = im2double(imread('aa.png'));




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% line detecton %%%%%%%
 Orginalgray = rgb2gray(img);
    % Invert image
 BW = imcomplement(Orginalgray);
 edge = edge(BW, 'canny');
 [H,T,R] = hough(edge,'Theta',-90:0.1:89.9,'RhoResolution',1);

imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit')
        xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

% pay attention to 'NHoodSize' if it is large some lines with same fetures  will be consedered
% as one 
 P  = houghpeaks(H,100,'threshold',0.5*max(H(:)), 'NHoodSize',[13  315]);
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(edge,T,R,P,'FillGap',100,'MinLength',100);


BW = bwmorph(imcomplement(BW),'clean',Inf);
BW=imcomplement(BW);
figure, imshow(Orginalgray), hold on
LinesHeight = [];
for k = 1:length(lines);
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   
   LinesHeight = [LinesHeight ; lines(k).point1(:,2)];
end


[centers, radii] = imfindcircles(imcomplement(BW),[2 30],'ObjectPolarity','dark');
hold on
h = viscircles(centers,radii); %centers(1),radii(1)


LinesHeight = sort(LinesHeight);
centersSorting = sortrows(centers);

%find the closest circle to left 
%IndecsFirstCircle= find(centers == min(centers(:,1))) 
%find the highest line

for k = 1:length(centersSorting);
    for m = 1:length(LinesHeight);
        A(m,k) =  LinesHeight(m) - centersSorting(k,2);
    end
    
     if abs(A(m,k)) >= 7 && abs(A(m,k)) <= 10
         k
        disp('c')  
     elseif abs(A(m,k)) >=1  && abs(A(m,k)) <= 3.5
         k
      disp('D') 
     end
     k
end







