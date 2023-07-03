function [amongoose] = maskMaker(strans, Spacing)
    
    F1Xcutoff = abs(diff(strans.F1, 1, 1)) < prctile(abs(diff(strans.F1, 1, 1)), 60, 'all');
    F1Xcutoff = padarray(F1Xcutoff, [1 0 0], 'replicate', 'post');
    F1Ycutoff = abs(diff(strans.F1, 1, 2)) < prctile(abs(diff(strans.F1, 1, 2)), 60, 'all');
    F1Ycutoff = padarray(F1Ycutoff, [0 1 0], 'replicate', 'post');
    F1X2cutoff = abs(diff(strans.F1, 2, 1)) < prctile(abs(diff(strans.F1, 2, 1)), 60, 'all');
    F1X2cutoff = padarray(F1X2cutoff, [2 0 0], 'replicate', 'post');
    F1Y2cutoff = abs(diff(strans.F1, 2, 2)) < prctile(abs(diff(strans.F1, 2, 2)), 60, 'all');
    F1Y2cutoff = padarray(F1Y2cutoff, [0 2 0], 'replicate', 'post');


    F2Xcutoff = abs(diff(strans.F2, 1, 1)) < prctile(abs(diff(strans.F2, 1, 1)), 60, 'all');
    F2Xcutoff = padarray(F2Xcutoff, [1 0 0], 'replicate', 'post');
    F2Ycutoff = abs(diff(strans.F2, 1, 2)) < prctile(abs(diff(strans.F2, 1, 2)), 60, 'all');
    F2Ycutoff = padarray(F2Ycutoff, [0 1 0], 'replicate', 'post');
    F2X2cutoff = abs(diff(strans.F2, 2, 1)) < prctile(abs(diff(strans.F2, 2, 1)), 60, 'all');
    F2X2cutoff = padarray(F2X2cutoff, [2 0 0], 'replicate', 'post');
    F2Y2cutoff = abs(diff(strans.F2, 2, 2)) < prctile(abs(diff(strans.F2, 2, 2)), 60, 'all');
    F2Y2cutoff = padarray(F2Y2cutoff, [0 2 0], 'replicate', 'post');
    Fincutoff = F1Xcutoff+F1Ycutoff+F1X2cutoff+F1Y2cutoff+F2Xcutoff+F2Ycutoff+F2X2cutoff+F2Y2cutoff;


    finalMask = Fincutoff;
    finalMask(finalMask~=8) = 0;
    finalMask(finalMask == 8) = 1;
   
    zey = smoothn(finalMask, [5 5 1]);
    zey(zey>0.3) = true;
    zey(zey~=1) = false;
    amongoose = zey;

%     for m = 1:size(zey, 3)
%         test = zey(:,:,m);
%         labeledImage = bwlabel(test);
%         props = regionprops(labeledImage, 'BoundingBox');
%         bb = [props.BoundingBox]; % Extract all numbers
%         allHeights = bb(4:4:end); % Extract only the heights.
%         % Get indexes of blobss shorter
%         % than the poorly named "x".
%         acceptableBlobsY = find(allHeights.*Spacing(2) > 200);
%         % Get a new binary image of blobs shorter than x
%         binaryImage = ismember(labeledImage, acceptableBlobsY);
%         labeledImage2 = bwlabel(binaryImage);
%         props2 = regionprops(labeledImage2, 'BoundingBox');
%         bb2 = [props2.BoundingBox];
%         allWidths = bb2(3:4:end); % Extract only the heights.
%         % Get indexes of blobss shorter
%         % than the poorly named "x".
%         acceptableBlobsX = find(allWidths.*Spacing(1) > 200);
%         % Get a new binary image of blobs shorter than x
%         binaryImage = ismember(labeledImage2, acceptableBlobsX);
%         amongoose(:,:,m) = double(binaryImage);
%     end

%     Acutoff = prctile(strans.A, 90, 'all');
%     Acutoff = mean(strans.A,'all')+1.5*std(strans.A, 0, 'all');
%     Amask = strans.A > Acutoff;
%     mask = strans.ST.F1 < Fcutoff;
%     finalMask = Amask+Fincutoff;
    
