function outimage = canny(imageIN)

 grayImage =rgb2gray(imageIN);
 [x,y] = size(grayImage)
 
% smooth the image using gaussian with kernel size 6 and sigma 10 
 H = fspecial('gaussian',6,10);
 GausImage = imfilter(grayImage, H,'replicate' );
  size( GausImage)
%APPLYING SOBEL MASK ON X-DIRECTION
 H = fspecial('sobel');
 Ixx = imfilter( GausImage, H,'replicate' );
 size(Ixx)
 %imshow(Ixx)

% %APPLYING SOBEL MASK ON Y-DIRECTION

 Iyy = imfilter( GausImage, H','replicate' );
  size(Iyy)
 % imshow(Iyy)

%  
 for v = 1:y
    for u = 1:x
          mod(u,v) = abs(Ixx(u,v)) + abs(Iyy(u,v));
     end
  end



 mod = im2double(mod);
   % Normalize for threshold selection
    magmax = max(mod(:));
    if magmax > 0
       mod = mod / magmax;
    end
    
    
    Iyy=im2double(Iyy);
    Ixx=im2double(Ixx);
    
    for v = 1 : y
      for u = 1 : x
        theta(u,v) = abs(atand(Iyy(u,v)/(Ixx(u,v)+0.01))); 
        
         if ((theta(u,v) >= 0) && (theta(u,v) <= 22.5) || (theta(u,v) >= 157.5) && (theta(u,v) <= 180))
            ntheta(u,v) = 0;
         end
        
          if ((theta(u,v) >= 22.5) && (theta(u,v) <= 67.5))
            ntheta(u,v) = 45;
          end
             if ((theta(u,v) >= 67.5) && (theta(u,v) <= 112.5))
            ntheta(u,v) = 90;
             end
        
        if ((theta(u,v) >= 112.5) && (theta(u,v) <= 180))
            ntheta(u,v) = 135;
        end
       
        
      end
    end
    

    
 
for v = 2 : y-1
      for u = 2 : x-1
    

        %     N O N - M A X I M U M   S U P P R E S S I O N
        if (ntheta(u,v) == 0)
                if (mod(u, v) < mod(u-1, v) || mod(u, v) < mod(u+1, v))
                    supimg(u,v) = 0;
                else supimg(u,v)= mod(u,v);
                end
        end
                
            
            if (ntheta(u,v) == 45)
                if (mod(u, v) < mod(u+1, v-1) || mod(u, v) < mod(u-1, v+1))
                    supimg(u,v) = 0;
                else supimg(u,v)= mod(u,v);
                end
            end
                
            
            if (ntheta(u,v) == 90)
                if (mod(u, v) < mod(u, v-1) || mod(u, v) < mod(u, v+1))
                    supimg(u,v) = 0;
                else supimg(u,v)= mod(u,v);
                end
            end
               
            if (ntheta(u,v) == 135)
                if (mod(u, v) < mod(u-1, v-1) || mod(u, v) < mod(u+1, v+1))
                    supimg(u,v) = 0;
                else supimg(u,v) = mod(u,v);%Supimg -- Image obtained after Non-mSupression
                end 
            end
           
       end
end
 


%   %    E N D  O F  N O N - M A X I M U M   S U P P R E S S I O N
% 
% %T H R E S H O L D I N G

th = 0.8;   %High Threshhold 8
%th = max(supimg);
tl = th/6; %Low Threshhold
gnh(x,y) = 0;
gnl(x,y) = 0;
for v = 2 : y-1
    for u = 2 :x-1
        if(supimg(u,v) >= th)
            gnh(u,v) = supimg(u,v);
        end
        if(supimg(u,v) >= tl)
            gnl(u,v) = supimg(u,v);
        end
     
    end
    
end

% E N D  OF T H R E S H O L D I N G
resimg = gnl - gnh;   %Edge of the Image 
   
%subplot (1, 2, 1),imshow(ID);axis image; title('Original Image');
 subplot (1, 2, 2),imshow(resimg);axis image; title('Canny Edge Image');


outimage = resimg; %resimg


%imshow(resimg);