clear; clc;

% in this project i used the canny and prewitt edge detectors for each
% image
% the value for the threshold is also changed to reflect the number of
% lines in the image

hough_main('im01.jpg', 'canny', 400);
hough_main('im01.jpg', 'prewitt', 250);

hough_main('im02.jpg', 'canny', 90);
hough_main('im02.jpg', 'prewitt', 90); 

hough_main('im03.png', 'canny', 370);
hough_main('im03.png', 'prewitt', 370);