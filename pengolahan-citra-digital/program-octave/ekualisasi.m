% EKUALISASI Contoh untuk melakukan ekualisasi histogram

Img = imread('images/gembala.tif');
[jum_baris, jum_kolom] = size(Img);

L = 256;
Histog = zeros(L, 1);
for baris=1 : jum_baris
    for kolom=1 : jum_kolom
        Histog(Img(baris, kolom)+1) = ...
            Histog(Img(baris, kolom)+1) + 1;
    end
end
 
alpha = (L-1) / (jum_baris * jum_kolom);
 
C(1) = alpha * Histog(1);
for i=1 : L-2
    C(i+1) = C(i) + round(alpha * Histog(i+1));
end
 
for baris=1 : jum_baris
    for kolom=1 : jum_kolom
        Hasil(baris, kolom) = C(Img(baris, kolom));
    end
end
 
Hasil = uint8(Hasil);
subplot(2,2,1),imshow(Img),subplot(2,2,2),imshow(Hasil);
subplot(2,2,3),imhist(Img),subplot(2,2,4),imhist(Hasil);
