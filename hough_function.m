function [rho, theta, hough_space] = hough_function(image, edge_detection)

theta_sample_frequency = 0.01;                                             
[x, y] = size(image);
rho_limit = norm([x y]);                                                
rho = (-rho_limit:1:rho_limit);
theta = (0:theta_sample_frequency:pi);
num_thetas = numel(theta);
num_rhos = numel(rho);
hough_space = zeros(num_rhos, num_thetas);

% perform hough transform
for xi = 1:x
    for yj = 1:y
        if image(xi, yj) == 1 
            for theta_index = 1:num_thetas
                th = theta(theta_index);
                r  = xi * cos(th) + yj * sin(th);
                rho_index = round(r + num_rhos/2);                      
                hough_space(rho_index, theta_index) = ...
                     hough_space(rho_index, theta_index) + 1;
            end
        end
    end
end

% display it
subplot(1,2,1), imshow(hough_space,[],'XData',theta,'YData',rho,...
            'InitialMagnification','fit');
xlabel('radian'), ylabel('\rho');
myString = sprintf('Hough Transform for %s', edge_detection); 
title(myString);
axis on, axis normal, hold on;