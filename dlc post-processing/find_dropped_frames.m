function indices = find_dropped_frames(cams)

% The name is misleading but I'm getting back into the flow. EG 1/3/22

% cams is the difference in time differences between two cameras. If the
% same frame was dropped in both cameras this should be close to 0.
% The first part tells you if the same frame was dropped in both cameras.
% Finally get the indices, which indicates that a frame was dropped in one
% but not in the other

is_dropped = zeros(size(cams));

for i = 1:length(is_dropped)
    if abs(cams(i)) >= 0.005
        is_dropped(i) = 1;
    else is_dropped(i) = 0;
    end
end

indices = find(is_dropped);