function interpolated = ppca_interpolation(data)
    % this function runs a linear interpolation on an input set of data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated
    

    tic
    [coeff,score,pcvar,mu,v,S] = ppca(data,7);
    toc
    
    %interpolated = S.Recon;
    interpolated = score * coeff' + repmat(mu,length(data),1);

end
