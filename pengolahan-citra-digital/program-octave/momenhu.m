function [Momen] = momenhu(F)
% MOMENHU Menghitung momen HU.
%     Masukan: F = citra berskala keabuan
%     Keluaran: Momen = 7 momen Hu

norm_20 = normomen(F, 2, 0);
norm_02 = normomen(F, 0, 2);
norm_11 = normomen(F, 1, 1);
norm_30 = normomen(F, 3, 0);
norm_12 = normomen(F, 1, 2);
norm_21 = normomen(F, 2, 1);
norm_03 = normomen(F, 0, 3);

Momen.m1 = norm_20 + norm_02;

Momen.m2 = (norm_20 - norm_02)^2 + 4 * norm_11^2;       

Momen.m3 = (norm_30 + 3 * norm_12)^2 + (3 * norm_21 - norm_03)^2;   

Momen.m4 = (norm_30 + norm_12)^2 + (norm_21 + norm_03)^2;            

Momen.m5 = (norm_30 - 3 * norm_12) * (norm_30 + norm_12) *  ...
     ((norm_30 + norm_12)^2 - 3 * (norm_21 + norm_03)^2) + ...
     (3 * norm_21 - norm_03) * (norm_21 + norm_03) * ...
     (3 * (norm_30 + norm_12)^2 -(norm_21 + norm_03)^2);

Momen.m6 = (norm_20 - norm_02) * ((norm_30 + norm_12)^2 - ...
     (norm_21 + norm_03)^2) + ...
     4 * norm_11 * (norm_30 + norm_12) * ...
     (norm_21 + norm_03); 
            
Momen.m7 = (3 * norm_21 + norm_30) * (norm_30 + norm_12) * ...
     ((norm_30 + norm_12)^2 - 3 * (norm_21 + norm_03)^2) + ...
     (norm_30 - 3 * norm_12) * (norm_21 + norm_03) * ...
     (3 * (norm_30 + norm_12)^2 - (norm_21 + norm_03)^2);
 
