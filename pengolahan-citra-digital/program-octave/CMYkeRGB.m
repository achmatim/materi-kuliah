function [R,G,B] = CMYkeRGB(C,M,Y,K)
% CMYkeRGB digunakan untuk mengonversi CMYK ke RGB
%    Berdasarkan Pratt (2001)
%    Dasar: b=1 dan u = 0,5
 
% Normalisasi CMY ke [0, 1]
C = double(C);
M = double(M);
Y = double(Y);
K = double(K);
if max(max(C)) > 1.0 || max(max(M)) > 1.0 || max(max(Y)) > 1.0 || max(max(K)) > 1.0
    C = double(C) / 255;
    M = double(M) / 255;
    Y = double(Y) / 255;
    K = double(K) / 255;
end
u = 0.5; b = 1;
[tinggi, lebar] = size(C);
for m=1: tinggi
    for n=1: lebar
        
        Kb = K(m,n) / b;
        if Kb == 1
            R(m,n)=0;
            G(m,n)=0;
            B(m,n)=0;
        else
            R(m,n) = 1 - (C(m, n) + u * Kb);
            G(m,n) = 1 - (M(m, n) + u * Kb);
            B(m,n) = 1 - (Y(m, n) + u * Kb);
        end
    end
end
 
% Konversikan ke jangkauan [0,255]
R = uint8(R * 255);
G = uint8(G * 255);
B = uint8(B * 255);


