function pca_recon = remove_pca_outliers(pca_recon)

means = nanmean(pca_recon);

for landmark = 1:63
    for frame = 1:length(pca_recon)
        if pca_recon(frame,landmark) > 3*means(landmark) || pca_recon(frame,landmark) < 0
            pca_recon(frame,landmark) = NaN;
        end
    end
end