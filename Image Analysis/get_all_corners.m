function output = get_all_corners(binImg, rect)
figure;
imshow(binImg);
hold on;

%detect corner features
features = detectMinEigenFeatures(binImg, 'ROI', rect);

%define origin
x0 = rect(1) + rect(3)/2;
y0 = rect(2) + rect(4)/2;

%sort corners by angle in polar coordinates
features = sort_features(features, [x0 y0]);
theta = [features(:,1); features(1,1)];
rho = [features(:,2); features(1,2)];

%corners of the square will have biggest rho values
candidates = [];
for n = 2:length(rho)-1
    if rho(n)-rho(n-1) > 0 && rho(n)-rho(n+1) > 0
        candidates = [candidates; theta(n) rho(n) n]; 
    end
end

%afeter sorting, the corners are the first four values
candidates = sort_candidates(candidates);

%get a better approximation of the real position of the corners by linear
%fit to the points in between the detected corners
corners = line_fit_to_corners(candidates(1:4));

[x,y] = pol2cart(candidates(1:4,1), candidates(1:4,2));
x = x + x0;
y = y + y0;
plot(x, y, 'r*');

end

