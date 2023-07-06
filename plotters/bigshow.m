%An animated square pcolor, varargins being x and y coords

function bigshow(frames, varargin)

    for x = 1:size(frames, 3)
        sqlat(frames(:,:,x), x, varargin{:})
%         title(x)
%         colormap bone
%         clim([500 1000])
        drawnow
        pause(0.05*2)
    end
