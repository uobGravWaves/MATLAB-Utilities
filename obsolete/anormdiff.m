function out = anormdiff(st, q, w)
        
%         temp2 = normalize(st, 1, 'range', [-1 1]);
%         temp3 = normalize(temp2, 2, 'range', [-1 1]);
        temp3 = realnormy(st);
        temp3 = diff(temp3, q, w);
        out = abs(temp3);
%         out = abs(normalize(, 'range', [0 1]));

    end