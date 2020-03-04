function output = ctrl_line(img, origin, angle, u)
%coordinates of control line
vertices = [3*u -2.5*u; 3*u 2.5*u; 3.8*u 2.5*u; 3.8*u -2.5*u];

%color intensity of control line
color = quantify_test_zone(img, origin, angle, vertices);

%threshold for valid control
threshold = 50;

if color > threshold
    output = true;
else
    output = false;
end

end

