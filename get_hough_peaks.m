
% thýs functýon ýs respolnsablue to filter out the detected lines based on 
% the dýffrenrece between the maximum node value and a threshold value
% determened by the user. the function reterns two variables ; r wich
% storse the oder of the accepted nodes and r wich is the value of the node


function [r,c] = get_hough_peaks(hough_space, thresh_diff)

r = [];
c = [];
%For matrices, max(X)is a row vector containing the maximum element
%from each column.
%[Y,I] = max(X) returns the indices of the maximum values in vector I.
%   If the values along the first non-singleton dimension contain more
%  than one maximal element, the index of the first one is returned.
[max_in_col, row_number] = max(hough_space);

% the threshold difference is the diffrence between the highs peak in the
% hough imae and the other peaks that are less than it by maxmum of
% (hreshold difference)
% the reson why are tak'ng the max of the max is that the first max will 
%will return the maximum VECTOR and from that vector we take the maximum
%element so that we get the maximum node.
thresh = max(max(hough_space)) - thresh_diff;

%M = size(X,DIM) returns the length of the dimension specified
% by the scalar DIM.  For example, size(X,1) returns the number
%of rows. If DIM > NDIMS(X), M will be 1. 
% in our case we need the nuber of coulums so we can itirate throu all 
% nodes 
for i = 1:size(max_in_col, 2)
   if max_in_col(i) > thresh
       
       %append the index of the node to c vector 
       c(end + 1) = i
        %append the value of the node to r vector
       r(end + 1) = row_number(i)
   end
end
