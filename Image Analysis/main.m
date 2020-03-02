%export the image and convert into a binary image
origImg = imread("images/mock2.jpg");

%convert image in binary matrix
grayImg = rgb2gray(origImg);
binImg = imbinarize(grayImg);

%find the calibration pattern
sqrs = get_sqrs_pattern(binImg);

%get the corners of the smaller callibration square
corners = get_points(binImg, sqrs(4).BoundingBox);

%define origin as the corner closer to the center of the calibration
%squares
lg_center = get_center(sqrs);
index_origin_corner = find_closest(corners, lg_center);
origin = corners(index_origin_corner,:);

%get side length of smaller square
side = get_side_length(corners);

%get center of smaller square
center = get_center_from_corners(corners);

%get direction from origin to test lines
theta = get_lines_direction(origin, center, corners, side);

ctrl_line(origImg, origin, theta, side);

plot(origin(1), origin(2), 'g*');
plot(center(1), center(2), 'g*');

x = (origin(1)-100000):(origin(1)+10000);
y = tand(theta)*x + origin(2) - tand(theta)*origin(1);
plot(x,y,'b');
