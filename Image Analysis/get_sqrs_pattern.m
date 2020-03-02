function sqrs = get_sqrs_pattern(img)
%extract region properties of each area
stats = [regionprops(img); regionprops(not(img))];

%find squares in the image
sqrs = get_sqrs(stats, size(img,1)*size(img, 2)*0.001);

%sort sqrs by the x position of their BoundingBox
sqrs = sort_sqrs(sqrs);

%find the group of quares that matches the calibration pattern
%should have similar centroid positions and be contained within each other
sqrs = sqrs_pattern(sqrs);

end

