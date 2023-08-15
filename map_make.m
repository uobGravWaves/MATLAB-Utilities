function [bigLon, bigLat] = map_make()
%Creates a basic lon lat spacing
    bigLon = linspace(-180, 180, 721);
    bigLat = linspace(-90, 90, 361);