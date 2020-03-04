%export the image and convert into a binary image
origImg = imread("images/mock2.jpg");

%convert image in binary matrix
grayImg = rgb2gray(origImg);
binImg = imbinarize(grayImg);

%plot identified vertices
figure;
imshow(origImg);
hold on;

%find the calibration pattern
[sqrs, sqrs_pattern] = get_sqrs_pattern(binImg);

%get the corners of the smaller square in pattern
ptrn_sm_corners = get_points(binImg, sqrs_pattern(4).BoundingBox);

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
if ctrl_line(origImg, origin, theta, side)
    test_lines(origImg, origin, theta, side, sqrs);
    valid = true;
end
