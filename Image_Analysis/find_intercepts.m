function point = find_intercepts(line1, line2)
    %get line equation by linear fit
    [m1, b1] = linear_fit(line1);
    [m2, b2] = linear_fit(line2);
    
    %compute intercept
    x = (b2-b1)/(m1-m2);
    y = m1*x + b1;
    
    point = [x y];
end

