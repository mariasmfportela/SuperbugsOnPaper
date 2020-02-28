function output = get_all_corners(binImg, rect)

figure;
%coefs = detect_corner(binImg, rect, 1);

% %%%%%%DETECT UPPER LEFT CORNER%%%%%%
% valid = false; %tells if corner has been found correctly
% k = 0.5; %determine size of region of interest
% iteration = 1; %iteration tracker to adjust coefficient k accordingly
% 
% while ~valid
%     f = 0.25; %factor to decide if there are enough data points for linear fit
%     if gradient_changes == 1 && idx > f*length(corners) && idx < (1-f)*length(corners)
%         %one corner found and enough data points for accurate linear fit
%               
%     else
%         %none or more than one corner found: adjust the region of interest
%         k = k + 0.05*((-1)^iteration)*iteration;
%         iteration = iteration + 1;
%     end
% end


end

