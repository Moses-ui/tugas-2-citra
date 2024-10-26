function [imageResult] = brighteningFrequency(image, a, b)
    imageResult = image;
    [M, N, rgb] = size(image);

    H = fftshift(fft2(a, M, N));
    Nu = fftshift(fft2(b, M, N));

    for iRgb=1:rgb
        F = fftshift(fft2(image(:,:,iRgb)));
        G = H.*F + Nu;
        G1 = ifftshift(G);
        G2 = real(ifft2(G1));
        imageResult(:,:,iRgb) = G2;
    end
end