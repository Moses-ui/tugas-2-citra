image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

imageModified = brighteningFrequency(image, 2, 10);
imageRgbModified = brighteningFrequency(imageRgb, 2, 10);

figure; imshow(image);
figure; imshow(imageModified);
figure; imshow(imageRgb);
figure; imshow(imageRgbModified);