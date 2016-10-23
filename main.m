clear; clc;

% in this project i used the canny and prewitt edge detectors for each
% image
% the value for the threshold is also changed to reflect the number of
% lines in the image

hough_main('im01.jpg', 'canny', 250);
hough_main('im01.jpg', 'prewitt', 250);

hough_main('im02.jpg', 'canny', 100);
hough_main('im02.jpg', 'prewitt', 100);

hough_main('im03.png', 'canny', 350);
hough_main('im03.png', 'prewitt', 350);