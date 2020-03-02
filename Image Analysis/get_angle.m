function angle = get_angle(p0, p1)
%define two points to measure angle
x0 = p0(1);
y0 = p0(2);
x1 = p1(1);
y1 = p1(2);

%account for the perpendicular case
if x1 == x0
    if y1 > y0
        angle = 90;
    else
        angle = -90;
    end
%calculate the angle from tangent    
else
    angle = atand((y1-y0)/(x1-x0));
    %correct for negative x
    if x1 < x0
        angle = angle + 180;
    end
end
end

