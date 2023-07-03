function [output]= cell2num(inputcell)
%
% This function converts a cell array to a double precision array.
%
% Usage: output= cell2num(inputcellarray)
%
% The output array will have the same dimensions as the input cell array.
% Non-numeric cell contents will be converted to NaNs in output.
%
% Written by Nishaat Vasi, Application Support Engineer, The MathWorks

if ~iscell(inputcell)
   error('Input must be a cell array.');
end

output= cellfun(@cellcheck, inputcell);

function y= cellcheck(x)

if isnumeric(x) && numel(x) == 1
    y= x;
else
    y= NaN;
end

end % embedded function cellcheck

end % function cell2num
