function [hasil] = momen_spasial(F, p, q)
% MOMEN_SPASIAL Menghitung momen spasial berorde (p,q).

[m, n] = size(F);
momenPQ = 0;
for y=1 : m
    for x=1 : n
        if F(y,x) ~= 0
            momenPQ = momenPQ + x^p * y^q; 
        end
    end
end

hasil = momenPQ;