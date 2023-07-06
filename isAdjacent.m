function W = isAdjacent(I)
%{
Searches all pixels and finds which areas (with the same label) are
adjacent to each other
Returns an adjacency matrix (but not the real mathsey one)
This can definitely be quicker, but requires a better mind than mine
%}
I = downer(I);
m = max(I, [], "all")
%Find the largest label, this needs to have gone through the downer program
%to work properly
[sisX, sisY] = size(I);

out = zeros(m, m);

Ip = padarray(I, [1, 1], "replicate", "both");

for x = 2:1:sisX-1
    for y = 2:1:sisY-1
        out = allaround(Ip, out, x, y);
    end
end

W = out - eye(m);

function out = allaround(I, out, x, y)
    if I(x, y)~=I(x+1, y)
        out(I(x, y), I(x+1, y)) = 1;
    end
    if I(x, y)~=I(x-1, y)
        out(I(x, y), I(x-1, y)) = 1;
    end
    if I(x, y)~=I(x, y+1)
        out(I(x, y), I(x, y+1)) = 1;
    end
    if I(x, y)~=I(x, y-1)
        out(I(x, y), I(x, y-1)) = 1;
    end
    if I(x, y)~=I(x+1, y+1)
        out(I(x, y), I(x+1, y+1)) = 1;
    end
    if I(x, y)~=I(x+1, y-1)
        out(I(x, y), I(x+1, y-1)) = 1;
    end
    if I(x, y)~=I(x-1, y+1)
        out(I(x, y), I(x-1, y+1)) = 1;
    end
    if I(x, y)~=I(x-1, y-1)
        out(I(x, y), I(x+1, y)) = 1;
    end
end

end