function out = detect_corner(binImg, rect, code)

out = zeros(2,2);

k = 0.5; %determine size of region of interest

if code == 1 %detect upper left corner
    %define region of interest
    roi = rect - [0 0 k*rect(3) (1-k)*rect(4)];
elseif code == 2 %detect bottom right corner
    %define region of interest
    roi = rect + [0 0 k*rect(3) (1-k)*rect(4)];
end

%detect corner features
corners = detectMinEigenFeatures(binImg, 'ROI', roi);

%sort corners with rotational sweep, output is one row [x y] per point
corners = sort_corners(corners, rect);

%scan each point in decreasing theta and get the angle for lines up and
%downstream from it; find point that generates perpendicular lines
for n = length(corners)-2:-1:3
    %get coefficients by linear fit of overdetermined system
    len = length(corners);
    
    x1 = [corners(1:(n-1),1) ones(n-1, 1)];
    y1 = corners(1:(n-1),2);
    coef1 = mldivide(x1, y1);
    
    x2 = [corners((n+1):len,1) ones(len-n, 1)];
    y2 = corners((n+1):len,2);
    coef2 = mldivide(x2, y2);

    %get the angle formed by these lines
    alpha = atand(coef2(1)) - atand(coef1(1));
    
    f = 0.3; %factor to decide if there are enough data points for linear fit

    if n > f*length(corners) && n < (1-f)*length(corners)
        %accept
        %maybe also add a condition on angle and distance to interception
    end

end

