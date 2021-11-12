function frames = frames2drop(max_frames,number,consecuative,dont_drop)

x = setdiff(1:max_frames,dont_drop);


group = round(number/consecuative);
idx = x(randi(max_frames-group-length(dont_drop),1,group));

dist = diff(idx);
for i = 1:length(dist) % check random numbers are not too close
    if abs(dist)<group
        idx(i) = idx(i) + (group - dist(i));
    end
end

for i = 1:length(idx)
    frames(i,:) = idx(i):(idx(i) + (consecuative-1));
end


