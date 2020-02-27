function corners_out = sort_corners(corners_in)
%sorts the struct sqrs by ascending order of the value x for the bounding
%box, by insertion sort
i = 2;
while i <= length(corners_in)
    x = corners_in.Location(i);
    j = i - 1;
    while j >= 1 && corners_in.Location(j, 1) > x(1)
        corners_in.Location(j+1) = corners_in.Location(j);
        j = j - 1;
    end
    
    if corners_in.Location(j, 1) == x(1)
        while j >= 1 && corners_in.Location(j, 2) > x(2)
            corners_in.Location(j+1) = corners_in.Location(j);
            j = j - 1;
        end
    end
    
    corners_in.Location(j+1) = x;
    i = i + 1;
end

corners_out = corners_in;
end

