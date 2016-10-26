function [rho, theta, hough_space] = hough_function(image, edge_detection)

theta_sample_frequency = 0.01;                                             
[x, y] = size(image);
rho_limit = norm([x y]);                                                
rho = (-rho_limit:1:rho_limit);
theta = (0:theta_sample_frequency:pi);
num_thetas = numel(theta);
num_rhos = numel(rho);

% NOTE : the rows represenrs the length and columns represents the angle  
hough_space = zeros(num_rhos, num_thetas);

% perform hough transform
for xi = 1:x
    for yj = 1:y
        
        %enter te loop f a whight pixel is detected 
        if image(xi, yj) == 1 
            
            %iterate through the theta vector 
            for theta_i = 1:num_thetas
                %store the value of theta in a separate variable 
                th = theta(theta_i);
                %This forumla generates the values of the posible
                %lines that passes through the pixel (xi,yi) remeber that 
                %the r is just the length of vector that is perpendicular
                %to the line passing through the pixel (the line we are
                %voting for )
                r  = xi * cos(th) + yj * sin(th);
                %Addin bias to prevent nigative values for the ndex of rho
                %in hough image
                rho_index = round(r+num_rhos/2);        
                % Accumulate a vote for every lne that passes throu htid
                % pixel, every line hase a creadt of votes stored in the
                % hoogh image inside a pixel with the adress of (rho_index, theta_i)
                %if a line passes in tow pixels, then that line accimulates
                %more votes in his own adress (rho_index, theta_i).
                hough_space(rho_index, theta_i) = ...
                hough_space(rho_index, theta_i) + 1;
            end
        end
    end
end
theta
rho
% display it
subplot(1,2,1), imshow(hough_space,[],'XData',theta,'YData',rho,...
            'InitialMagnification','fit');
xlabel('radian'), ylabel('\rho');
myString = sprintf('Hough Transform for %s', edge_detection); 
title(myString);
axis on, axis normal, hold on;