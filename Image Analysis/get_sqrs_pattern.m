function sqrs = get_sqrs_pattern(img)
%extract region properties of each area
stats = [regionprops(img); regionprops(not(img))];

%find squares in the image
sqrs = getsqrs(stats, size(img,1)*size(img, 2)*0.001);

%sort sqrs by the x position of their BoundingBox
sqrs = sortsqrs(sqrs);

%find the group of quares that matches the calibration pattern
%should have similar centroid positions and be contained within each other
sqrs = sqrspattern(sqrs);

end

