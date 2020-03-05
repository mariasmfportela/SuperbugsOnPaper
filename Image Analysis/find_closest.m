function index = find_closest(points, target)
%outputs the index of the point in points closer to target
%each point is a row [x y]
len = size(target,1);
min = 10^6*ones(1,len);
index = zeros(1,len);

for n = 1:length(points)
    a = points(n,1) - target(:,1);
    b = points(n,2) - target(:,2);
    d = sqrt(a.^2 + b.^2);
    
    index(d.'<min) = n;
    min(d.'<min) = d(d.'<min);
end
end

