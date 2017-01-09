function draw_lines(image, theta, rho, r, c, edge_detection)


% take the sze of the gray image 
[row, col] = size(image);

% Devide the widow into 2 rows and 1 cloumn and plot the gray image 
%and by putting (x,x,1) the image will be plotted at the top ,hld on 
% is used to overlay the plote of the detected lines.
subplot(2,1,1), imshow(image), hold on 
 
% s is a text variable that will take the value of edge_detection
myString = sprintf('Lines detected for %s', edge_detection); 

%print the title. 
title(myString);

for i = 1:size(c,2) %  size(c,2) takes only the nuber of columns 
    % thýs ýs the theta provýded by the functýon parameter
    th = theta(c(i)); 
    % thýs ýs the theta provýded by the functýon parameter
    rh = rho(r(i)); 
    % calculate the slope 
    m = -(cos(th)/sin(th));
    % compute the bias 
    b = rh/sin(th);
    % itirate over the x axis of the gary image so the the scal of the line
    % will match the scale of the image.
    x = 1:col;
    plot(m*x+b, x);
    hold on;
end
