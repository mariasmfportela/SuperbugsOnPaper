function sqrs = getsqrs(stats, minArea)
%extract squares of relevant size
sqrs = []; %array to contain the extracted squares

for n = 1:size(stats,1)
    w = stats(n).BoundingBox(3);
    h = stats(n).BoundingBox(4);
    
    tolerance = 0.1;
    if w*h > minArea && w/h > 1-tolerance && w/h < 1+tolerance
        sqrs = [sqrs stats(n)]; %store each square as a column
    end
end
end

