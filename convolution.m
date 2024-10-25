function [imageConv] = convolution(image, mask)
    imageConv = double(image);
    sumMask = sum(mask, "all");
    if sumMask ~= 0
        mask = mask / sumMask;
    end
    [iImage, jImage, kImage] = size(image);
    skip = floor(size(mask, 1) / 2);
    for k=1:kImage
        for i=1+skip:iImage-skip
            for j=1+skip:jImage-skip
                value = double(image(i-skip:i+skip, j-skip:j+skip, k)).*mask;
                value = sum(value, "all");
                imageConv(i,j,k) = double(uint8(value));
            end
        end
    end
    for k=1:kImage
        imageConv(:,:,k) = imageConv(:,:,k) / max(imageConv(:,:,k), [], "all");
    end
end