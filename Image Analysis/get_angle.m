function theta = get_angle(v0, v1)
x0 = v0(1);
y0 = v0(2);
x1 = v1(1);
y1 = v1(2);

if y1 == y0
    theta = 90;
else
    theta = atand((x0-x1)/(abs(y0-y1)));
    if y1 > y0
        theta = 180 - theta;
    end
end

end

