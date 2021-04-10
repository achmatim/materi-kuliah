function Fx = idft1d(Fu)
% IDFT1D Digunakan untuk melaksanakan transformasi balik
%    1D DFT.
%    Masukan: Fu berupa bilangan kompleks

 
n = length(Fu); % Jumlah nilai dalam fungsi Fu
for u = 0 : n - 1
    Fx(u+1) = 0;
    for x = 0 : n - 1
        radian = 2 * pi * u * x / n;
        cosr = cos(radian);
        sinr = sin(radian);
        Fx(u+1) = Fx(u+1) + Fu(x+1) * (cosr+ j*sinr);
    end
end
 
Fx = real(Fx); % Peroleh bagian real

