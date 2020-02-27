function output = correct_shear(binImg, rect)
%detect upper left corner by finding the lines that intersect at that
%corner
valid = false;
k = 0.5;
iteration = 1;
idx = 0; %store the index of the corner point
gradients = zeros(2);

while ~valid
    roi = rect - [0 0 k*rect(3) (1-k)*rect(4)];
    corners = detectMinEigenFeatures(binImg, 'ROI', roi);
    corners = sort_corners(corners);
    
    gradient_changes = 0;
    for n = length(corners.Location)-1:-1:2
        grad1 = corners.Location(n+1, 2) - corners.Location(n, 2);
        grad2 = corners.Location(n, 2) - corners.Location(n-1, 2);
        if grad1/grad2 < 0
            gradient_changes = gradient_changes + 1;
            idx = n;
        end         
    end
    
    if gradient_changes == 1
        valid = true;
        
        %find gradients of intersecting lines
        l = length(corners.Location);
        x1 = [corners.Location(1:idx,1) ones(idx)];
        x2 = [corners.Location(idx:l,1) ones(l-idx+1)];
        y1 = corners.Location(1:idx,2);
        y2 = corners.Location(idx:l,2);
        
        coeff1 = mldivide(x1, y1);
        coeff2 = mldivide(x2, y2);
        
        gradients = [coeff1(1) coeff2(1)];
        
    else
        k = k + 0.05*((-1)^iteration)*iteration;
        iteration = iteration + 1;
    end
end

figure;
imshow(binImg);
hold on;
plot(corners);

end

