function frames2plot = get_interp_frames2plot(train_ind, full_fnum, data_truncated)

%cut data down to train set
data_truncated = data_truncated(train_ind, :);
truncated_fnum = data_truncated(:,64);
frames2plot = zeros(size(full_fnum));

for i = 1:length(full_fnum)
    frames2plot(i) = find(full_fnum(i) == truncated_fnum(:));
end
