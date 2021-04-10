function [biner] = im2bw(img)
  [baris,kolom] = size(img);
  biner = zeros(baris,kolom);
  ambang = 210;
  for i=1:baris,
    for j=1:kolom,
      if img(i,j) < ambang,
        biner(i,j) = 0;
      else
        biner(i,j) = 1;
      endif
    endfor
  endfor
  
