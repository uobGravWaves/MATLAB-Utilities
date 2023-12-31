function [h, c] = m_contour3(long, lat, data, num, varargin)

global MAP_PROJECTION 

% Have to have initialized a map first

if isempty(MAP_PROJECTION)
  disp('No Map Projection initialized - call M_PROJ first!');
  return;
end

if min(size(long))==1 && min(size(lat))==1
 [long,lat]=meshgrid(long,lat);
end

[X,Y]=m_ll2xy(long,lat,'clip','on');  %First find the points outside

i=isnan(X);      % For these we set the *data* to NaN...
data(i)=NaN;

                 % And then recompute positions without clipping. THis
                 % is necessary otherwise contouring fails (X/Y with NaN
                 % is a no-no. Note that this only clips properly down
                 % columns of long/lat - not across rows. In general this
                 % means patches may nto line up properly a right/left edges.
if any(i(:)), [X,Y]=m_ll2xy(long,lat,'clip','patch'); end  

                 % Added edgecolor,'none' because if people go on and
		 % use 'shading flat' (which you always do) it generates
		 % a stream of warnings about patches in m_coast and m_grid
		 % calls.
if any(~i(:))
 [h, c]=contour3(X,Y,data, num, 'ShowText','on');

else
  h=[];
end

if nargout==0
 clear  h
end