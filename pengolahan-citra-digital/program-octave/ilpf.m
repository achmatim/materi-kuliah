function F = ilpf(berkas, d0)
% ILPF Digunakan untuk melaksanakan pemfilteran
%     pada kawasan frekuensi menggunakan ILPF.
%     Masukan: 
%         berkas - nama citra
%         d0 - menentukan frekuensi ambang
%     Keluaran:	
%         F - citra yang telah difilter
 
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

[V, U] = meshgrid(v, u); % Peroleh array meshgrid
D = sqrt(V.^2 + U.^2); % Hitung jarak D(v,u)
ambang = d0 * q;  % Hitung frekuensi ambang sebesar d0 kali lebar citra

Hf = double(D <= ambang); % Peroleh fungsi transfer
Ff = fft2(Fs, p, q); % Transformasi via FFT dengan zero padding
G = Hf .* Ff; % Pemfilteran
% Transformasi balik
F = real(ifft2(G));
F = uint8(F(1:a, 1:b));

