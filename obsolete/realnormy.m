function out = realnormy (IN)
    temp = (IN - min(IN(:)))/range(IN, 'all');
    out = 2.*temp-1;
end