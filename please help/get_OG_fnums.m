function interpolated_fnums_OG = get_OG_fnums(frames_to_drop, train_ind, data_truncated)

data_truncated = data_truncated(train_ind, :);
%frames_to_drop = sort(frames_to_drop);
interpolated_fnums_OG = zeros(size(frames_to_drop));

for frame = 1:length(frames_to_drop)
    interpolated_fnums_OG(frame) = data_truncated(frames_to_drop(frame),64);
end

