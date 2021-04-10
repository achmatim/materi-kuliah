function G = cerminh(F)
% CERMINH Berfungsi untuk mencerminkan citra 
%     secara horizontal
%     Masukan: F = Citra berskala keabuan
 
[tinggi, lebar] = size(F);
 
for y=1 : tinggi
    for x=1 : lebar
        x2 = lebar - x + 1;
        y2 = y;
        
        G(y, x) = F(y2, x2); 
    end
end
 
G = uint8(G);
