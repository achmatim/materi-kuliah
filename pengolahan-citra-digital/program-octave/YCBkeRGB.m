function [R, G, B] = YCBkeRGB(Y,Cb,Cr)
% YCBkeRGB digunakan untuk mengonversi YCbCr ke RGB
 
% Normalisasi Y, Cb, Cr ke [0, 1]
Y = double(Y);
Cr = double(Cr);
Cb = double(Cb);
 
if max(max(Y)) > 1.0 || max(max(Cb)) > 1.0 || ...
   max(max(Cr)) > 1.0
    Y = double(Y) / 255;
    Cr = double(Cr) / 255;
    Cb = double(Cb) / 255;
end
 
[tinggi, lebar] = size(Y);
for m=1: tinggi
    for n=1: lebar
        R(m,n) = Y(m,n) + 1.402 * Cr(m,n);
        G(m,n)= Y(m,n)-0.34414*Cb(m,n)-0.71414*Cr(m,n);
        B(m,n)= Y(m,n) + 1.7720 * Cb(m,n);
    end
end
 
R = uint8(R * 255);
G = uint8(G * 255);
B = uint8(B * 255);
