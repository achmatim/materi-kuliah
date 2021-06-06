function [G] = multithresh(F, t1, t2)
% Pengambanan dengan dua nilai ambang
%     F = Citra berskala keabuan
%     t1 = nilai ambang bawah
%     t2 = nilai ambang atas
%
% Keluaran: G = Citra biner
 
[m, n] = size(F);
for i=1 : m
    for j=1:n
        if F(i,j) <= t1 || F(i,j) >= t2
            G(i,j) = 0;
        else
            G(i,j) = 1;
        end
    end
end
G = logical(G);

