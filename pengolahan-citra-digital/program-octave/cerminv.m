function G = cerminv(F)
% CERMINV Berfungsi untuk mencerminkan citra 
%     secara vertikal
%     Masukan: F = Citra berskala keabuan
 
[tinggi, lebar] = size(F);
 
for y=1 : tinggi
    for x=1 : lebar
        x2 = x;
        y2 = tinggi - y + 1;
        
        G(y, x) = F(y2, x2); 
    end
end
 
G = uint8(G);
