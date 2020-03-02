function output = ctrl_line(img, origin, angle, u)
%coordinates of the corners of the control line when angle = 0, relative to
%the origin
p1 = [3*u; 2.5*u];
p2 = [3*u; -2.5*u];
p3 = [3.9*u; 2.5*u];
p4 = [3.9*u; -2.5*u];
corners = [p1 p2 p3 p4];

%rotation by angle
corners = [cosd(angle) -sind(angle); sind(angle) cosd(angle)]*corners;

%translation to center at origin
corners = corners + [origin.' origin.' origin.' origin.'];

%plot to check
figure;
imshow(img);
hold on;

for n = 1:4
    plot(corners(1,n), corners(2,n), 'b*');
end



end

