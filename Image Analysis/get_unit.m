function unit = get_unit(rect, angle, point)
if angle >= 90
    a = point(1) - rect(1);
    b = tand(angle)*rect(1) + point(2) - tand(angle)*point(1) - rect(2);
elseif angle >= 0
    a = (rect(2) + rect(4) - point(2) + tand(angle)*point(1))/tand(angle) - rect(1);
    b = rect(2) + rect(4) - point(2);
elseif angle >= -90
    a = rect(1) + rect(3) - point(1);
    b = tand(angle)*(rect(1) + rect(3)) + point(2)-tand(angle)*point(1) - point(2);
else
    a = (rect(1) - point(2) + tand(angle)*point(1))/tand(angle) - point(1);
    b = point(2) - rect(2);
end

unit = sqrt(a^2 + b^2);

end

