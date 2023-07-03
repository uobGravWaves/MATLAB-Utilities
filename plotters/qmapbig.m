function [] = qmapbig(bigLon, bigLat, para)
%qmap x bigshow, takes forever, not good
figure
m_proj('robinson', 'lat', [-90, 90], 'lon', [-180, 180])
% temp = squeeze(para(1, :, :));
% m_pcolor(bigLon, bigLat, temp);shading flat
% hold on
% [shape] = coasts_only([-180,180], [-90, 90]);
% 
% for icost = 1:1:numel(shape)
%     if numel(shape(icost).Lon)<100
%         continue
%     end
%     m_plot(shape(icost).Lon,shape(icost).Lat,'k-')
% 
% end

hold on
% pause(0.05)
for x = 1:10:size(para, 1)
    temp = squeeze(para(x, :, :));
    m_pcolor(bigLon, bigLat, temp)
    m_coast;
    m_grid;
    drawnow
    pause(0.05)
end

end