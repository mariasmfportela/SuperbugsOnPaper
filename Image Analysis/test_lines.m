function results = test_lines(img, origin, angle, u, sqrs)

d = [6*u 7.5*u 9*u];
x = d*cosd(angle) + origin(1);
y = d*sind(angle) + origin(2);

test_points = [];
for n = 1:length(sqrs)
    test_points = [test_points; sqrs(n).Centroid(1) sqrs(n).Centroid(2)];
end

a = find_closest(test_points, [x(1) y(1)]);
plot(sqrs(a).Centroid(1), sqrs(a).Centroid(2), 'b*');
plot(x, y, 'r*');
    


% %%%%%%%%%%%%%%%%%%%% coordinates of each test zone %%%%%%%%%%%%%%%%%%%%
% %line 1 ctrl
% L1_ctrl = [5.8*u 5.8*u 6.7*u 6.7*u; -0.5*u 0.5*u 0.5*u -0.5*u];
% 
% L2_ctrl = [7.3*u 7.3*u 8.2*u 8.2*u; -0.5*u 0.5*u 0.5*u -0.5*u];
% 
% L3_ctrl = [8.8*u 8.8*u 9.7*u 9.7*u; -0.5*u 0.5*u 0.5*u -0.5*u];
% 
% quantify_test_zone(img, origin, angle, L1_ctrl);
% quantify_test_zone(img, origin, angle, L2_ctrl);
% quantify_test_zone(img, origin, angle, L3_ctrl);


end

