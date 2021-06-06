function [Stat] = stattekstur(F)
% STATTEKSTUR Memperoleh statistika tekstur.
%     Masukan: F = citra berskala keabuan.
%     Keluaran: Stat = berisi statistika tekstur
%     Didasarkan pada Gonzalez, Woods, dan Eddins, 2004
 
[m, n] = size(F);
 
% Hitung frekuensi aras keabuan
L = 256;
Frek = zeros(L,1);
F = double(F);
for i = 1 : m
    for j = 1 : n
        intensitas = F(i,j); 
       
        Frek(intensitas+1) = Frek(intensitas+1) + 1;
    end
end
 
% Hitung probabilitas
jum_piksel = m * n;
for i=0 : L-1
    Prob(i+1) = Frek(i+1) / jum_piksel;
end
 
% Hitung mu
mu = 0;
for i=0 : L-1
    mu = mu + i * Prob(i+1);    
end
 
% Hitung deviasi standar
varians = 0;
for i=0 : L-1
   varians = varians + (i - mu)^2 * Prob(i+1);    
end
deviasi = sqrt(varians);
varians_n = varians / (L-1)^2; % Normalisasi
 
% Hitung skewness
skewness = 0;
for i=0 : L-1
   skewness = skewness + (i - mu)^3 * Prob(i+1);    
end
skewness = skewness / (L-1)^2;
 
% Energi (Keseragaman)
energi = 0;
for i=0 : L-1
   energi = energi + Prob(i+1)^2;    
end
 
% Entropi
entropi = 0;
for i=0 : L-1
   if Prob(i+1) ~= 0 
       entropi = entropi + Prob(i+1) * log(Prob(i+1));        
   end
end
 
entropi = -entropi;
 
% Hitung R atau Smoothness
smoothness = 1 - 1 / (1 + varians_n);
 
Stat.mu = mu;
Stat.deviasi = deviasi;
Stat.skewness = skewness;
Stat.energi = energi;
Stat.entropi = entropi;
Stat.smoothness = smoothness;
