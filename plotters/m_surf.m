function [h] = m_surf(long, lat, data, varargin)

global MAP_PROJECTION 

% Have to have initialized a map first

if isempty(MAP_PROJECTION)
  disp('No Map Projection initialized - call M_PROJ first!');
  return;
end

if min(size(long))==1 && min(size(lat))==1
 [long,lat]=meshgrid(long,lat);
end

[X,Y]=m_ll2xy(long,lat,'clip','on');

i=isnan(X);      % For these we set the *data* to NaN...
data(i)=NaN;

if any(i(:)), [X,Y]=m_ll2xy(long,lat,'clip','patch'); end 

% data = data - mean(data, 'all', 'omitnan');

if any(~i(:))
 [h]=surf(X,Y,data);
 set(h,'edgecolor','none',varargin{:});
 set(h,'tag','m_pcolor');
else
  h=[];
end

if nargout==0
 clear  h
end