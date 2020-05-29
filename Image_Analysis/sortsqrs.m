function sqrs_out = sortsqrs(sqrs_in)
%sorts the struct sqrs by ascending order of the value x for the bounding
%box, by insertion sort
i = 2;
while i <= length(sqrs_in)
    x = sqrs_in(i);
    j = i - 1;
    while j >= 1 && sqrs_in(j).BoundingBox(1) > x.BoundingBox(1)
        sqrs_in(j+1) = sqrs_in(j);
        j = j - 1;
    end
    sqrs_in(j+1) = x;
    i = i + 1;
end

sqrs_out = sqrs_in;
end

