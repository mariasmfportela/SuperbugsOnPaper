function [p1, p2, p3, p4] = get_ctrl_line(img, center, angle, u)
pivot = [(cos(angle)*4*u + center(1)) (sin(angle)*4*u + center(2))];

figure;
imshow(img);
hold on;
plot(cos(angle)*4*u + center(1), sin(angle)*4*u + center(2), 'b*');

p1 = pivot - [2.5*u*cos(angle+90) 2.5*u*sin(angle+90)];
p2 = pivot + [2.5*u*cos(angle+90) 2.5*u*sin(angle+90)];
p3 = p1 + [u*sin(angle+90) u*cos(angle+90)];
p4 = p2 + [u*sin(angle+90) u*cos(angle+90)];

end

