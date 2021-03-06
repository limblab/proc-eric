function [interpolated, explained, coeff] = svd_interpolation(data, num_pcs)
    % this function runs a linear interpolation on an input set of data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated

 
        [coeff,score,~,~,explained,mu] = pca(data,'NumComponents',num_pcs);
 
        interpolated = score * coeff' + repmat(mu,length(data),1);
        
end