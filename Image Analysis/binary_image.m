function bin = binary_image(img)
%convert image in binary matrix
grayImg = rgb2gray(img);
bin = imbinarize(grayImg, 'adaptive');

end

