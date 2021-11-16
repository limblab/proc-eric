function frames_to_drop = frames2drop_full(data_full,num_markers,percent_to_drop)

frames = [];

% get frame indeces eliigibile for more drops
for frame = 1:length(data_full)
    if sum(isnan(data_full(frame,:))) <= ((3 * num_markers) - 3)
        frames(end+1) = frame;
    end
end

frames = frames(randperm(length(frames))); %shuffle
frames_to_drop = frames(1:round(length(frames) / percent_to_drop));
       
%Input_full_test = data_full;
%Input_full(frames_full+1, marker) = NaN; %+1 becuase fnums are 0-indexed