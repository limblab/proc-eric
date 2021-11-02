%%% Assembling neural data to complement DLC kinematics for Zach Danziger's
%%% team at FIU. Work in progress...it's all kind of hacked together from
%%% xds, cds, and ex structures. A lot borrowed from raw_to_xds script

%Get xds, cds, bss = binned spike data for all channels, save them as
%needed for Ege, Fabio, etc.
% Saves a .mat with the variables FIU wants. Only problem is the video sync
% pulses...Finally figured out they're 3.3 ms wide, so sampling them at
% 33ms basically yields one giant 'on'

%clc
clear
params = struct( ...
    'monkey_name','Pop', ...
    'array_name','M1', ...
    'task_name','FR', ...
    'ran_by','eg', ...
    'lab',1, ...
    'bin_width',0.03333345, ...
    'sorted',1, ...
    'requires_raw_emg',1);

base_dir = '/Users/ercrg/LimbLab/data/Pop_18E3/CerebusData/20211009/';
file_name = '20211009_Pop_FR_001';
map_dir = '/Users/ercrg/LimbLab/data/Pop_18E3/Array Map Files/Implant_2020_01/6250-002086/';
map_name = 'SN 6250-002086.cmp';
mat_exists = 0;

[xds, cds, bss] = raw_to_xds(base_dir, file_name, map_dir, map_name, params);

%clearvars -except base_dir file_name mat_exists cds bss xds analog_fs nev_fs fc sync_timestamps

%Load unsorted .mat file, if any
if mat_exists == 1
    mat_dir = append(base_dir, 'FIU/');
    mat_name = 'Pop_20201217_FR_001_simplified.mat';
    load(append(mat_dir,mat_name));
end

%clear base_dir mat_name mat_exists

%get binned spikes
binned_spikes_sorted = int64(bss');
clear bss

%get unit list
for i = 1:length(cds.units)
units_sorted(i).chan = cds.units(i).chan;
units_sorted(i).ID = cds.units(i).ID;
end

%get spike timestamps (x30k? Ask FIU)
spike_timestamps_sorted = {};
for i = 1:length(cds.units)
    spike_timestamps_sorted{1,i} = cds.units(i).spikes{:,1};
end

%clear cds i file_name mat_dir %fix what gets cleared here if you implement the save function

%smooth binned spikes. Adjust Gaussian kernel width as advised. Change to
%50ms, ie 1.5 bins?
smoothed_binned_spikes_sorted_50ms = smoothdata(binned_spikes_sorted,2,'gaussian',1.5); %2 smooths along rows, default is down columns
smoothed_binned_spikes_sorted = smoothdata(binned_spikes_sorted,2,'gaussian',10); %just seeing what this looks like

ns3 = openNSx('/Users/ercrg/LimbLab/data/Pop_18E3/CerebusData/20211009/20211009_Pop_FR_001.ns3');
analog_fs = ns3.MetaTags.SamplingFreq;
nev_fs = ns3.MetaTags.TimeRes;
video_sync_pulses = ns3.Data(12,:); %should usually be 13, but was down a channel on 10/9
%binned_sync_pulses = bin_sync_pulses(video_sync_pulses,params.bin_width,analog_fs);

%save file - should append to simplified if it exists or creat a new name if it doesn't.
save_dir = '/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20211009/';
save_name = strcat(save_dir, file_name,'_simplified_sorted.mat');
save(save_name, 'analog_fs', 'nev_fs', 'binned_spikes_sorted', 'smoothed_binned_spikes_sorted', 'smoothed_binned_spikes_sorted_50ms', 'spike_timestamps_sorted', 'units_sorted', 'video_sync_pulses');