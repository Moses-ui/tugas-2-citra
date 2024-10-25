image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

imageModified = spatialSmoothing(image, 7, "gaussian");
imageRgbModified = spatialSmoothing(imageRgb, 7, "gaussian");

figure; imshow(image);
figure; imshow(imageModified);
figure; imshow(imageRgb);
figure; imshow(imageRgbModified);