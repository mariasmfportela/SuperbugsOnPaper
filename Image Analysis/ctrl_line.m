function output = ctrl_line(img, origin, angle, u)
%coordinates of the corners of the control line when angle = 0, relative to
%the origin
vertices = [3*u 3*u 3.8*u 3.8*u; -2.4*u 2.4*u 2.5*u -2.5*u];

%rotate
vertices = [cosd(angle) -sind(angle); sind(angle) cosd(angle)]*vertices;

%translation
vertices = vertices + [origin(1)*ones(1, 4); origin(2)*ones(1,4)];

%create mask for the region of interest
x = double(vertices(1,:));
y = double(vertices(2,:));
m = size(img,1);
n = size(img,2);
BW = poly2mask(x,y,m,n);

%apply mask to image
img(repmat(BW,[1,1,3])==0) = 0;

%extract green channel of masked image
greenChannel = img(:,:,2);

%process data
greenChannel = reshape(greenChannel, 1, []);
greenChannel(greenChannel == 0) = [];
greenChannel = sort(greenChannel);
greenChannel = greenChannel(floor(0.1*length(greenChannel)):ceil(0.9*length(greenChannel)));

meanGreen = mean(greenChannel);

end

