function bin = binary_image(img)
%convert image in binary matrix
grayImg = rgb2gray(img);
bin = imbinarize(grayImg, 'adaptive','Sensitivity', 0.6);
end

