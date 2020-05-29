function theta = get_lines_direction(origin, center, corners, side)
%find angle from that corner to center
tau = get_angle(origin, center);

%the direction of the test lines is 45º from this angle
tau = tau + 45;

%find corner in this direction
x = origin(1) + side*cosd(tau);
y = origin(2) + side*sind(tau);
n = find_closest(corners, [x y]);

%find the angle of these points
theta = get_angle(origin, corners(n,:));

%bound value between 180 and -180
if theta > 180
    theta = theta - 360;
else if theta < -180
    theta = theta + 360;
end

end

