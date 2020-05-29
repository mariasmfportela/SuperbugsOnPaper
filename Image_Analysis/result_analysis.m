function output = result_analysis(img_name)
tic;
%function that takes img_name as a string for the path and file name of the
%image to analyse and returns if the test is valid (ie, if the control line
%is present) as well as a numerical result for the ratio of green
%channel values of the test zones to the control zones, for each test line

%import the image
img = imread(img_name);

%find the calibration pattern as a set of square box with the desired
%geometric relations
[sqrs, sqrs_pattern] = get_sqrs_pattern(img);

%get the corners of the smaller square in pattern
ptrn_sm_corners = get_points(img, sqrs_pattern(4).BoundingBox);

%define origin as the corner closer to the center of the pattern squares
ptrn_lg_center = get_center(sqrs_pattern);
origin = ptrn_sm_corners(find_closest(ptrn_sm_corners, ptrn_lg_center),:);

%get side length of smaller square
side = get_side_length(ptrn_sm_corners);

%get center of smaller square
center = get_center_from_corners(ptrn_sm_corners);

%get direction from origin to test lines
theta = get_lines_direction(origin, center, ptrn_sm_corners, side);

%store quantitative results
results = zeros(3);

%boolean for test validity
valid = 0;

%verify if control line is present
if ctrl_line(img, origin, theta, side)
    results = test_lines(img, origin, theta, side, sqrs);
    valid = 1;
end

%output as a vector with 4 values: the first represents if the test is
%valid (boolean), and the three next values the result for each test line
output = [valid results];
toc;
end

