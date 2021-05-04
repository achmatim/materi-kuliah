function [pusat_x, pusat_y] = centroid(BW)
% CENTROID Untuk memperoleh pusat massa sebuah objek
%    yang terletak pada citra biner BW
 
[tinggi, lebar] = size(BW);
 
pusat_x = 0;
pusat_y = 0;
luas = 0;
for q = 1 : tinggi
   for p = 1 : lebar
      if BW(q, p) == 1
         luas = luas + 1;
         pusat_x = pusat_x + p;
         pusat_y = pusat_y + q;
      end
   end
end
 
pusat_x = pusat_x / luas;
pusat_y = pusat_y / luas;
