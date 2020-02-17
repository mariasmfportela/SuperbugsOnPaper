
clear all;
originalImage = imread("images/mock1.jpg");
grayImage = rgb2gray(originalImage);

binaryImage = imbinarize(grayImage);

cc = bwconncomp(binaryImage);
stats = regionprops(cc, grayImage, 'Area', 'BoundingBox');
minArea = size(originalImage,1)*size(originalImage, 2)*0.001;
idx = find([stats.Area] > minArea);
labelImage = ismember(labelmatrix(cc), idx);

figure;
imshowpair(binaryImage, originalImage, 'montage');
hold on;

squares = [];

for n = 1:size(stats,1)
    box = stats(n).BoundingBox;
    w = box(3);
    h = box(4);
    x = box(1);
    y = box(2);
    
    if w*h > minArea && round(w/h) == 1
        rectangle('Position', [x y w h], 'EdgeColor', 'r');
        squares = [squares [x y w h]];
    end
end


