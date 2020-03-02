function output = sort_features(features_in, rect)
%sorts the struct sqrs by angle in polar coordinates, about the center of
%rect

%pre-process data into required format
x_in = features_in.Location(:,1);
y_in = features_in.Location(:,2);

x_in = x_in - rect(1);
y_in = y_in - rect(2);

%convert to polar coordinates
[theta, rho] = cart2pol(x_in, y_in);

%sort points by theta by insertion sort
i = 2;
while i <= length(theta)
    t = theta(i);
    r = rho(i);
    j = i - 1;

    while j >= 1 && theta(j) > t
        theta(j+1) = theta(j);
        rho(j+1) = rho(j);
        j = j - 1;
    end
    
    theta(j+1) = t;
    rho(j+1) = r;
    i = i + 1;
end

%output
output = [theta rho];
end

