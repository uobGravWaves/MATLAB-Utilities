
%This pretty successfully does some motion interpolation, just don't look
%too hard. Maybe I can change the params but we'll do that later

data = Airglow(:,:,5:2:7);

opts.BlockSize   = 8;
opts.SearchLimit = 10;
[MVx, MVy] = Bidirectional_ME(data(:,:,1), data(:,:,2), opts);
imgMC = reconstruct(data(:,:,1), MVx, MVy, 0.5);

data = cat(3, data(:,:,1), imgMC);
data = cat(3, data, data(:,:,2));
figure

for x = size(data, 3)
    pcolor(data(:,:,x));shading flat;colormap gray
    axis square
    drawnow
    pause(1)
end