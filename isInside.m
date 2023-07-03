function TF = isInside(ps1, ps2)

%Check if ps1 is inside ps2
%Only polyshapes
    if isempty(ps1.Vertices) == 1 || isempty(ps2.Vertices) == 1 
        TF = 0;
    else
        TF = abs(area(ps2)-area(subtract(ps2,ps1))-area(ps1))<(area(ps1)*1e-06);
%         disp(TF);
    end
end

