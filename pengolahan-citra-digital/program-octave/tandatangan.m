function [Jarak] = tandatangan(BW)
% TANDATANGAN Digunakan untuk memperoleh jarak-jarak antara
%     piksel dalam batas objek dri citra biner BW
%     Keluaran: Jarak - Berisi sejumlah pasangan Y, X
%     yang menyatakan jarak          
 
[m,n] = size(BW);
bn = bwboundaries(BW);
Batas = double(bn{1,1});

[jum, z] = size(Batas);
reg = regionprops(BW);
cen = reg.Centroid;
pusat_x = cen(1); pusat_y = cen(2);
 
Jarak = zeros(1,m);
for p=1 : jum
    Jarak(p) = sqrt((Batas(p,1)-pusat_y)^2 + ...
                    (Batas(p,2)-pusat_x)^2);
end
imshow(BW);
% Plot jarak
X = 1: p;
figure, plot(X, Jarak);
