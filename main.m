image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

imageModified = lowpassFilter(image, 50, "glpf", true);
imageRgbModified = lowpassFilter(imageRgb, 50, "blpf", true);

figure; imshow(image);
figure; imshow(imageModified);
figure; imshow(imageRgb);
figure; imshow(imageRgbModified);