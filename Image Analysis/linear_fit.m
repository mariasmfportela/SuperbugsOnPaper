function [m, b] = linear_fit(points)
x = [points(:,1) ones(size(points,1),1)];
y = points(:,2);
coefficients = mldivide(x,y);
m = coefficients(1);
b = coefficients(2);
end

