function quadrant = quadrant(angle)
%limit angle between -180 and 180
if angle > 180
    angle = angle - 360;
elseif angle < -180
    angle = angle + 360;
end

%find quadrant
if angle > 90
    quadrant = 2;
elseif angle > 0
    quadrant = 1;
elseif angle > -90
    quadrant = 4;
else
    quadrant = 3;
end

end

