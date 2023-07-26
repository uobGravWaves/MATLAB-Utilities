function OUT = fixM(strans)

strans.k(strans.m < 0) = strans.k(strans.m < 0).*-1;
strans.l(strans.m < 0) = strans.l(strans.m < 0).*-1;

OUT = strans;