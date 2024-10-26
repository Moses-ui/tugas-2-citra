function [imageBlur] = blurDeconvolution(image, len, deg)
    H = fspecial("motion", len, deg);
    motionBlur = imfilter(image, H, 'replicate');
    figure; imshow(motionBlur);
end