function G = perbesar2(berkas, sy, sx)
% PERBESAR2 Melakukan operasi pembesaran citra 
%     dengan interpolasi.
%     Masukan: berkas = nama berkas image
%              sy : skala pembesaran pada sumbu Y
%              sx : skala pembesaran pada sumbu X
 
F = imread(berkas);
[tinggi, lebar] = size(F);
 
tinggi_baru = round(tinggi * sy);
lebar_baru = round(lebar * sx);
 
F2 = double(F);
for y=1 : tinggi_baru
    y2 = (y-1) / sy + 1;
    for x=1 : lebar_baru
        x2 = (x-1) / sx + 1; 
        % Lakukan interpolasi bilinear 
        p = floor(y2);
        q = floor(x2);
        a = y2-p;
        b = x2-q;
 
        if (floor(x2)==lebar) || (floor(y2) == tinggi)
            G(y, x) = F(floor(y2), floor(x2));
        else
            intensitas = (1-a)*((1-b)*F(p,q) +  ...
            b * F(p, q+1)) + a *((1-b)* F(p+1, q) + b * F(p+1, q+1));
            G(y, x) = intensitas;
        end
    end
end
G = uint8(G);

