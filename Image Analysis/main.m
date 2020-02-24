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

%find a box that binds the actual square pattern

%get the center of the larger squares in the pattern, and the center of the
%smaller square
lg_center = get_center(sqrs);
sm_center = [sqrs(4).Centroid(1) sqrs(4).Centroid(2)];

%get the angle these make with vertical axis
theta = get_angle(lg_center, sm_center);

%
if abs(theta) < 90
    y = sqrs(4).BoundingBox(4);
    b = lg_center(2) - sqrs(4).BoundingBox(2);
    if b < y/2
        x = sqrs(4).BoundingBox(3);
        a = lg_center(1) - sqrs(4).BoundingBox(1);
        alpha = atand((x-a)/a);
    else
        alpha = atand((y-b)/b);
    end
    


%define unit distance as the side of the smaller pattern square
unit = mean(sqrs(4).BoundingBox(3), sqrs(4).BoundingBox(4));

%find control line
%get_ctrl_line(origImg, lg_center, tau, unit);

%plot findings
figure;
imshow(origImg);
hold on;

for n = 1:length(sqrs)
    rectangle('Position', sqrs(n).BoundingBox, 'EdgeColor', 'r');
end

plot(lg_center(1), lg_center(2), 'g*');
plot(sm_center(1), sm_center(2), 'g*');
