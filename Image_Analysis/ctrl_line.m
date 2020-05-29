function output = ctrl_line(img, origin, angle, u)
%coordinates of control line
vertices = [3*u -2.5*u; 3*u 2.5*u; 3.8*u 2.5*u; 3.8*u -2.5*u];

%rotate
vertices = vertices*[cosd(angle) sind(angle); -sind(angle) cosd(angle)];

%translation
vertices = vertices + [origin(1)*ones(4, 1) origin(2)*ones(4,1)];

%color intensity of control line
%plot(vertices(:,1), vertices(:,2), 'r*');
color = quantify_test_zone(img, vertices);

%threshold for valid control
threshold = 200;

if color < threshold
    output = true;
else
    output = false;
end

end

