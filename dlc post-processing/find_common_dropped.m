function [cd1, cd2, cd3, cd4, cd5] = find_common_dropped(camset1, camset2, camset3, camset4, camset5, camset6)

% checks which frames are dropped from multiple cameras, to see if all are
% dropping the same frames

cd1 = intersect(camset1, camset2);
cd2 = intersect(camset2, camset3);
cd3 = intersect(camset3, camset4);
cd4 = intersect(camset4, camset5);
cd5 = intersect(camset5, camset6);

%common_dropped = intersect(camset1, camset2, camset3, camset4, camset5, camset6);