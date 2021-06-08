function queryzer(berkas)
% QUERYZER Berguna untuk melakukan query dengan
%     menggunakan momen Zernike.
 
% Citra yang akan menjadi acuan
Citra{1} = 'images/ikan-4.png';
Citra{2} = 'images/ikan-2.png';
Citra{3} = 'images/ikan-3.png';
Citra{4} = 'images/ikan-1.png';
Citra{5} = 'images/guppi-4.png';
Citra{6} = 'images/guppi-2.png';
Citra{7} = 'images/guppi-3.png';
Citra{8} = 'images/guppi-1.png';
 
% Proses momen Zernike dan hitung jarak City-block
Query = im2bw(imread(berkas), 0.5);
ZQuery = zermoment(Query, 4);
Hasil = [];
for i=1 : length(Citra)
    disp(sprintf('proses terhadap citra %s', Citra{i}));
    Ref = im2bw(imread(Citra{i}), 0.5);
    ZRef = zermoment(Ref, 4);
    
    jarak = 0;
    for j=1 : length(ZRef)
        jarak = jarak + abs(ZRef(j) - ZQuery(j));
    end
    
    Hasil(i).nama = Citra{i};
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
 
% Tampilkan hasil
disp('Hasil pencocokan: ');
for i=1 : jum
   disp(sprintf('Citra %s - Jarak: %f',Hasil(i).nama, ...
                                       Hasil(i).jarak)); 
end
