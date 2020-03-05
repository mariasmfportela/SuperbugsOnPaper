function results = test_lines(img, origin, angle, u, sqrs)
d = [6.5*u 8*u 9.5*u];

%define line from origin to predicted position of control spots
x = d*cosd(angle) + origin(1);
y = d*sind(angle) + origin(2);

%choose the points to be tested
test_points = zeros(length(sqrs), 2);
for n = 1:length(sqrs)
    if sqrs(n).BoundingBox(3) < 2*u
        test_points(n,:) = [sqrs(n).Centroid(1) sqrs(n).Centroid(2)];
        %plot(sqrs(n).Centroid(1), sqrs(n).Centroid(2), 'g*');
    end
end

%select the points closest to the predicted position of control spots
a = find_closest(test_points, [x.' y.']);

%imshow(binary_image(img));

%for each test line, quantify control spot and test spots
results = zeros(1,3);
for n = 1:3
    figure;
    imshow(img);
    hold on;
    corners = get_points(img, sqrs(a(n)).BoundingBox);
    center = get_center_from_corners(corners);
    plot(center(1), center(2), 'g*');
    
    plot(corners(:,1), corners(:,2), 'r*');
    ctrl = quantify_test_zone(img, corners);
    test = test_zones(img, center, angle, u);
    
    results(n) = test/ctrl;
end

end

