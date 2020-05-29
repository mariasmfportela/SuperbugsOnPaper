function out = isinside(sqr1,sqr2)
%ISINSIDE tells if sqr1 is completely contained inside sqr2

out = false;

x1 = sqr1.BoundingBox(1);
x2 = sqr2.BoundingBox(1);
y1 = sqr1.BoundingBox(2);
y2 = sqr2.BoundingBox(2);
w1 = sqr1.BoundingBox(3);
w2 = sqr2.BoundingBox(3);
h1 = sqr1.BoundingBox(4);
h2 = sqr2.BoundingBox(4);

if x1>x2 && y1>y2 && (x1+w1)<(x2+w2) && (y1+h1)<(y2+h2) && w1<w2 && h1<h2
    out = true;
end
end

