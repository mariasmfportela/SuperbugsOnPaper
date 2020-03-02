function corners_out = line_fit_to_corners(corners_in, features)
cut_offs = corners_in(:,3);
cut_offs = sort(cut_offs);

%extract the points between each corner
line1 = [features(1:cut_offs(1),:); features(cut_offs(4):length(features),:)];
line2 = features(cut_offs(1):cut_offs(2), :);
line3 = features(cut_offs(2):cut_offs(3), :);
line4 = features(cut_offs(3):cut_offs(4), :);

%exclude points at the edge of the lines for improved accuracy
k = 0.1; %exclusion factor
line1 = exclude_edge_points(line1, k);
line2 = exclude_edge_points(line2, k);
line3 = exclude_edge_points(line3, k);
line4 = exclude_edge_points(line4, k);

%find interception points between pairs of lines
p1 = find_intercepts(line1, line2);
p2 = find_intercepts(line2, line3);
p3 = find_intercepts(line3, line4);
p4 = find_intercepts(line4, line1);

%output points found
corners_out = [p1; p2; p3; p4];
end