function axList = connectaxes2(axList)
% C:\Users\KEdwards\OneDrive - datacolor\matlab_programs\graphics\
% connectaxes2.m
%
% DESCRIPTION 
%   Set different 3D axes to the same limits and view angle as you zoom and pan
% INPUT
%     axList - List of handles to axes to connct
if nargin == 0 % Pick all open axes, if specific axes are not passed in
    axList = findobj('type', 'axes'); 
end
Link = linkprop(axList,{'CameraUpVector', 'CameraPosition', ...
    'CameraTarget', 'XLim', 'YLim', 'ZLim'});
setappdata(gcf, 'StoreTheLink', Link);