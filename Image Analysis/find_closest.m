function index = find_closest(points, target)
%outputs the index of the point in points closer to target

min = 10000;
index = 0; %store index of corner closer to origin
for n = 1:length(points)
    a = points(n,1) - target(1);
    b = points(n,2) - target(2);
    d = sqrt(a^2 + b^2);
    if d < min
        min = d;
        index = n;
    end
end
end

