%export the image and convert into a binary image
origImg = imread("images/mock4.jpg");
grayImg = rgb2gray(origImg);
binImg = imbinarize(grayImg);

%extract region properties of each area
stats = [regionprops(binImg); regionprops(not(binImg))];

%find squares in the image
sqrs = getsqrs(stats, size(origImg,1)*size(origImg, 2)*0.001);

%sort sqrs by the x position of their BoundingBox
sqrs = sortsqrs(sqrs);

%find the group of quares that matches the calibration pattern
%should have similar centroid positions and be contained within each other
sqrs = sqrspattern(sqrs);

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

%find points that limit the control line - not working yet
get_ctrl_line(origImg, lg_center, theta, unit);

%plot findings
figure;
imshow(origImg);
hold on;

for n = 1:length(sqrs)
    rectangle('Position', sqrs(n).BoundingBox, 'EdgeColor', 'r');
end

plot(lg_center(1), lg_center(2), 'g*');
plot(sm_center(1), sm_center(2), 'g*');

x = (lg_center(1)-100000):(lg_center(1)+10000);
y = tand(theta)*x + lg_center(2)-tand(theta)*lg_center(1);
plot(x,y,'b');
