function sqrs_out = sqrspattern(sqrs)
%finds the group of squares that matches the desired calibration pattern
%assumes sorted by x value of BoundingBox
sqrs_out = [];

i = 1;
for i = 1:length(sqrs)
    if isempty(sqrs_out)
        for j = (i+1):length(sqrs)
            if closecentroid(sqrs(j), sqrs(i)) && isinside(sqrs(j), sqrs(i))
                for k = (j+1):length(sqrs)
                    if closecentroid(sqrs(k), sqrs(j)) && isinside(sqrs(k), sqrs(j))
                        for l = (k+1):length(sqrs)
                            if isinside(sqrs(l), sqrs(k))
                                sqrs_out = [sqrs(i) sqrs(j) sqrs(k) sqrs(l)];
                            end
                        end
                    end
                end
            end
        end
        i = i + 1;
    end
end
end

