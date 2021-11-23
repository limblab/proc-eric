function [recon, coeff, explained] = svd_interpolation(data, num_pcs)
    % this function vanilla PCA on an input set of data, and returns the
    % coefficient matrix to use on test data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated

 
        [coeff,score,~,~,explained,mu] = pca(data,'NumComponents',num_pcs);
 
        recon = score * coeff' + repmat(mu,size(data,1),1);
        
end