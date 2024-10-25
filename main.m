image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
imageModified = convolution(image, mask);
imageRgbModified = convolution(imageRgb, mask);

f = [4 4 3 5 4; 6 6 5 5 2; 5 6 6 6 2; 6 7 5 5 3; 3 5 2 4 4];
g = [0 -1 0; -1 4 -1; 0 -1 0];

h = convolution(f, g);

% figure; imshow(image);
% figure; imshow(imageModified);
% figure; imshow(imageRgb);
% figure; imshow(imageRgbModified);