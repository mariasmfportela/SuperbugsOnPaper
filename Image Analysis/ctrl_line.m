function output = ctrl_line(img, origin, angle, u)
%coordinates of the corners of the control line when angle = 0, relative to
%the origin
vertices = [3*u 3*u 3.8*u 3.8*u; -2.4*u 2.4*u 2.5*u -2.5*u];

%rotate
vertices = [cosd(angle) -sind(angle); sind(angle) cosd(angle)]*vertices;

%translation
vertices = vertices + [origin(1)*ones(1, 4); origin(2)*ones(1,4)];

figure;
imshow(img);
hold on;
plot(vertices(1,:), vertices(2,:), 'b*');

x = double(vertices(1,:));
y = double(vertices(2,:));

m = size(img,1);
n = size(img,2);
BW = poly2mask(x,y,m,n);

img(repmat(BW,[1,1,3])==0) = 0;

%plot to check

imshow(img);



end

