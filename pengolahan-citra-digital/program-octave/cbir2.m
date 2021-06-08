function cbir2(berkas)
% CBIR - contoh aplikasi pencarian citra (content-based image retrieval)
% Fitur yang digunakan adl momenhu
% CBIR adl modifikasi dari QUERYZER 
 
% Citra yang akan menjadi acuan
load('dbfitur.mat');
 
% Proses ekstraksi fitur momenhu dan hitung jarak City-block
Query = im2bw(imread(berkas), 0.5);
huQuery = momenhu(Query);
huQ = [struct2cell(huQuery){:}];
Hasil = [];
jumFitur = length(Fitur(1).momen);
for i=1 : length(Fitur)
    nama = Fitur(i).nama;

    huR = Fitur(i).momen;
    jarak = 0;
    %for j=1 : length(ZRef)
    %    jarak = jarak + abs(ZRef(j) - ZQuery(j));
    %end
    jarak = pdist2(huR, huQ);
    
    Hasil(i).nama = nama;
    Hasil(i).jarak = jarak;
end
 
% Urutkan data pada array Hasil
jum = length(Hasil);
for p = 2: jum
    x = Hasil(p);
 
    % Sisipkan x ke dalam data[1..p-1]
    q = p - 1;
    ketemu = 0;
 
    while ((q >= 1) && (~ketemu))
        if (x.jarak < Hasil(q).jarak)
            Hasil(q+1) = Hasil(q);
            q = q - 1;
        else
            ketemu = 1;
        end
        
        Hasil(q+1) = x;
    end
end
 
% Tampilkan hasil secara visual
disp('Hasil pencocokan dapat dilihat pada jendela gambar');
subplot(3,3,1); 
G = imread(berkas); imshow(G);
title('Query');
for i=1 : jum
   subplot(3,3, i+1); 
   G = imread(['images/train/' char(Hasil(i).nama) ]); imshow(G);
   title(num2str(Hasil(i).jarak));
end

