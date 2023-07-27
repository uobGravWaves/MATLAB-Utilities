function OUT = edge_linking(edgeImage)

endPoints = bwmorph(edgeImage, 'endpoints');
[endPointRows, endPointColumns] = find(endPoints);
numberOfEndpoints = length(endPointRows);
[rowsInImage, columnsInImage] = size(edgeImage);
if length(endPointRows) > 1
	xy = [endPointColumns, endPointRows];
	distances = pdist2(xy, xy);
	% distances is a matrix where the points are both the rows and columns, and the value is the distance between those points.
	% For example distances(3, 8) is the distance between point #3 and point #8.
	% Erase upper right triangle because it's a duplicate of the lower triangle.
	% For example the  distance between point #3 and point #8 is the same as distance between point #8 and point #3,
	% and we don't want to process that potential line segment twice.
	distances2 = tril(distances); 
else
	return;
end

% Define the longest distance that we are willing to jump/close.
longestGapToClose = ceil(0.25 * rowsInImage);
[labeledImage, numberOfSegments] = bwlabel(edgeImage);
theLabels = zeros(numberOfEndpoints, 1);
for k = 1 : numberOfEndpoints
	thisRow = endPointRows(k);
	thisColumn = endPointColumns(k);
	% Get the label number of this segment
	theLabels(k) = labeledImage(thisRow, thisColumn);
end
mustBeDifferent = true;
connectAll = 0;
finalMask = edgeImage;

lineCounter = 1;	% Initialize a counter of all the lines we draw no matter where they start and end.
for k = 1 : numberOfEndpoints
	thisRow = endPointRows(k);
	thisColumn = endPointColumns(k);
	% Get the label number of this segment
	thisLabel = theLabels(k);
	% Get indexes of the other end points.
	otherEndpointIndexes = setdiff(1:numberOfEndpoints, k);
	if mustBeDifferent
		% If they want to consider joining only end points that reside on different segments
		% then we need to remove the end points on the same segment from the "other" list.
		% Get the label numbers of the other end points.
		otherLabels = theLabels(otherEndpointIndexes);
		onSameSegment = (otherLabels == thisLabel); % List of what segments are the same as this segment
		otherEndpointIndexes(onSameSegment) = []; % Remove if on the same segment
	end
	
	% Now get a list of only those end points that are on a different segment.
	otherCols = endPointColumns(otherEndpointIndexes);
	otherRows = endPointRows(otherEndpointIndexes);
	
% 	hold on;
% 	hCurrentPoint = plot(thisColumn, thisRow, 'mo', 'MarkerSize', 16, 'LineWIdth', 2);
	
	% Compute distances
	distances = sqrt((thisColumn - otherCols).^2 + (thisRow - otherRows).^2);
    if connectAll == 0
		% Connect only the closest one.
		% Find the min - the one closest point.
		[minDistance, indexOfMin] = min(distances);
		nearestX = otherCols(indexOfMin);
		nearestY = otherRows(indexOfMin);
		if minDistance <= longestGapToClose
			% Draw line from this endpoint to the other endpoint.
% 			line([thisColumn, nearestX], [thisRow, nearestY], 'Color', 'g', 'LineWidth', 2);
            spacing = 0.4;
            numPoints = minDistance/spacing;
            xLine = linspace(thisColumn, nearestX, numPoints);
            yLine = linspace(thisRow, nearestY, numPoints);
            rows = round(yLine);
            columns = round(xLine);
            for j = 1 : length(xLine)
                edgeImage(rows(j), columns(j)) = true;
            end
% 			h = images.roi.Line(gca, 'Color', 'r', 'Position',[thisColumn, thisRow; nearestX, nearestY]);
			% You can comment out the fprintf() to speed up the overall time the process takes.
% 			mask = h.createMask(rowsInImage, columnsInImage);
% 			finalMask(mask) = true;	% Burn line into output image.
			% Increment the line counter.
			lineCounter = lineCounter + 1;
		end
	else
		% Connect all points that are close enough
		% Start at endpoint k, because if indexes 5 and 9 need to be connected, we don't ALSO need to connect endpoints 9 and 5 -- it would be the same line.
        for k2 = k : length(distances)
			% Find the index and distance and location of this point.
			minDistance = distances(k2);
			nearestX = otherCols(k2);
			nearestY = otherRows(k2);
			if minDistance <= longestGapToClose
				% Draw line from this endpoint to the other endpoint.
% 				line([thisColumn, nearestX], [thisRow, nearestY], 'Color', 'g', 'LineWidth', 2);
				h = images.roi.Line(gca, 'Color', 'r', 'Position',[thisColumn, thisRow; nearestX, nearestY]);
				% You can comment out the fprintf() to speed up the overall time the process takes.
				fprintf('Drawing line #%d (which is %.1f pixels long) from (%d, %d) on segment #%d to (%d, %d) on segment #%d.\n', ...
					lineCounter, minDistance, thisColumn, thisRow, theLabels(k), nearestX, nearestY, theLabels(k2));
				drawnow;
				mask = h.createMask(rowsInImage, columnsInImage);
				finalMask(mask) = true;	% Burn line into output image.
				% Increment the line counter.
				lineCounter = lineCounter + 1;
			end
        end	
    end
end
OUT = edgeImage;