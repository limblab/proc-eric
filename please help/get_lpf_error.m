function lpf_error = get_lpf_error(data, data_lpf)

% select frames to check
markers = cell(1,21);
for i = 1:21 %set aside column index of the coordinates of each marker in the dataset
    m = ((i-1)*3+1):i*3;
    markers{i} = m; 
end

markers_to_drop = 8;
ms = randperm(21); % randomly select markers
marker_selected = ms(1:markers_to_drop);% markers to drop
marker = [markers{marker_selected}];
frames_to_check = frames2drop_full(data,markers_to_drop,10);

% calculate error
data_before = data(frames_to_check,marker);
after_lpf = data_lpf(frames_to_check,marker);

dont_include = isnan(data_before); %in case some of the randomly dropped markers were already missing
data_before = data_before(~dont_include);
after_lpf = after_lpf(~dont_include);
                
lpf_error = sum(abs(after_lpf - data_before)) / numel(after_lpf); %not Euclidean distanc
