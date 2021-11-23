function frames_to_drop = frames2drop_full_consec(data_full,num_markers,num_consecutive,percent_to_drop)
% currently doesn't account for overlapping frames during consecutive runs

frames = [];

% get frame indeces eligibile for more drops
for frame = 1:length(data_full)
    if sum(isnan(data_full(frame,:))) <= ((3 * num_markers) - 3)
        frames(end+1) = frame;
    end
end


group = round(length(frames)/ percent_to_drop / num_consecutive);
idx = frames(randi(length(data_full)-group-(length(data_full)-length(frames)),1,group));

dist = diff(idx);
for i = 1:length(dist) % check random numbers are not too close
    if abs(dist)<group
        idx(i) = idx(i) + (group - dist(i));
    end
end

for i = 1:length(idx)
    frames_to_drop(i,:) = idx(i):(idx(i) + (num_consecutive-1));
end

frames_to_drop = frames_to_drop';