function candidates_out = select_candidates(candidates_in,x0,y0)
t_tol = 5; %degrees
r_tol = mean(candidates_in(:,2))/10; %tolerance

% [x,y] = pol2cart(candidates_in(:,1), candidates_in(:,2));
% plot(x + x0, y + y0, 'y*');

% find 4 candidates at similar distances from origin and at angles of 90 to
% each other
for i = 1:(length(candidates_in)-3)
    theta = candidates_in(i,1)*180/pi;
    t = mod(theta, 90);
    rho = candidates_in(i,2);
    
    points = candidates_in(i,:);
    quadrants_filled = zeros(1,4);
    
    quadrants_filled(quadrant(theta)) = true;
    for j = (i+1):length(candidates_in)
        d = candidates_in(j,2);
        a = candidates_in(j,1)*180/pi;
        if d > rho - r_tol && d < rho + r_tol && mod(a,90) > t - t_tol && mod(a,90) < t + t_tol && quadrants_filled(quadrant(a)) == 0
            points = [points; candidates_in(j,:)];
            quadrants_filled(quadrant(a)) = true;
        end

        if length(points) == 4 && all(quadrants_filled)
            candidates_out = points;
            break;
        end
    end
end

end

