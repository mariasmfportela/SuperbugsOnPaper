function theta = get_angle(p0, p1)
x0 = p0(1);
y0 = p0(2);
x1 = p1(1);
y1 = p1(2);

%account for the perpendicular case
if x1 == x0
    if y1 > y0
        theta = 90;
    else
        theta = -90;
    end
%calculate the angle from tangent    
else
    theta = atand((y1-y0)/(x1-x0));
    %correct for negative x
    if x1 < x0
        theta = theta + 180;
    end
end

%the direction of the test lines is 45º from this angle
theta = theta + 45;

%bound value between 180 and -180
if theta > 180
    theta = theta - 180;
end

end

