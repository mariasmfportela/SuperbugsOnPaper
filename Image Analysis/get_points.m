function [corners, center] = get_points(binImg, rect)
%detect corner features
features = detectMinEigenFeatures(binImg, 'ROI', rect);

%define origin
x0 = rect(1) + rect(3)/2;
y0 = rect(2) + rect(4)/2;

%sort corners by angle in polar coordinates
features_polar = sort_features(features, [x0 y0]);
theta = [features_polar(:,1); features_polar(1,1)];
rho = [features_polar(:,2); features_polar(1,2)];
[x_feat, y_feat] = pol2cart(theta, rho);

%corners of the square will have biggest rho values
candidates = [];
for n = 2:length(rho)-1
    if rho(n)-rho(n-1) > 0 && rho(n)-rho(n+1) > 0
        candidates = [candidates; theta(n) rho(n) n]; 
    end
end

%after sorting, the corners are the first four values
candidates = sort_candidates(candidates);
[x_cand, y_cand] = pol2cart(candidates(1:4,1), candidates(1:4,2));

%get a better approximation of the real position of the corners by linear
%fit to the points in between the detected corners
corners = line_fit_to_corners([x_cand y_cand candidates(1:4,3)], [x_feat y_feat]);
corners = corners + [x0*ones(4,1) y0*ones(4,1)];

%get center of square
center = get_center_from_corners(corners);

end

