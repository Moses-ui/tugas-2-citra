function [imageConv] = convolution(image, mask)
    imageConv = image;
    sumMask = sum(mask, "all");
    if sumMask ~= 0
        mask = mask / sumMask;
    end
    [iImage, jImage, kImage] = size(image);
    skip = floor(size(mask, 1) / 2);
    for k=1:kImage
        for i=1+skip:iImage-skip
            for j=1+skip:jImage-skip
                imageConv(i,j,k) = sum(image(i-skip:i+skip, j-skip:j+skip, k).*mask, "all");
            end
        end
    end
    imageConv = uint8(imageConv);
end