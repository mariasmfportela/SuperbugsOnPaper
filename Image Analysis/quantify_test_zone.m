function output = quantify_test_zone(img, vertices)
%create mask for the region of interest
x = double(vertices(:,1));
y = double(vertices(:,2));
m = size(img,1);
n = size(img,2);
roi = poly2mask(x,y,m,n);

%extract green channel
img = img(:,:,2);

%apply mask to green channel
green = img.*uint8(roi);

%exclude null values from array
green(green == 0) = [];

%rearrange pixel values as a single row and sort
green = reshape(green, 1, []);
green = sort(green);

%truncate extremes
green = green(floor(0.1*length(green)):ceil(0.9*length(green)));

%get mean green intensity in the region of interest
output = mean(green);

end

