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

%get the center of the pattern
center_sqrs = get_center(sqrs);

%show the identified squares on the original image
figure;
imshow(origImg);
hold on;

for n = 1:length(sqrs)
    rectangle('Position', sqrs(n).BoundingBox, 'EdgeColor', 'r');
end

plot(center_sqrs(1), center_sqrs(2), 'g*');
plot(sqrs(4).Centroid(1), sqrs(4).Centroid(2), 'g*');

%measuring the angle of the line defined by the two centers in relation to
%the x axis