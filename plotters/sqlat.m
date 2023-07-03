function sqlat(image, varargin)
%Square, flat shading pcolor
%Needs rewriting to slim down
c = numel(varargin);
% varargin{1}
switch c
    case 0
        pcolor(image);shading flat;colorbar;axis square
        colormap parula
    case 1
        pcolor(image);shading flat;colorbar;axis square
        colormap parula
    case 2
        if length(varargin{1})==1   
            tit = varargin{2};
            x = varargin{1}; 
            pcolor(image);shading flat;colorbar;axis square            
            t = char(datetime(tit(x), 'ConvertFrom', 'datenum'));
            title(t(13:end));
            colormap parula   
        else
            pcolor(varargin{1}, varargin{2}, image);shading flat;colorbar;axis square   
            colormap parula
        end
    case 3
        pcolor(varargin{2}, varargin{3}, image);shading flat;colorbar;axis square
        t = char(datetime(varargin{1}, 'ConvertFrom', 'datenum'));
        title(t(13:end));  
        colormap parula
    case 4
        x = varargin{1};
        tit = varargin{2};
        pcolor(varargin{3}, varargin{4}, image);shading flat;colorbar;axis square
        t = char(datetime(tit(x), 'ConvertFrom', 'datenum'));
        title(t(13:end));  
        colormap parula
end

