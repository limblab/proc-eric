function [recon, coeff] = ppca_interpolation(data, num_pcs)         
 
    % this function runs a linear interpolation on an input set of data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated
    

    [coeff,score,~,mu,~,~] = ppca(data,num_pcs);
    
    recon = score * coeff' + repmat(mu,size(data,1),1);