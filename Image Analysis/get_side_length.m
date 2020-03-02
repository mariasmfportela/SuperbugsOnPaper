function side = get_side_length(corners)

S = [];
for i = 1:4
    j = i+1;
    if i == 4
        j = 1;
    end
    x = corners(i,1) - corners(j,1);
    y = corners(i,2) - corners(j,2);
    S = [S sqrt(x^2 + y^2)];
end

side = mean(S);

end

