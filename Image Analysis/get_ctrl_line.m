function output = get_ctrl_line(image, center, angle, unit)
%define rotation matrix
A = [cos(angle) -sin(angle); sin(angle) cos(angle)];

%define original corner of the control line
ul = [(center(1)-2.5*unit); (center(2)-4*unit)];
ur = [(center(1)+2.5*unit); (center(2)-4*unit)];
bl = [(center(1)-2.5*unit); (center(2)-3*unit)];
br = [(center(1)+2.5*unit); (center(2)-3*unit)];

%plot
figure;
imshow(imrotate(image,angle));
hold on;
plot(ul(1), ul(2), 'r*');
plot(ur(1), ur(2), 'g*');
plot(br(1), br(2), 'b*');
plot(bl(1), bl(2), 'c*');


end

