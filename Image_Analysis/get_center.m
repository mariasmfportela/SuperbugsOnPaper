function [point] = get_center(sqrs)
x = (sqrs(1).Centroid(1) + sqrs(2).Centroid(1) + sqrs(3).Centroid(1))/3;
y = (sqrs(1).Centroid(2) + sqrs(2).Centroid(2) + sqrs(3).Centroid(2))/3;
point = [x y];
end

