function corners = get_points(img, rect)
binImg = binary_image(img);

%detect corner features
features = detectMinEigenFeatures(binImg, 'ROI', rect, 'FilterSize', 7);

%define origin
x0 = rect(1) + rect(3)/2;
y0 = rect(2) + rect(4)/2;

%sort corners by angle in polar coordinates
features_polar = sort_features(features, [x0 y0]);
theta = [features_polar(:,1); features_polar(1,1)];
rho = [features_polar(:,2); features_polar(1,2)];

%create array of corner point candidates
candidates = [];
for n = 2:length(rho)-1
    if rho(n) > rho(n-1) && rho(n) > rho(n+1)
        candidates = [candidates; theta(n) rho(n) n];
    end
end

%select corners from candidates
candidates = sort_candidates(candidates);
candidates = select_candidates(candidates,x0,y0);

%eliminate features that can interfere with corner calculation
max_rho = max(candidates(:,2));

%get a better approximation of the real position of the corners by linear
%fit to the points in between the detected corners
candidates = sortrows(candidates,1);
[corners(:,1), corners(:,2)] = pol2cart(candidates(:,1), candidates(:,2));

%convert to correct coordinate system
corners = corners + [x0*ones(4,1) y0*ones(4,1)];
end

