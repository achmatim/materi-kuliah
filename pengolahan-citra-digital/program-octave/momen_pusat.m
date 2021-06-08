function [hasil] = momen_pusat(F, p, q)
% MOMEN_PUSAT Menghitung moment pusat berorde p, q

[m, n] = size(F);
m00 = momen_spasial(F, 0, 0);

xc = momen_spasial(F, 1, 0) / m00;
yc = momen_spasial(F, 0, 1) / m00;

mpq = 0;
for y=1 : m
    for x=1 : n
        if F(y,x) ~= 0
            mpq = mpq + (x-xc)^p * (y-yc)^q;
        end
    end
end

hasil = mpq;
