function corners_out = line_fit_to_corners(corners_in, features, max_rho, x0, y0)
%determine cut-offs
cut_offs = corners_in(:,3);
cut_offs = sort(cut_offs);

%extract the points between each corner
line1 = [features(1:cut_offs(1),:); features(cut_offs(4):length(features),:)];
line2 = features(cut_offs(1):cut_offs(2), :);
line3 = features(cut_offs(2):cut_offs(3), :);
line4 = features(cut_offs(3):cut_offs(4), :);

%eliminate unwanted points
line1((line1(:,2) > max_rho*0.9), :) = [];
line2((line2(:,2) > max_rho*0.9), :) = [];
line3((line3(:,2) > max_rho*0.9), :) = [];
line4((line4(:,2) > max_rho*0.9), :) = [];

%convert to cartesian coordinates
[line1(:,1), line1(:,2)] = pol2cart(line1(:,1), line1(:,2));
[line2(:,1), line2(:,2)] = pol2cart(line2(:,1), line2(:,2));
[line3(:,1), line3(:,2)] = pol2cart(line3(:,1), line3(:,2));
[line4(:,1), line4(:,2)] = pol2cart(line4(:,1), line4(:,2));

%plot
plot(line1(:,1)+x0,line1(:,2)+y0, 'r*');
plot(line2(:,1)+x0,line2(:,2)+y0, 'g*');
plot(line3(:,1)+x0,line3(:,2)+y0, 'b*');
plot(line4(:,1)+x0,line4(:,2)+y0, 'y*');

%find interception points between pairs of lines
p1 = find_intercepts(line1, line2);
p2 = find_intercepts(line2, line3);
p3 = find_intercepts(line3, line4);
p4 = find_intercepts(line4, line1);

%output points found
corners_out = [p1; p2; p3; p4];
plot(corners_out(:,1)+x0,corners_out(:,2)+y0, 'b*');

end