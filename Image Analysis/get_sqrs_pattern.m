function sqrs = get_sqrs_pattern(origImg)
%convert image in binary matrix
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

end

