clear all;
%export the image and convert into a binary image
origImg = imread("images/mock7.jpg");
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

figure;
imshow(origImg);
hold on;

for n = 1:length(sqrs)
    rectangle('Position', sqrs(n).BoundingBox, 'EdgeColor', 'r');
    plot(sqrs(n).Centroid(1), sqrs(n).Centroid(2), 'g*');
end