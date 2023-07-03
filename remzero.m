
function [out] = remzero(IN)
%Only takes cell arrays
   
    for pip = 1:length(IN)
        temp = IN{pip};
        temp(temp == 0) = NaN;
        out{pip} = temp;
    end
end