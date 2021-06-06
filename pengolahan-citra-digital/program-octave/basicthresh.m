function [G] = basicthresh(I, t)
% basicthresh menerapkan basic (global) thresholding
%     I = Citra berskala keabuan
%     t = nilai ambang
% Keluaran: G = Citra biner
[m, n] = size(I);
for i=1 : m
    for j=1:n
        if I(i,j) <= t
            G(i,j) = 0;
        else
            G(i,j) = 1;
        end
    end
end
G = logical(G);

