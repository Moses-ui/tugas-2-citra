image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

% [imageModified, noise] = saltPepperReduction(image, "min", 3);
imageModified = brighteningFrequency(image, 2, 10);
% [imageRgbModified, noiseRgb] = saltPepperReduction(imageRgb, "min", 3);

% figure; imshow(noise);
figure; imshow(image);
figure; imshow(imageModified);
% figure; imshow(noiseRgb);
% figure; imshow(imageRgbModified);