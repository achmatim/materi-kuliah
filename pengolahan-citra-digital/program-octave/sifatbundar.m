function [c] = sifatbundar(BW)
% SIFATBUNDAR Digunakan untuk memperoleh fitur sifat bundar.
%     Masukan: BW adalah citra biner.

reg = regionprops(BW);
px = reg.Centroid(1); py = reg.Centroid(2);
[m, n] = size(BW);
bn = bwboundaries(BW);
Kontur = bn{1,1};
% Hapus elemen terakhir
Kontur(length(Kontur),:) = [];
jum =length(Kontur);
% Hitung mu
total = 0;
for i=1 : jum
    total =  total + sqrt( (Kontur(i,1)-py)^2 + (Kontur(i,2)-px)^2);
end
mu = total / jum;
% Hitung sigma
total = 0;
 
for i=1 : jum
    total =  total + (sqrt( (Kontur(i,1)-py)^2 + (Kontur(i,2)-px)^2) - mu) ^ 2;
end
sigma = total / jum;
c = mu / sigma;
