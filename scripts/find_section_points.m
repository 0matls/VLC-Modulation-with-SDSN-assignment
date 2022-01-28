
function [section_points] = find_section_points(s)

% define the polygons by their edges
% every edge is calculated via the lines' section points 
% lines between every symbol and its neighboring symbols are calculated
% (manually) as indicated by the paper in B 

n = length(s);
section_points = cell(n,2);
% section points for 1st symbol
section_points(1,1) = {[-0.6791 0    0.6791   10.23735   0  -10.23735 -0.6791]'}; 
section_points(1,2) = {[-0.1739 0.2 -0.1739   -9.76265 -15   -9.76265 -0.1739]'};
% section points for 2nd symbol
section_points(2,1) = {[0   0      0.2836  0.6791 0]'}; 
section_points(2,2) = {[0.2 0.4887 0.4887 -0.1739 0.2]'};
% section points for 3rd symbol
section_points(3,1) = {[15   10.23735 0.6791 0.2836  0.6791 10.23735  15]'}; 
section_points(3,2) = {[ 0.5  9.76265 1.1739 0.4887 -0.1739 -9.76265   0.5]'};
% section points for 4th symbol
section_points(4,1) = {[0      0      0.6791 0.2836 0]'}; 
section_points(4,2) = {[0.4887 0.7818 1.1739 0.4887 0.4887]'};
% section points for 5th symbol
section_points(5,1) = {[0     -0.6791 -10.23735   0  10.23735 0.6791  0]'}; 
section_points(5,2) = {[0.7818 1.1739   9.76265  15   9.76265 1.1739 0.7818]'};
% section points for 6th symbol
section_points(6,1) = {[0      0      -0.6791 -0.2836 0]'}; 
section_points(6,2) = {[0.4887 0.7818  1.1739  0.4887 0.4887]'};
% section points for 7th symbol
section_points(7,1) = {[-15   -10.23735 -0.6791 -0.2836 -0.6791 -10.23735  -15]'}; 
section_points(7,2) = {[  0.5   9.76265  1.1739  0.4887 -0.1739   -9.76265    0.5]'};
% section points for 8th symbol
section_points(8,1) = {[0   0      -0.2836  -0.6791 0]'}; 
section_points(8,2) = {[0.2 0.4887  0.4887  -0.1739 0.2]'};
end

