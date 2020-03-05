function mean = test_zones(img, center, angle, u)
    %define the test zones
    test_zone1 = [-0.5*u u; -0.5*u 2*u; 0.5*u 2*u; 0.5*u u];
    test_zone2 = [-0.5*u -u; -0.5*u -2*u; 0.5*u -2*u; 0.5*u -u];
    
    %rotate
    test_zone1 = test_zone1*[cosd(angle) sind(angle); -sind(angle) cosd(angle)];
    test_zone2 = test_zone2*[cosd(angle) sind(angle); -sind(angle) cosd(angle)];
    
    %translation
    test_zone1 = test_zone1 + [center(1)*ones(4, 1) center(2)*ones(4,1)];
    test_zone2 = test_zone2 + [center(1)*ones(4, 1) center(2)*ones(4,1)];
    
    plot(test_zone1(:,1), test_zone1(:,2), 'b*');
    plot(test_zone2(:,1), test_zone2(:,2), 'b*');
    
    %quantify
    test1 = quantify_test_zone(img, test_zone1);
    test2 = quantify_test_zone(img, test_zone2);
    
    %get mean
    mean = (test1 + test2)/2;
end

