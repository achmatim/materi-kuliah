function [Y, Cb, Cr] = RGBkeYCB(R,G,B)
% RGBkeYCB digunakan untuk mengonversi RGB ke YCbCr
 
% Normalisasi RGB ke [0, 1]
R = double(R);
G = double(G);
B = double(B);
 
if max(max(R)) > 1.0 || max(max(G)) > 1.0 || max(max(B)) > 1.0
    R = double(R) / 255;
    G = double(G) / 255;
    B = double(B) / 255;
end
[tinggi, lebar] = size(R);
for m=1: tinggi
    for n=1: lebar
        Y(m,n)=0.299*R(m,n)+0.587*G(m,n)+ 0.114*B(m,n);
        Cb(m,n)=-0.1687*R(m,n)-0.33126*G(m,n)+0.5*B(m,n);
        Cr(m,n)=0.5*R(m,n)-0.41869*G(m,n)-0.08131*B(m,n);
    end
end
Y = Y * 255;
Cb = Cb * 255;
Cr = Cr * 255;
