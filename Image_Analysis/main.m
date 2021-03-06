%export the image and convert into a binary image
img = imread("images/mock4.jpg");

%find the calibration pattern
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
valid = false;

%verify if control line is present
if ctrl_line(img, origin, theta, side)
    results = test_lines(img, origin, theta, side, sqrs);
    valid = true;
end
