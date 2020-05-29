function out = closecentroid(sqr1,sqr2)
%tells if the squares have close centroids
cx1 = sqr1.Centroid(1);
cy1 = sqr1.Centroid(2);
cx2 = sqr2.Centroid(1);
cy2 = sqr2.Centroid(2);
tolerance = 0.1;

out = false;
if cx2 > cx1*(1-tolerance) && cx2 < cx1*(1+tolerance) && cy2 > cy1*(1-tolerance) && cy2 < cy1*(1+tolerance)
    out = true;
end
       
end

