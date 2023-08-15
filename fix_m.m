function OUT = fix_m(strans)
%Fixes the horizontal wavenumbers (k, l) from the vertical wavenumber (m) for AIRS 

strans.k(strans.m < 0) = strans.k(strans.m < 0).*-1;
strans.l(strans.m < 0) = strans.l(strans.m < 0).*-1;

OUT = strans;