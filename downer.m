function out = downer(labelled)

uni = unique(labelled);
% downed = 1:size(uni);
out = zeros(size(labelled));

for k = 1:size(uni)
    out(labelled == uni(k)) = k;
end