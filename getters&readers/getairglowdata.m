
function [bigdata] = getairglowdata(location, wavelength, year)

%Gets airglow data from eepc from the given location, wavelength, and year

% if location == ':'
%     location = '*';
% elseif wavelength == ':'
%     wavelength = '*';
% elseif year == ':'
%     year = '*';
% end

pathy = fullfile('/data2/AIRGLOW/', location, wavelength, year);
bigdata = struct('data', [], 'times', []);
direc = dir(pathy);
for f = 3:size(direc, 1)
    
    plath = fullfile(direc(f).folder, direc(f).name);
    load(plath)
    bigdata(f-2).data = Airglow;
    bigdata(f-2).times = Times;

    clear Airglow Times
end