function F = filterdft(berkas, H)
% FILTERDFT Digunakan untuk melaksanakan pemfilteran
% pada kawasan frekuensi menggunakan FFT.
%     Masukan: 
%        berkas - nama citra
%        H - kernel pada kawasan spasial
%     Keluaran:
%        F - citra yang telah difilter
 
Fs = double(imread(berkas));
[a, b] = size(Fs);  %Peroleh ukuran citra
 
% Menentukan ukuran baru untuk perluasan citra
r = nextpow2(2 * max(a, b));
p = 2 ^ r;
q = p;
 
% Transformasi via FFT dengan zero padding
Ff = fft2(Fs, p, q);
Hf = fft2(H, p, q);

% Konvolusi
G = Hf .* Ff;

% Peroleh citra hasil pemfilteran
F = real(ifft2(G));
F = uint8(F(1:a, 1:b));
