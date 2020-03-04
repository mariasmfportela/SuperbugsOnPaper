function [sqrs, sqrs_pattern] = get_sqrs_pattern(img)
sqrs = [];
sqrs_pattern = [];

%extract region properties of each area
stats = [regionprops(img); regionprops(not(img))];

%%%%%%%%%%%%%%%%%%%% find squares in the image %%%%%%%%%%%%%%%%%%%%

%minimum area for the square to be considered
minArea = size(img,1)*size(img, 2)*0.001;

%extract squares of relevant size
for n = 1:size(stats,1)
    w = stats(n).BoundingBox(3);
    h = stats(n).BoundingBox(4);
    
    tolerance = 0.1;
    if w*h > minArea && w/h > 1-tolerance && w/h < 1+tolerance
        %store each square as a column
        sqrs = [sqrs stats(n)];
    end
end

% %plot to check
% for n = 1:length(sqrs)
%     rectangle('Position', sqrs(n).BoundingBox);
% end

%%%%%%%%%% sort sqrs by the x position of their BoundingBox %%%%%%%%%%

i = 2;
while i <= length(sqrs)
    x = sqrs(i);
    j = i - 1;
    while j >= 1 && sqrs(j).BoundingBox(1) > x.BoundingBox(1)
        sqrs(j+1) = sqrs(j);
        j = j - 1;
    end
    sqrs(j+1) = x;
    i = i + 1;
end

%%%%%%%%%%%%%%%%%%%% find the calibration pattern %%%%%%%%%%%%%%%%%%%%

%should have similar centroid positions and be contained within each other
for i = 1:length(sqrs)
    if isempty(sqrs_pattern)
        for j = (i+1):length(sqrs)
            if closecentroid(sqrs(j), sqrs(i)) && isinside(sqrs(j), sqrs(i))
                for k = (j+1):length(sqrs)
                    if closecentroid(sqrs(k), sqrs(j)) && isinside(sqrs(k), sqrs(j))
                        for l = (k+1):length(sqrs)
                            if isinside(sqrs(l), sqrs(k))
                                sqrs_pattern = [sqrs(i) sqrs(j) sqrs(k) sqrs(l)];
                            end
                        end
                    end
                end
            end
        end
    end
end

end

