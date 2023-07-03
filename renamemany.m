path = 'C:\Users\Peter\OneDrive - University of Bath\Desktop\Airglow Bits\StructuredData';
addpath(path);

% structy = dir(path);
% for k = 3:length(structy)
%     pi = fullfile(path, structy(k).name);
%     places = dir(pi);
%     for id = 3:length(places)
% %         palce = char(phill(end));
% %         idx = strfind(palce, '.png');
%         day = places(id).name(1:7);
%         ang = places(id).name(9:12);
%         date = datetime(day, 'InputFormat', 'MMMddyy', 'Format', 'ddMMMyyyy');
%         newname = strcat(string(date), '_', structy(k).name, '_', ang, '.data.mat');
%         movefile(fullfile(pi, places(id).name), newname);
%     end
% end


l = dir(path);
for u = 3:262
%     p = strfind(l(u).name, '_');
%     j = p(2) - p(1) -1
%     l(u).name

    y = l(u).name(11);
    switch y
        case 'a'
            if l(u).name(12) == 'r'
                movefile(l(u).name, 'arecibo')
            else
                movefile(l(u).name, 'asiago')
            end        
        case 'c'
            movefile(l(u).name, 'colombia')
        case 'e'
            if l(u).name(12) == 'a'
                movefile(l(u).name, 'easton')
            else
                movefile(l(u).name, 'el_leoncito')
            end
        case 'g'
            movefile(l(u).name, 'germany')
        case 'h'
            movefile(l(u).name, 'halley')
        case 'j'
            movefile(l(u).name, 'jicamarca')
        case 'm'
            if l(u).name(12) == 'c'
                movefile(l(u).name, 'mcdonald')
            elseif l(u).name(12) == 'e'
                movefile(l(u).name, 'mercedes')
            elseif l(u).name(12) == 't'
                movefile(l(u).name, 'mt_john')
            else
                movefile(l(u).name, 'millstone')
            end
        case 'r'
            if l(u).name(12) == 'o'
                movefile(l(u).name, 'rothera')
            else
                movefile(l(u).name, 'rio_grande')
            end
        case 's'
            movefile(l(u).name, 'sutherland')
    end
end