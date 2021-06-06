function [G0, G45, G90, G135] = glcm(F)
% GLCM Menghasilkan fitur GLCM.
%     Masukan:  F = Citra berskala keabuan
%     Keluaran: Fitur = fitur GLCM untuk beberapa sudut.
 
[tinggi, lebar] = size(F);
 
% --- Bentuk GLCM
GLCM0 = zeros(256, 256);
total_piksel0 = 0;
 
GLCM45 = zeros(256, 256);
total_piksel45 = 0;
 
GLCM90 = zeros(256, 256);
total_piksel90 = 0;
 
GLCM135 = zeros(256, 256);
total_piksel135 = 0;
 
for y=2: tinggi-1
    for x=2: lebar-1
         % --  Sudut 0
         a = F(y, x);
         b = F(y, x+1);
         GLCM0(a+1, b+1) = GLCM0(a+1, b+1) + 1;
         total_piksel0 = total_piksel0 + 1;
        
        % --  Sudut 45
        a = F(y, x);
        b = F(y-1, x+1);
        GLCM45(a+1, b+1) = GLCM45(a+1, b+1) + 1;
        total_piksel45 = total_piksel45 + 1;
        
        % --  Sudut 90 
        a = F(y, x);
        b = F(y-1, x);
        GLCM90(a+1, b+1) = GLCM90(a+1, b+1) + 1;
        total_piksel90 = total_piksel90 + 1;
        
        % --  Sudut 135
        a = F(y, x);
        b = F(y-1, x-1);
        GLCM135(a+1, b+1) = GLCM135(a+1, b+1) + 1;
        total_piksel135 = total_piksel135 + 1;
    end               
end
 
GLCM0 = GLCM0 / total_piksel0;
GLCM45 = GLCM45 / total_piksel45;
GLCM90 = GLCM90 / total_piksel90;
GLCM135 = GLCM135 / total_piksel135;
    
% --- Hitung ASM
asm0 = 0.0;
asm45 = 0.0;
asm90 = 0.0;
asm135 = 0.0;
for a=0 : 255
    for b=0 : 255
        asm0 = asm0 + (GLCM0(a+1, b+1) * GLCM0(a+1, b+1));
        asm45 = asm45 + (GLCM45(a+1, b+1) * GLCM45(a+1, b+1));
        asm90 = asm90 + (GLCM90(a+1, b+1) * GLCM90(a+1, b+1));
        asm135 = asm135 + (GLCM135(a+1, b+1) * GLCM135(a+1, b+1));
    end
end
    
% --- Hitung kontras
kontras0 = 0.0;
kontras45 = 0.0;
kontras90 = 0.0;
kontras135 = 0.0;
    
for a=0 : 255
    for b=0 : 255
        kontras0 = kontras0 + (a-b)*(a-b)*(GLCM0(a+1,b+1));
        kontras45 = kontras45 + (a-b)*(a-b)*(GLCM45(a+1,b+1));
        kontras90 = kontras90 + (a-b)*(a-b)*(GLCM90(a+1,b+1));
        kontras135 = kontras135 + (a-b)*(a-b)*(GLCM135(a+1,b+1));
    end    
end
    
% --- Hitung IDM
idm0 = 0.0;
idm45 = 0.0;
idm90 = 0.0;
idm135 = 0.0;
for a = 0: 255
    for b = 0 : 255
        idm0 = idm0 + (GLCM0(a+1, b+1) / (1+(a-b)*(a-b)));
        idm45 = idm45 + (GLCM45(a+1, b+1) / (1+(a-b)*(a-b)));
        idm90 = idm90 + (GLCM90(a+1, b+1) / (1+(a-b)*(a-b)));
        idm135 = idm135 + (GLCM135(a+1, b+1) / (1+(a-b)*(a-b)));
    end
end
 
% --- Hitung entropi
entropi0 = 0.0;
entropi45 = 0.0;
entropi90 = 0.0;
entropi135 = 0.0;
for a=0 : 255
    for b=0 : 255
        if (GLCM0(a+1, b+1) ~= 0)
            entropi0 = entropi0 - (GLCM0(a+1, b+1) * ...
                                   (log(GLCM0(a+1, b+1))));
        end
            
        if (GLCM45(a+1, b+1) ~= 0)
            entropi45 = entropi45 - (GLCM45(a+1, b+1) * ...
                                     (log(GLCM45(a+1, b+1))));
        end
            
        if (GLCM90(a+1, b+1) ~= 0)
            entropi90 = entropi90 - (GLCM90(a+1, b+1) * ...
                                     (log(GLCM90(a+1, b+1))));
        end
            
        if (GLCM135(a+1, b+1) ~= 0)
            entropi135 = entropi135 - (GLCM135(a+1, b+1) * ...
                                      (log(GLCM135(a+1, b+1))));
        end    
    end
