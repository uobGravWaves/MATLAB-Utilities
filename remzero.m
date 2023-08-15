function [out] = remzero(IN)
%Change zeros to nans
    out = IN;
    out(out == 0) = NaN;

end