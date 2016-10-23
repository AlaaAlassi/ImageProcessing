function [r,c] = get_hough_peaks(hough_space, thresh_diff)

r = [];
c = [];
[max_in_col, row_number] = max(hough_space);
thresh = max(max(hough_space)) - thresh_diff;
for i = 1:size(max_in_col, 2)
   if max_in_col(i) > thresh
       c(end + 1) = i;
       r(end + 1) = row_number(i);
   end
end
