function draw_lines(image, theta, rho, r, c, edge_detection)

[rows, cols] = size(image);
subplot(1,2,2), imshow(image), hold on
myString = sprintf('Lines detected for %s', edge_detection); 
title(myString);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%new

g = [];
t= [] ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:size(c,2)
    th = theta(c(i));
    rh = rho(r(i));
    m = -(cos(th)/sin(th));
    g(end+1) = m ;
    b = rh/sin(th);
    t(end+1) =  b;
    x = 1:cols;
if (g(i) > -1 && g(i) < 1 && t(i) < 50)
     t(i)
     g(i)
     m
     b
    plot(m*x+b, x);
end 
    hold on;
end


% 1.6700
%559.9936