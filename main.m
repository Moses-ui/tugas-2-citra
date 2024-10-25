image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
imageModified = convolution(image, mask);
imageRgbModified = convolution(imageRgb, mask);

figure; imshow(image);
figure; imshow(imageModified);
figure; imshow(imageRgb);
figure; imshow(imageRgbModified);