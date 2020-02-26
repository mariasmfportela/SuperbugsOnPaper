function [p1, p2, p3, p4] = get_ctrl_line(img, origin, angle, u)
%y = tand(theta)*x + lg_center(2)-tand(theta)*lg_center(1);
%x = (y - lg_center(2) + tand(theta)*lg_center(1))/tand(theta);
m1 = tand(angle);
b1 = origin(2) - tand(angle)*origin(1);

m2 = -1/tand(angle);
b2 = (origin(2)*sin(angle) + origin(1)*cos(angle) + 4*u)/(cos(angle)*sin(angle));

%p1 = 

end

