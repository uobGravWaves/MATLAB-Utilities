function out = diffn(array, deriv, direc, n)

%Finds the diff between one point and another n coords away

sz = ndims(array);
if sz == 2
     szCheck = size(array);
     if any(szCheck == 1)
         sz = 1;
         direc = 2;
     end
end

bigAr = struct('parts', [], 'tempo', [], 'final', []);

for m = 1:n
%     bigAr(m).parts 
    temp = mysub(array, direc, m, n);
    bigAr(m).tempo = temp;
    bigAr(m).parts = diff(temp, deriv, direc);
%     ben(m) = size(bigAr(m).parts, direc);
end
% bent = sum(ben);
% for l = 1:bent

% caty = cat(direc, bigAr.parts);
% ben = size(caty, direc);
% bigAr.parts
% size(bigAr(1).parts, 2)
% size(bigAr, 2)
num = 1;


if sz == 1
    for k = 1:size(bigAr(1).parts, 2)
        for j = 1:size(bigAr, 2)
            if num <= numel(cat(direc, bigAr.parts))
                final(:,num) = bigAr(j).parts(k);
                num = num + 1;
            else
                continue
            end            
        end
    end

elseif sz == 2
    if direc == 2
        for k = 1:size(bigAr(1).parts, 2)
            for j = 1:size(bigAr, 2)
                if num <= size(cat(direc, bigAr.parts), 2)
                    final(:,num) = bigAr(j).parts(:,k);
                    num = num + 1;
                else
                   continue
                end
            end
        end
    elseif direc == 1
        for k = 1:size(bigAr(1).parts, 2)
            for j = 1:size(bigAr, 2)
                if num <= size(cat(direc, bigAr.parts), 1)
                    final(num,:) = bigAr(j).parts(k,:);
                    num = num + 1;
                else
                    continue
                end
            end
        end
    end
elseif sz == 3
    if direc == 3
        for k = 1:size(bigAr(1).parts, 2)
            for j = 1:size(bigAr, 2)
                if num <= size(cat(direc, bigAr.parts), 3)
                    final(:,:,num) = bigAr(j).parts(:,:,k);
                    num = num + 1;
                else
                    continue
                end
            end
        end
    end
end



bigAr(1).final = final;


out = final;

% if sz == 1
%     for l = 1:ben
%         if l <= n
%             final(:,l) = caty(:, (l-1*n)+1)
%     end
% elseif sz == 2
%     if direc == 1
% 
%     elseif direc == 2
% 
%     end
% elseif sz == 3
% 
% end
% 
% % C = repmat({':'},1,max(direc,ndims(array)));
% % C{direc} = 
% 
% 
% out = bigAr;
% 
% 1+0*n
% 1+1*n
% 1+2*n
% 2+0*n
% 2+1*n

