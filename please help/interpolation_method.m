function interpolated = interpolation_method(data, num_pcs)
    % this function runs a linear interpolation on an input set of data
   
    % Inputs
    % data -> array of DeepLabCut tracking data to interpolate
    % Outputs
    % interpolated -> array of DLC tracking with NaNs interpolated
    
        
        nanx = isnan(data);
        t = 1:numel(data);
        data(nanx) = interp1(t(~nanx), data(~nanx), t(nanx));
        
%        interpolated = data;
 
        [coeff,score,~,~,~,mu] = pca(data,'NumComponents',num_pcs);
 
        interpolated = score * coeff' + repmat(mu,length(data),1);
        
end

