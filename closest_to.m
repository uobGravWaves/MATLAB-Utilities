function [outVal, outInd] = closest_to(array, value)
%Finds the index and value of the number closest to a given value

    [d, ix] = min(abs(array-value));
    outInd = ix;
    outVal = d+value;

    %If only one output wanted, assume its the index wanted
    if nargout == 1
        outVal = [];
    end
end