function F = glpf(berkas, d0)
% GLPF Digunakan untuk melaksanakan pemfilteran 
%     pada kawasan frekuensi menggunakan GLPF.
%     Masukan: 
%        berkas - nama citra
%        d0 - menentukan frekuensi ambang
%     Keluaran:
%        F - citra yang telah difilter
 
Fs = double(imread(berkas));
[a, b] = size(Fs);  %Peroleh ukuran citra
 
% Menentukan ukuran baru untuk perluasan citra
r = nextpow2(2 * max(a, b));
p = 2 ^ r;
q = p;
 
% Menentukan jangkauan frekuensi u dan v
u = 0:(p - 1);
v = 0:(q - 1);
 
% Hitung indeks untuk meshgrid
idx = find(u > q/2);
u(idx) = u(idx) - q;
idy = find(v > p/2);
v(idy) = v(idy) - p;
 
% Peroleh array meshgrid
[V, U] = meshgrid(v, u);
 
% Hitung jarak D(v,u)
D = sqrt(V.^2 + U.^2);
 
% Menentukan n kalau n tidak disebutkan
if nargin == 2
   n = 1;
end
 
ambang = d0 * p;  % Hitung frekuensi ambang
Hf = exp(-(D.^2) ./ (2 * ambang ^ 2));
 
% Transformasi via FFT dengan zero padding
Ff = fft2(Fs, p, q);
 
% Pemfilteran
G = Hf .* Ff;
 
% Transformasi balik
F = real(ifft2(G));
F = uint8(F(1:a, 1:b));
