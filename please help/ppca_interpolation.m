function interpolated = ppca_interpolation(data)
    % this function runs a linear interpolation on an input set of data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated
    

    tic
    [~,~,~,~,~,S] = ppca(data,7);
    toc
    
    interpolated = S.Recon;

end
