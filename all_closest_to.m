function [vals, inds] = all_closest_to(array, value, options)
%Finds all the values in an array closest to a value, within bounds
    arguments
        array
        value double
        options.bounds (2, 1) double = [-0.5, 0.5]
    end

    if options.bounds(1)>=options.bounds(2)
        eidType = 'mustBeGreaterThanFirstPosition:notGreaterThan';
        msgType = 'Input must be greater than first position';
        throwAsCaller(MException(eidType, msgType))
    end

    t = 1;
    vals = zeros(1,1);
    inds = zeros(1,1);
    while t == 1
        [closeVal, closeInd] = closest_to(array, value);
        if closeVal < options.bounds(2) && closeVal > options.bounds(1)
            vals(end+1) = closeVal;
            inds(end+1) = closeInd;
            array(closeInd) = NaN;

        else
            t = 0;
        end
    end