function G = rotasi5(I, sudut, m, n)
% ROTASI Melakukan Operasi pemutaran citra.
% Versi 3
% Rotasi dengan titik pusat rotasi (m,n) secara utuh

[tinggi, lebar] = size(I);

rad = pi * sudut/180;
cosa = cos(rad);
sina = sin(rad);
x11 = 1;     y11 = 1;
x12 = lebar; y12 = 1;
x13 = lebar; y13 = tinggi;
x14 = 1;     y14 = tinggi;

F=I;
m = floor(tinggi / 2); 
n = floor(lebar / 2); 
 
% Menentukan pojok
x21 = ((x11-n) * cosa + (y11-m) * sina + n);
y21 = ((y11-m) * cosa - (x11-n) * sina + m);         
 
x22 = ((x12-n) * cosa + (y12-m) * sina + n);
y22 = ((y12-m) * cosa - (x12-n) * sina + m);         
 
x23 = ((x13-n) * cosa + (y13-m) * sina + n);
y23 = ((y13-m) * cosa - (x13-n) * sina + m);         
 
x24 = ((x14-n) * cosa + (y14-m) * sina + n);
y24 = ((y14-m) * cosa - (x14-n) * sina + m);         
 
ymin = min([y21 y22 y23 y24]);
xmin = min([x21 x22 x23 x24]);
 
ymak = max([y21 y22 y23 y24]);
xmak = max([x21 x22 x23 x24]);
 
lebar_baru = xmak - xmin + 1;
tinggi_baru = ymak - ymin + 1;
tambahan_y = floor((tinggi_baru-tinggi)/2);
tambahan_x = floor((lebar_baru-lebar)/2);

F2=zeros(floor(tinggi_baru), floor(lebar_baru));
G = F2;
for y=1 : tinggi
   for x=1 : lebar
       F2(y+tambahan_y, x+tambahan_x) = F(y, x);
   end
end
 
% Putar citra
m = floor(tinggi_baru/2);
n = floor(lebar_baru/2);
 
for y=1 : tinggi_baru
    for x=1 : lebar_baru    
        x2 = round((x-n) * cosa + (y-m) * sina + n);        
        y2 = round((y-m) * cosa - (x-n) * sina + m);         
        
        if (x2>=1) && (x2<=lebar_baru) && ...
           (y2>=1) && (y2<=tinggi_baru)
           G(y, x) = F2(y2,x2);
        else
           G(y,x) = 0; 
        end
    end
end
 
G = uint8(G);
