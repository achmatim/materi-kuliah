function [Re, Im] = dft2d(berkas)
% DFT2D Digunakan untuk memperoleh DFT dimensi dua.
%     Masukan: nama berkas berskala keabuan
%     Hasil: Re berisi bagian real dan
%            Im berisi bagian imajiner
 
Fx = double(imread(berkas));
[m, n] = size(Fx); % Ukuran citra
                   % m = jumlah baris
                   % n = jumlah kolom
for v = 0 : m -1                   
    for u = 0 : n - 1
        Re(v+1, u+1) = 0;
        Im(v+1, u+1) = 0;
        for y = 0 : m - 1
            for x = 0 : n - 1
                radian = 2 * pi * (u * x / n + v * y / m);
                cosr = cos(radian);
                sinr = -sin(radian);
                Re(v+1, u+1) = Re(v+1, u+1) + Fx(y+1, x+1) * cosr;
                Im(v+1, u+1) = Im(v+1, u+1) + Fx(y+1, x+1) * sinr;
            end
        end
    end
end
