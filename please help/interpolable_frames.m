function [data, fnum] = interpolable_frames(data_full, percent_to_use)

% returns percent_to_use% of the full dataset with <= 4 landmarks per frame
% dropped and no landmark dropped for >2 consecutive frames

% issues: most obviously, what remains is not consecutive. Due to this,
% some 'consecutive' runs of 3 or more dropped frames remain. Also doesn't
% actually guarantee you'll get the requested % back

fnum =[1:length(data_full)];
data = [data_full fnum'];

%% Remove frames with > 4 landmarks missing
drop = false(1,length(data)); %decide what to drop in loop before dropping or it'll throw an index error

for frame = 1:length(data)
    if sum(isnan(data(frame,:))) > 12
        drop(frame) = true;
    end
end

if sum(drop) > length(data) * (1 - (percent_to_use/100))
    warning('Over 90% of frames have more than 4 markers missing...yikes')
end

data(drop,:) = [];

%% Remove runs of frames with > 2 consecutive drops for any marker

nans = isnan(data);
runs = false(size(data));
runs(1:2,:) = nans(1:2,:);
runs(end-1:end,:) = nans(end-1:end,:);

% 'rescues' the frames that have up to 2 dropped in a row
for landmark = 1:63
    
    for frame = 3:length(nans)-2
        if nans(frame,landmark) == 1
            if (nans(frame-1,landmark) == 1 & nans(frame-2,landmark) == 1) || (nans(frame+1,landmark) == 1 & nans(frame+2,landmark) == 1) || (nans(frame-1,landmark) == 1 & nans(frame+1,landmark) == 1)
                runs(frame,landmark) = 1;
            else runs(frame,landmark) = 0;
            end
        end
    end
    
    % check first 2 and last 2 frames which can't run in the above loop
    if runs(1,landmark) == 1 & runs(2,landmark) == 1
        if runs(3,landmark) == 0
            runs(1:2,landmark) = 0;
        end    
    elseif runs(1,landmark) == 1 & runs(2,landmark) == 0
        runs(1,landmark) == 0;     
    end
    
    if runs(end,landmark) == 1 & runs(end-1,landmark) == 1
        if runs(end-2,landmark) == 0
            runs(end-1:end,landmark) == 0;
        end 
    elseif runs(end,landmark) == 1 & runs(end-1,landmark) == 0
        runs(end,landmark) = 0; 
    end
    
end

% if any landmarks still need to be dropped, full frame must be dropped.
% first change values of frames to be dropped to 0 (deleting messes up loop)
for landmark = 1:63
    for frame = 1:length(runs)
        if runs(frame,landmark) == 1
            data(frame,:) = 0;
        end
    end
end

%finally remove the frames and takes out the frame numbers
data(data == 0) = [];
data = reshape(data, numel(data)/64, 64);

fnum = data(:,64);
data = data(:,1:63);

disp(strcat(string((length(data)/length(data_full)*100)),'% of frames remain'))

%x = input(strcat(string((length(data)/length(data_full)*100)),'% of frames remain. Do you want to cut to ', string(percent_to_use),'%? (y/n)'))

%if x = 'y'
