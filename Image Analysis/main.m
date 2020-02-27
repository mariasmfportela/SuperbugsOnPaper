%export the image and convert into a binary image
origImg = imread("images/mock2.jpg");

%find the calibration pattern
get_sqrs_pattern(origImg);

%an extra step will be needed here to correct for tilting of the image
%right now it only works if the picture was taken with the camara parallel
%to the strip, in a flat surface

%get the center of the larger squares in the pattern, and the center of the
%smaller square
lg_center = get_center(sqrs);
sm_center = [sqrs(4).Centroid(1) sqrs(4).Centroid(2)];

%get the direction from the larger center to the test lines
%angle with the coordinate system as a value between -180 and 180 degrees
theta = get_angle(lg_center, sm_center);

%get unit length, defined as side of smaller square
unit = get_unit(sqrs(4).BoundingBox, theta, lg_center);

%find if control line is present
ctrl_line(origImg, lg_center, theta, unit);


for n = 1:length(sqrs)
    rectangle('Position', sqrs(n).BoundingBox, 'EdgeColor', 'r');
end

plot(lg_center(1), lg_center(2), 'g*');
plot(sm_center(1), sm_center(2), 'g*');

x = (lg_center(1)-100000):(lg_center(1)+10000);
y = tand(theta)*x + lg_center(2)-tand(theta)*lg_center(1);
plot(x,y,'b');
