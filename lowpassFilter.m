function [imageResult] = lowpassFilter(image, D0, mode, inv)
    imageResult = image;
    [M, N, rgb] = size(image);
    P = 2*M;
    Q = 2*N;

    % set up range of variables
    u = 0:(P-1);
    v = 0:(Q-1);

    % compute the indices for use in meshgrid
    idx = find(u>P/2);
    u(idx) = u(idx) - P;
    idy = find(v>Q/2);
    v(idy) = v(idy) - Q;

    % compute the meshgrid arrays
    [V,U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);

    switch mode
        case "ilpf"
            H = double(D <= D0);
        case "glpf"
            H = exp(-(D.^2)./(2*(D0^2)));
        case "blpf"
            n = 1;
            H = 1./(1+(D./D0).^(2*n));
    end

    if inv % for highpass filter
        H = 1-H;
    end

    H = fftshift(H);

    for iRgb=1:rgb
        F = fftshift(fft2(image(:,:,iRgb), P, Q));
        G = H.*F;
        G1 = ifftshift(G);
        G2 = real(ifft2(G1));
        G2 = G2(1:M, 1:N);
        imageResult(:,:,iRgb) = G2;
    end
end