function [imageSmoothed] = spatialSmoothing(image, filterSize, mode)
    if strcmp(mode, "mean")
        imageSmoothed = convolution(image, ones(filterSize));
    elseif strcmp(mode, "gaussian")
        m = filterSize; n = m;
        sigma = 1; % fixed value
        [x, y] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
        g = exp(-(x.^2+y.^2) / (2*sigma^2));
        mask = g ./ sum(g(:));
        imageSmoothed = convolution(image, mask);
    end
end