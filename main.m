image = imread("images\grayscale\ferris-wheel.jpg");
imageRgb = imread("images\rgb\forest.jpg");

imageModified = saltPepperReduction(image, "alphaTrimmedMean", 3, 4);
imageRgbModified = saltPepperReduction(imageRgb, "median", 3);

figure; imshow(image);
figure; imshow(imageModified);
figure; imshow(imageRgb);
figure; imshow(imageRgbModified);