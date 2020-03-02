function candidates_out = sort_candidates(candidates_in)
theta = candidates_in(:,1);
rho = candidates_in(:,2);
index = candidates_in(:,3);

%sort points by insertion sort
i = 2;
while i <= length(rho)
    t = theta(i);
    r = rho(i);
    n = index(i)
    j = i - 1;

    while j >= 1 && rho(j) < r
        theta(j+1) = theta(j);
        rho(j+1) = rho(j);
        index(j+1) = index(j);
        j = j - 1;
    end
    
    theta(j+1) = t;
    rho(j+1) = r;
    index(j+1) = n;
    i = i + 1;
end

candidates_out = [theta rho index]

end

