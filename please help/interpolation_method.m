function interpolated = interpolation_method(data)
    % this function runs a linear interpolation on an input set of data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated
    

        nanx = isnan(data);
        t = 1:numel(data);
        data(nanx) = interp1(t(~nanx), data(~nanx), t(nanx));
        
        interpolated = data;

end
