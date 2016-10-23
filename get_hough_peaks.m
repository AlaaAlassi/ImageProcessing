function [r,c] = get_hough_peaks(hough_space, thresh_diff)

r = [];
c = [];
[max_in_col, row_number] = max(hough_space);
% the threshold difference is the diffrence between the highs peak in the
% hough imae and the other peaks that are less than it by maxmum of
% (hreshold difference)
thresh = max(max(hough_space)) - thresh_diff;
for i = 1:size(max_in_col, 2)
   if max_in_col(i) > thresh
       c(end + 1) = i;
       r(end + 1) = row_number(i);
   end
end