end
    
% -- Hitung kovarians
% -- Hitung px [] dan py [] dulu
korelasi0 = 0.0;
px0 = 0;
py0 = 0;
reratax0 = 0.0;
reratay0 = 0.0;
stdevx0 = 0.0;
stdevy0 = 0.0;
    
korelasi45 = 0.0;
px45 = 0;
py45 = 0;
reratax45 = 0.0;
reratay45 = 0.0;
stdevx45 = 0.0;
stdevy45 = 0.0;
 
korelasi90 = 0.0;
px90 = 0;
py90 = 0;
reratax90 = 0.0;
reratay90 = 0.0;
stdevx90 = 0.0;
stdevy90 = 0.0;
    
korelasi135 = 0.0;
px135 = 0;
py135 = 0;
reratax135 = 0.0;
reratay135 = 0.0;
stdevx135 = 0.0;
stdevy135 = 0.0;
        
for a=0 : 255
    for b=0: 255
         px0 = px0 + a * GLCM0 (a+1, b+1);  
         py0 = py0 + b * GLCM0 (a+1, b+1);
            
         px45 = px45 + a * GLCM45 (a+1, b+1);  
         py45 = py45 + b * GLCM45 (a+1, b+1);
            
         px90 = px90 + a * GLCM90 (a+1, b+1);  
         py90 = py90 + b * GLCM90 (a+1, b+1);
            
         px135 = px135 + a * GLCM135 (a+1, b+1);  
         py135 = py135 + b * GLCM135 (a+1, b+1);
    end                  
end
    
% Hitung deviasi standar
for a=0 : 255
    for b=0 : 255
        stdevx0 = stdevx0 + (a-px0) * (a-px0) * GLCM0(a+1, b+1);
        stdevy0 = stdevy0 + (b-py0) * (b-py0) * GLCM0(a+1, b+1);
            
        stdevx45 = stdevx45 + (a-px45) * ...
                              (a-px45) * GLCM45(a+1, b+1);
        stdevy45 = stdevy45 + (b-py45) * ...
                              (b-py45) * GLCM45(a+1, b+1);
            
        stdevx90 = stdevx90 + (a-px90) * ...
                              (a-px90) * GLCM90(a+1, b+1);
        stdevy90 = stdevy90 + (b-py90) * ...
                              (b-py90) * GLCM90(a+1, b+1);
            
        stdevx135 = stdevx135 + (a-px135) * ...
                                (a-px135) * GLCM135(a+1, b+1);
        stdevy135 = stdevy135 + (b-py135) * ...
                                (b-py135) * GLCM135(a+1, b+1);    
    end 
end
   
% Hitung korelasi
for a = 0 : 255
    for b = 0 : 255
        korelasi0 = korelasi0 + ((a-px0)*(b-py0)* ...
             GLCM0 (a+1, b+1)/(stdevx0*stdevy0));
        korelasi45 = korelasi45 + ((a-px45)*(b-py45)* ...
             GLCM45 (a+1, b+1)/(stdevx45 * stdevy45));
        korelasi90 = korelasi90 + ((a-px90)*(b-py90)* ...
             GLCM90 (a+1, b+1)/(stdevx90 * stdevy90));
        korelasi135 = korelasi135 + ((a-px135)*(b-py135)* ...
             GLCM135 (a+1, b+1)/(stdevx135 * stdevy135));
    end
end
    
G0.asm = asm0;
G0.kontras = kontras0;
G0.idm = idm0;
G0.entropi = entropi0;
G0.korelasi = korelasi0;
    
G45.asm = asm45;
G45.kontras = kontras45;
G45.idm = idm45;
G45.entropi = entropi45;
G45.korelasi = korelasi45;
    
G90.asm = asm90;
G90.kontras = kontras90;
G90.idm = idm90;
G90.entropi = entropi90;
G90.korelasi = korelasi90;
    
G135.asm = asm135;
G135.kontras = kontras135;
G135.idm = idm135;
G135.entropi = entropi135;
G135.korelasi = korelasi135;
