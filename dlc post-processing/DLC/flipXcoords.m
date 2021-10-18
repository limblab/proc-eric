function [nRows, nColumns] = flipXcoords(csvFileIn, csvFileOut)
%function [nRows, nColumns] = flipXcoords(csvFileIn, csvFileOut)
% The function reads the CSV file containing the coordinates of the labels
% and recalculates them for a reflected image along the horizontal axis. It
% then writes the the new values to the file csvFileOut, which has the same
% structure as the original file, csvFileIn. The function returns the
% number of rows and columns in csvFileOut.

T = readtable(csvFileIn);
T(:, 2:2:end) = array2table(2049 - table2array(T(:, 2:2:end)));
writetable(T, csvFileOut);
[nRows, nColumns] = size(T);