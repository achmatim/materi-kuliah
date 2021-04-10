function G = rotasi4(I, sudut, m, n)
% ROTASI Versi 4: Melakukan Operasi pemutaran citra.
% Rotasi dengan titik pusat rotasi (m,n)

[tinggi, lebar] = size(I);
rad = pi * sudut/180;
cosa = cos(rad);
sina = sin(rad);
F = I;
G=zeros(tinggi, lebar);
 
for y=1 : tinggi
    for x=1 : lebar    
        x2 = (x-n) * cosa + (y-m) * sina + n;        
        y2 = (y-m) * cosa - (x-n) * sina + m;     
        if (x2>=1) && (x2<=lebar) && (y2>=1) && (y2<=tinggi)
           % Lakukan interpolasi bilinear 
           p = floor(y2);
           q = floor(x2);
           a = y2-p;
           b = x2-q;
           if (x2==lebar) || (y2 == tinggi)
              G(y, x) = F(y2, x2);
           else
              intensitas = (1-a)*((1-b)*F(p,q) +  ...
              b * F(p, q+1)) + a *((1-b)* F(p+1, q) + b * F(p+1, q+1));
              G(y, x) = intensitas;
           end
        else   
           G(y, x) = 0;
        end
    end
end
G = uint8(G);
