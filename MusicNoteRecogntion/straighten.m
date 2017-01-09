function [ outputImage ] = straighten( inputImage )
    
    
    %Converts input to edges (I.E, binary)
    %I = rgb2gray(inputImage);
    BW = edge(inputImage, 'canny');

    
    BW = BW';
    % Hough transform, with more detailed resolution than before.    
    [H,T,R] = hough(BW,'Theta',-89:0.01:89);
    BW = BW';
    
    % Get only the first houghpeak
    P  = houghpeaks(H,1);
    
    % Pick out the angle
    angle = -T(P(2));
    % angle
    if (angle > 90)
           angle = angle - 180;
    end
    
    inputImage = 1-inputImage;
    outputImage = 1-imrotate(inputImage, angle, 'bilinear');
    imshow(inputImage)
    figure, imshow(outputImage)
end

