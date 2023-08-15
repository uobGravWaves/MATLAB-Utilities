# Matlab-Utilities
Big ol' group of useful matlab files

All in alphabetical order, check the folders (further down) for more
bin2mat has bin2mat and bin2matN, confusion
getters&readers has things that get data, and things that read data. Probably most useful
obsolete is my own that aren't useful anymore, but have served their purpose
plotters has my own special brand of plotting and helping plotting. Could probably put all the m_map stuff in there but eh
      (I like animations)
stransform has all the stuff I have to do with stransforming things, inc gwanalyse, although who knows which version this is


## List of misc. functions

adaptcluster_kmeans - Kmeans clustering algorithm for images (BW or colourful), slightly better than normal matlab one <br />
airdensity - computes air density from pressure and temperature<br />
cat_struct - concatenates two structs along a given dimension, with given exceptions<br />
cell2num - converts a cell matrix to a double array<br />
closest_to - finds the index and value of the number closest to a given value in an array<br />
coasts_only - gather the coasts in a given lat lon region, NEEDS FILE PATH SET UP<br />
date2doy - converts date (as datenum) to day of the year, plus fraction<br />
downer - lowers the labels to between 1 and the number of labels<br />
edge_linking - links edges in a BW image between different lines<br />
edge_linking_points - links points in a BW image, same as edge_linking but for points<br />
fix_m - fixes the horizontal wavenumbers' signs from the m for AIRS data<br />
height2pressure - converts from height (altitude) to pressure<br />
inpaint_nans - fills missing nans, a more refined fill_missing<br />
is_adjacent - creates an adjacency matrix of labelled regions in an image<br />
is_inside - checks if one shape is inside another, ONLY WORKS FOR POLYSHAPES<br />
is_odd - checks if the numbers in an array are odd or even, returns TF matrix<br />
linarray - creates linearly spaced array based on start value, spacing and number of points<br />
linearise - honestly why even use this, just do (:) instead<br />
LocalDataDir - finds the correct paths for each machine for data, NEEDS FILE PATH SET UP<br />
make_gif - makes a gif and saves it from a 3-d volume, or 4-d for colour too<br />
map_make - creates basic lat lon arrays, not hugely useful<br />
minmax - finds minimum and maximum of an array, excludes nans<br />
momentum_flux - calculates momentum flux<br />
natsortfiles - sorts files in a much more natural way<br />
num - the python version of str2num<br />
pressure2height - converts from pressure to height<br />
quadadd - adds things quadratically<br />
remzero - removes zeros and replaces with NaNs<br />
round_to - rounds an array to the nearest given value<br />
smoothn - smooths things nicely<br />
str - the python version of num2str<br />
tm2time - converts from POSIX tm time to normal time <br />
wildcardsearch - searches through the file system using wildcards<br />

## Utility folders
### bin2mat
bin2mat - 
bin2matN - 
### cbrewer2
cbrewer2 - better colourmaps
### getters&readers
cjw_readnetCDF - netCDF reader, Corwin's OLD<br />
nph_getnet - netCDF reader, Neil's<br />
rCDF - netCDF reader, Corwin's NEW<br />
readtif - tif reader
### obsolete
Be my guest looking through here
### plotters
adaptive_ticks - makes nicer ticks for colourbars<br />
bigshow - a quick and dirty animation based on pcolor<br />
connect_axes - links as many axes as are on screen together, based on linkprop<br />
m_contour3 - a tricksy contour3 for m_map<br />
m_surf - a surf map for m_map<br />
qfig - a nice setup for nice looking figures<br />
qmap - a quick m_map setup with coasts etc<br />
qmapbig - bigshow/qmap, very slow to run<br />
shat - pcolor, shading flat<br />
slim - limits the x and y axes to be square in whatever numbers given<br />
subtightplot - a fancy way of making subplots, lots of ability to move things around<br />
tcolor - I have no idea but I think it might be useful later<br />
### stransform
Just bits needed for various ST stuff<br />
nph_ndst - this is very nice and what everything is built upon

---











