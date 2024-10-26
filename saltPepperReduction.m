function [imageResult, noise] = saltPepperReduction(image, mode, maskSize, q)
    imageResult = double(image);
    noise = double(imnoise(image, "salt & pepper", 0.02));
    [iImage, jImage, kImage] = size(noise);
    skip = floor(maskSize / 2);
    
    for k=1:kImage
        for i=1+skip:iImage-skip
            for j=1+skip:jImage-skip
                value = noise(i-skip:i+skip, j-skip:j+skip, k);
                switch mode
                    case "min"
                        value = min(value(:));
                    case "max"
                        value = max(value(:));
                    case "median"
                        value = median(value(:));
                    case "arithmeticMean"
                        value = sum(value(:))./(maskSize.^2);
                    case "geometric"
                        value = prod(value(:)).^(1./maskSize.^2);
                    case "harmonicMean"
                        value = (maskSize.^2)./sum(1./value(:));
                    case "contraHarmonicMean"
                        value = sum(value(:).^(q+1))/sum(value(:).^q);
                    case "midpoint"
                        value = (min(value(:)) + max(value(:)))./2;
                    case "alphaTrimmedMean"
                        value = sort(reshape(value, 1, [])); % reshape to row vector and sort by graylevel
                        value(1:floor(q/2)) = 0; % remove q/2 lowest value
                        value(end-floor(q./2)+1:end) = 0; % remove q/2 highest value
                        value = sum(value(:))./((maskSize.^2)-q);
                end
                imageResult(i,j,k) = value;
            end
        end
    end

    for k=1:kImage
        imageResult(:,:,k) = imageResult(:,:,k) / max(imageResult(:,:,k), [], "all");
    end
    noise = uint8(noise);
end