function [stat] = statwarna(I)
% STATWARNA Menghitung statistik warna pada citra RGB
%     Masukan:
%        berkas berupa citra warna (imread)
%     Nilai balik berupa statistik warna yang mencakup
%        rerata, deviasi standar, kecondongan, dan
%        kurtosis
 
RGB = double(I);
[m,n,d] = size(RGB);
if (d ~= 3)
    disp('Citra harus berupa citra berwarna');
    return;
end
 
% --- Peroleh warna
% Hitung warna rata-rata R, G, dan B
jum_r=0;
jum_g=0;
jum_b=0;
jum_piksel = m * n;
for baris = 1:m
    for kolom = 1:n
          jum_r = jum_r + RGB(baris, kolom, 1);
          jum_g = jum_g + RGB(baris, kolom, 2);
          jum_b = jum_b + RGB(baris, kolom, 3);
     end
end
 
% Hitung rerata
mean_r = jum_r / jum_piksel;
mean_g = jum_g / jum_piksel;
mean_b = jum_b / jum_piksel;
  
% Inisialisasi perhitungan deviasi standar,
%    skewness, dan kurtosis
jum_dev_r = 0;
jum_dev_g = 0;
jum_dev_b = 0;
  
jum_skew_r = 0;
jum_skew_g = 0;
jum_skew_b = 0;
  
jum_cur_r = 0;
jum_cur_g = 0;
jum_cur_b = 0;
  
for baris = 1:m
    for kolom = 1:n
        jum_dev_r = jum_dev_r + ...
            (RGB(baris, kolom,1) - mean_r)^2;
        jum_dev_g = jum_dev_g + ...
            (RGB(baris, kolom,2) - mean_g)^2;
        jum_dev_b = jum_dev_b + ...
            (RGB(baris, kolom,3) - mean_b)^2;
          
        jum_skew_r = jum_skew_r + ...
            (RGB(baris, kolom,1) - mean_r)^3;
        jum_skew_g = jum_skew_g + ...
            (RGB(baris, kolom,2) - mean_g)^3;
        jum_skew_b = jum_skew_b + ...
            (RGB(baris, kolom,3) - mean_b)^3;
          
        jum_cur_r = jum_cur_r + ...
            (RGB(baris, kolom,1) - mean_r)^4;
        jum_cur_g = jum_cur_g + ...
            (RGB(baris, kolom,2) - mean_g)^4;
        jum_cur_b = jum_cur_b + ...
            (RGB(baris, kolom,3) - mean_b)^4;
    end    
end
 
% Hitung deviasi standar
dev_r = sqrt(jum_dev_r/jum_piksel);
dev_g = sqrt(jum_dev_g/jum_piksel);
dev_b = sqrt(jum_dev_b/jum_piksel);
 
% Hitung skewness
skew_r = jum_skew_r/ (jum_piksel * (dev_r^3));
skew_g = jum_skew_g/ (jum_piksel * (dev_g^3));
skew_b = jum_skew_b/ (jum_piksel * (dev_b^3));
  
% Hitung kurtosis
cur_r = jum_cur_r / (jum_piksel * (dev_r^4)) - 3;
cur_g = jum_cur_g / (jum_piksel * (dev_g^4)) - 3;
cur_b = jum_cur_b / (jum_piksel * (dev_b^4)) - 3;
 
% Tentukan keluaran
stat.mean_r = mean_r;
stat.mean_g = mean_g;
stat.mean_b = mean_b;
 
stat.dev_r = dev_r;
stat.dev_g = dev_g;
stat.dev_b = dev_b;
 
stat.skew_r = skew_r;
stat.skew_g = skew_g;
stat.skew_b = skew_b;
 
stat.cur_r = cur_r;
stat.cur_g = cur_g;
stat.cur_b = cur_b;
