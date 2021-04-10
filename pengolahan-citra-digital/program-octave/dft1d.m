function [Re, Im] = dft1d(Fx)
% DFT1D Digunakan untuk memperoleh DFT dimensi satu.
% Hasil: Re berisi bagian real dan
%        Im berisi bagian imajiner
 
n = length(Fx); % Jumlah nilai dalam fungsi Fx
for u = 0 : n - 1
    Re(u+1) = 0;
    Im(u+1) = 0;
    for x = 0 : n - 1
        radian = 2 * pi * u * x / n;
        cosr = cos(radian);
        sinr = -sin(radian);
        Re(u+1) = Re(u+1) + Fx(x+1) * cosr;
        Im(u+1) = Im(u+1) + Fx(x+1) * sinr;
    end
    
    Re(u+1) = Re(u+1) / n;
    Im(u+1) = Im(u+1) / n;
end
