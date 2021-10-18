function [output3ddataraw_interp,nans,output3ddataraw] = lin_interp_pos(output3ddataraw)

% linear interpolation of raw 3D hand data to fill NaNs
% Input: 
    % output3ddataraw: Should be the full, 106-column output of 3D
    % reconstrction (this code gets the frames to look at from it and then
    % clears the unnecessary ones)
% Output:
    % ooutput3ddataraw_interp: the interpolated data of course! Points that
    %    were already present are unmodified
    % nans: logical matrix. If 1, a NaN was replaced
    % output3ddataraw: the original data with extra columns removed

x = output3ddataraw(:,106)+1;
output3ddataraw(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105,106]) = [];

output3ddataraw_interp = zeros(size(output3ddataraw));
nans = zeros(size(output3ddataraw));
for joint = 1:width(output3ddataraw)
    [F,TF] = fillmissing(output3ddataraw(:,joint),'linear','SamplePoints',x);
    output3ddataraw_interp(:,joint) = F;
    nans(:,joint) = TF;
end