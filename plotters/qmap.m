function [] = qmap(parameter, varargin)

%Quick map, using generic map and 0.5 degree spacing as default
%varargins should be Longitude, then Latitude
if nargin == 1
    bigLon = linspace(-180, 180, 721);
    bigLat = linspace(-90, 90, 361);
else
    bigLon = varargin{1};
    bigLat = varargin{2};
end

figure
m_proj('robinson', 'lat', [-90, 90], 'lon', [-180, 180])

m_pcolor(bigLon, bigLat, parameter);shading flat
hold on
[shape] = coasts_only([-180,180], [-90, 90]);

for icost = 1:1:numel(shape)
    if numel(shape(icost).Lon)<100
        continue
    end
    m_plot(shape(icost).Lon,shape(icost).Lat,'k-')

end
% m_coast;
m_grid;

end