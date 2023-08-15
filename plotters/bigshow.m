function bigshow(frames, varargin)
%A quick and dirty animation 
fig = figure('CloseRequestFcn', @my_closereq);
    for x = 1:size(frames, 3)
        shat(frames(:,:,x))
        drawnow
        pause(0.05)
    end
