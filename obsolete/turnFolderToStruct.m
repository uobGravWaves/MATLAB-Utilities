
function [Frames, Meta] = turnFolderToStruct(dataPathIn, dataPathOut)

s = dir(dataPathIn);
firstFrame = s(3).name;
firstFrame = str2num(firstFrame(4:7));
lastFrame = size(s, 1) -3

Times = [];

for n = firstFrame:1:lastFrame

    imageNum = sprintf('%04d',n)
    imagePath = [dataPathIn '\oh_' imageNum '.tif'];

    %Get data and metadata, assign time to timeAll
    [data, header] = readtif(imagePath);
    [year, month, day, doy, time] = tm2time(header.universaltime); 
    Times(end+1) = datenum(year, month, day, time, 0, 0);    
    
    if ~exist('Airglow')
        Airglow = data;
    else                   
        Airglow = cat(3,Airglow,data);
    end
end

dateString = datestr(Times(1), 'mmmddyy');
fileName = [dataPathOut,'\',dateString,'.data.mat'];
save(fileName,'Times','Airglow');

end