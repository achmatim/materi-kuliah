function G = perbesar(I, sy, sx)
% PERBESAR Melakukan operasi pembesaran citra.
%     Masukan: I = image
%              sy : skala pembesaran pada sumbu Y
%              sx : skala pembesaran pada sumbu X
%     Versi 1
 
[tinggi, lebar] = size(I);
 
tinggi_baru = tinggi * sy;
lebar_baru = lebar * sx;
 
F2 = double(I);
for y=1 : tinggi_baru
    y2 = ((y-1) / sy) + 1;
    for x=1 : lebar_baru
        x2 = ((x-1) / sx) + 1; 
        G(y, x) = I(floor(y2), floor(x2));
    end
end
 
G = uint8(G);
