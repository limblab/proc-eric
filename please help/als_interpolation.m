function [recon, coeff, explained] = als_interpolation(data, num_pcs)         
 
% Interpolate  
        [coeff,score,~,~,explained,mu] = pca(data,'algorithm','als','NumComponents',num_pcs);
 
        recon = score * coeff' + repmat(mu,size(data,1),1);