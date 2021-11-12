function frames = interpolatable_frames(data_table,window,ind)

% Inputs
% -> data_table: DLC format table
% -> window: size of window for interpolation
% -> ind: indeces of tracking in DLC data table

% Outputs
% frames: all frames in the dataset that either have tracking or can be
% interpolated using the given window size

DLC_Data = table2array(data_table); 
tidx = cell(1,length(DLC_Data));
frame_nums =[];
   for i = 1:size(DLC_Data,1) - window % Loop over frames in dataset
        if max(sum(isnan(DLC_Data([i:i+window-1],ind)),1))==window % Check if any sensor is nan for entire window
            frame_nums = [frame_nums,i:i+window-1]; % save frame numbers for which tracking is nan for entire window.
        end
   end

%% Interpolate

rows = 1:size(DLC_Data,1);
idx = ismember(rows,frame_nums); % rows in data matrix of frames that cannot be interpolated
nanx = isnan(DLC_Data);
t = 1:numel(DLC_Data);
DLC_Data(nanx) = interp1(t(~nanx), DLC_Data(~nanx), t(nanx),'pchip');
tDLC_Data = DLC_Data(~idx,:); % Remove frames with lost tracking that cannot be interpolated
frames = tDLC_Data; % frames of dataset which either have tracking or can be safely interpolated

end

