function line = exclude_edge_points(line, k)
s = floor(length(line)*k);
e = length(line) - ceil(length(line)*k);
line = line(s:e,:);
end

