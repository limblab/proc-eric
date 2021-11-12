function good_frames = get_good_frames(data, frames_to_extract)

for idx = 1:length(frames_to_extract)
    good_frames(idx,:) = data(frames_to_extract(idx),:);
end
 