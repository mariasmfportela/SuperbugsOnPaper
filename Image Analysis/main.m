I = imread("images/mock1.jpg");
imshow(I);

G = rgb2gray(I);
imshow(G);

E = edge(G, 'canny');

figure;
imshow(E);