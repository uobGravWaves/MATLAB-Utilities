# Matlab-Utilities
Big ol' group of useful matlab files

bin2mat has bin2mat and bin2matN, confusion
getters&readers has things that get data, and things that read data. Probably most useful
obsolete is my own that aren't useful anymore, but have served their purpose
plotters has my own special brand of plotting and helping plotting. Could probably put all the m_map stuff in there but eh
      (I like animations)
stransform has all the stuff I have to do with stransforming things, inc gwanalyse, although who knows which version this is


List of functions

adaptcluster_kmeans - Kmeans clustering algorithm for images (BW or colourful), slightly better than normal matlab one
airdensity - computes air density from pressure and temperature
cat_struct - concatenates two structs along a given dimension, with given exceptions
cell2num - converts a cell matrix to a double array
closest_to - finds the index and value of the number closest to a given value in an array
coasts_only - gather the coasts in a given lat lon region, NEEDS FILE PATH SET UP
date2doy - converts date (as datenum) to day of the year, plus fraction
downer - lowers the labels to between 1 and the number of labels
edge_linking - links edges in a BW image between different lines
edge_linking_points - links points in a BW image, same as edge_linking but for points
fix_m - fixes the horizontal wavenumbers' signs from the m for AIRS data
height2pressure - converts from height (altitude) to pressure
inpaint_nans - fills missing nans, a more refined fill_missing
is_adjacent - creates an adjacency matrix of labelled regions in an image
is_inside - checks if one shape is inside another, ONLY WORKS FOR POLYSHAPES
is_odd - checks if the numbers in an array are odd or even, returns TF matrix
linarray - creates linearly spaced array based on start value, spacing and number of points
linearise - honestly why even use this, just do (:) instead
LocalDataDir - finds the correct paths for each machine for data, NEEDS FILE PATH SET UP
make_gif - makes a gif and saves it from a 3-d volume, or 4-d for colour too
map_make - creates basic lat lon arrays, not hugely useful
minmax - finds minimum and maximum of an array, excludes nans
momentum_flux - calculates momentum flux
natsortfiles - sorts files in a much more natural way
num - the python version of str2num
pressure2height - converts from pressure to height
quadadd - adds things quadratically
remzero - removes zeros and replaces with NaNs
round_to - rounds an array to the nearest given value
smoothn - smooths things nicely
str - the python version of num2str
wildcardsearch - searches through the file system using wildcards





