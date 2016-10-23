function draw_lines(image, theta, rho, r, c, edge_detection)

[rows, cols] = size(image);
subplot(1,2,2), imshow(image), hold on
myString = sprintf('Lines detected for %s', edge_detection); 
title(myString);

for i = 1:size(c,2)
    th = theta(c(i));
    rh = rho(r(i));
    m = -(cos(th)/sin(th));
    b = rh/sin(th);
    x = 1:cols;

    plot(m*x+b, x);

    hold on;
end