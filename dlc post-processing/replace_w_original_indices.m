function original_indices = replace_w_original_indices(data2d,extraction_indices)
%might only need to use this once...testing reprojection of randomly
%inserted NaNs and their interpolated values

original_indices = data2d;

for idx = 1:length(data2d)
    original_indices(idx,1) = strrep(original_indices(idx,1),regexp(original_indices(idx,1),'img\d*','match'),strcat('img',num2str(extraction_indices(idx),'%06.f'),'_bodypart'));
end

original_indices = unique(original_indices,'rows');