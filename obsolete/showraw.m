function [] = showraw(airglow, varargin)

switch nargin
    case 1
        
        fig = figure('CloseRequestFcn', @my_closereq);
        ax = axes(fig);
        while true
            for x = 1:size(airglow, 3)
            
                pcolor(ax, airglow(:,:,x));shading flat;colormap bone
            %     clim([0 20000])
                axis square
%                 title({datestr(times(x), 'dd-mmm-yyyy');datestr(times(x), 'HH:MM:SS')})
                refreshdata
                drawnow
            end
        end
    
    case 2
        times = varargin{1};
        fig = figure('CloseRequestFcn', @my_closereq);
        ax = axes(fig);
        while true
            for x = 1:size(airglow, 3)
            
                pcolor(ax, airglow(:,:,x));shading flat;colormap bone
            %     clim([0 20000])
                axis square
                title({datestr(times(x), 'dd-mmm-yyyy');datestr(times(x), 'HH:MM:SS')})
                refreshdata
                drawnow
            end
        end
end
end
