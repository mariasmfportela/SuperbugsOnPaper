function center = get_center_from_corners(corners)
line1 = [corners(1,:); corners(3,:)];
line2 = [corners(2,:); corners(4,:)];
center = find_intercepts(line1, line2);
end

