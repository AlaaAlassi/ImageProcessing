clc;clear,close all;
I= rgb2gray(imread('left1.ppm'));
J= rgb2gray(imread('right1.ppm'));

for d = 0:24
    js = [J(:,d+1:end) zeros(size(I,1),d)];
    
    %ssd
    D = double((I - js).^2);
    D = imfilter(D,ones(17));
    imshow(D,[])
    V(:,:,d+1) = D;
    
    %ncc
    a_mean = imfilter(double(I),ones(17) / 17);
    js_mean = imfilter(double(js),ones(17) / 17);
    temp1 = (double(I) - a_mean) .* (double(js) - js_mean);
    temp1 = imfilter(temp1,ones(17));
    
    temp2 = (double(I) - a_mean).^2;
    temp2 = imfilter(temp2,ones(17));
    
    temp3 = (double(js) - js_mean).^2;
    temp3 = imfilter(temp3,ones(17));
    
    temp4 = temp2 .* temp3;
    NCC(:,:,d+1) = temp1 ./ temp4;
    
    
end

min_diff = zeros(size(I,1),size(I,2));

max_diff = zeros(size(I,1),size(I,2));

for j=1:size(I,1)
    for i=1:size(I,2)
        [val idx] = min(V(j,i,:));
        min_diff(j,i) = idx;
        
        [val idx] = max(NCC(j,i,:));
        max_diff(j,i) = idx;
    end
end
imshow(min_diff,[]), title('SSD disparity map')
figure, imshow(max_diff,[]), title('NCC disparity map')
