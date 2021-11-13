function [recon,pca_params] = pca_interpolation(data)

[coeff,score,~,~,~,mu] = pca(data,'algorithm','als','NumComponents',7);

recon = score * coeff' + repmat(mu,length(data),1);
pca_params = struct('coeff',coeff,'score',score,'mu',mu);