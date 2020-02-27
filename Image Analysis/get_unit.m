function unit = get_unit(rect, angle, origin)
%y = tand(angle)*x + origin(2)-tand(angle)*origin(1) - origin(2);
%x = (y - origin(2) + tand(angle)*origin(1))/tand(angle);

if angle >= 90
    a = rect(1) - origin(1);
    b = tand(angle)*rect(1) + origin(2)-tand(angle)*origin(1) - origin(2);
elseif angle >= 0
    a = (rect(2) + rect(4) - origin(2) + tand(angle)*origin(1))/tand(angle) - origin(1);
    b = rect(2) + rect(4) - origin(2);
elseif angle >= -90
    a = rect(1) + rect(3) - origin(1);
    b = tand(angle)*(rect(1) + rect(3)) + origin(2)-tand(angle)*origin(1) - origin(2);
else
    a = (rect(2) - origin(2) + tand(angle)*origin(1))/tand(angle) - origin(1);
    b = rect(2) - origin(2);
end

%ensure values are within reasonable bounds
if abs(a) > rect(3)
    a = rect(3);
end

if abs(b) > rect(4);
    b = rect(4);
end

unit = sqrt(a^2 + b^2);

end

