function hough_main(image, edge_detection, threshold)

figure
% read image, take greyscale and canny
I = imread(image);
I2 = rgb2gray(I);
I_edge = edge(I2, edge_detection);

% the implemented hough transform function
% and display it
[rho, theta, hough_matrix] = hough_function(I_edge, edge_detection);

% get the pixels for the peaks
[rows, columns] = get_hough_peaks(hough_matrix, threshold)

% draw the lines
draw_lines(I2, theta, rho, rows, columns, edge_detection);