function pca_missing_replaced = replace_missing_frames(data_full, pca_interpolated, fnums_pca)

pca_interpolated = [pca_interpolated fnums_pca];
pca_missing_replaced = data_full;

for frame = 1:length(pca_missing_replaced)
    if ismember(pca_missing_replaced(frame,64),fnums_pca)
        pca_missing_replaced(frame,:) = pca_interpolated(pca_interpolated(:,64) == frame,:);
    end
end
    