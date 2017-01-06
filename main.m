clear; clc; close all;


hough_main('im01.jpg', 'canny', 300);


hough_main('im02.jpg', 'canny', 90);


hough_main('im03.png', 'canny', 370);

%testing the function for mechanical tool detection 
hough_main('sample4.jpg', 'canny', 50);

