%% PPCA_metric
clc,clear
% Description: this script is the main file for evaluating an interpolation
% method such as PPCA. This script obtains 'good tracking' from a given DLC
% session and calls the function 'frames2drop.m' to randomly drop selected markers over groups of consecuative
% frames. 

%It calls the function 'interpolation_method.m' to attempt to
% interpolate the purposefully dropped markers and returns the error
% between the estimates and actual tracking.


% You can plug your PPCA code directly into interpolation_method.m and then
% just run this script to compute the error and plot your results.

%% Load in session data
data_table = readtable('/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20210814/106/output_3d_data.csv');%select dataset to analyze
names = data_table.Properties.VariableNames;

%% Obtain Column Indeces with Relevent DLC Data
columns = 1:size(data_table,2);
error_columns = ~cellfun('isempty',strfind(names,'error'));
ncam_columns  = ~cellfun('isempty',strfind(names,'ncams'));
score_columns =  ~cellfun('isempty',strfind(names,'score'));
irrelevent = score_columns+ncam_columns+error_columns;
irrelevent(end) = 1; % remove frame nums also - after getting the good frames
ind = columns(~irrelevent);
%% Generate test dataset
% begin with perfect tracking
data = interpolatable_frames(data_table,2,ind); % obtain frames without markers dropping %eg - why 2?
frames = data(:,end);
dont_drop = frames(diff(data(:,end))>1); % consecuative rows of data which are not consecuative video frames should not be dropped.
Input = data(:,ind)';
data = array2table(data,'VariableNames',names);

%% generate 'full' dataset to use
percent_to_use = 25;

data_full = table2array(data_table(:,ind));
data_full(length(data_full)*(percent_to_use/100):end, :) = [];
%% Begin dropping markers for selected consecutative frames
markers = cell(1,21);
for i = 1:21 %set aside column index of the coordinates of each marker in the dataset
    m = ((i-1)*3+1):i*3;
    markers{i} = m; 
end

scrambled = Input(:,randperm(size(Input, 2)));

markers_to_drop = [1 4 8 16 20];

%% Interpolate
%error = [];
%error_scram = [];
%error_full = [];
%do_scramble = 0;

for k = 1:20 % number of iterations of random dropping and interpolating to run
    ms = randperm(21); % randomly select markers
    for i = 1:5 % Number of Markers Dropped

        marker_selected = ms(1:markers_to_drop(i));% markers to drop
        marker = [markers{marker_selected}];
        number = round(length(Input)*(10/100)); % number of groups of consecuative frames to drop

        for j = 1:5 % number of consecuative frames marker is dropped
    
            % Drop tracking in selected frames

            frames = frames2drop(length(Input),number,j,dont_drop);
            
            Input_test = Input;
            Input_test(marker,frames) = NaN;
            perm_use = randperm(size(Input_test,2));
            Input_test_scram = Input_test(:,perm_use);
            
            % put frames dopped back into full dataset
            frames_to_drop = frames2drop_full(data_full,markers_to_drop(i),10);
            
            Input_full_test = data_full;
            Input_full_test(frames_to_drop, marker) = NaN;
%            perm_use_full = randperm(size(data_full,1));
%            scrambled_full = data_full(perm_use_full,:);

            % Interpolate
            tic
    %        interpolated = interpolation_method(Input_test')';
     %       interp_full = ppca_interpolation(Input_full_test);
    %        interpolated = pca_interpolation(Input_test');
            %interp_scram = pca_interpolation(Input_test_scram');
    %        interp_scram_full = pca_interpolation(scrambled_full);
  
            interp_full = pca_interpolation(Input_full_test);
            toc
            
            % undo scrambling before computing error to match up data
            % points
            if do_scramble
                [~,perm_inv] =sort(perm_use);
                interp_scram = interp_scram(perm_inv,:);
            end
            
            % Compute Error
    %        E = sum((interpolated - Input).^2)/numel(frames);
    %        error(i,j,k) = mean(E(E>0)); % average error on interpolated points
 %           original = Input';
 %           dropped = Input_test';

%            dropped_before = original(isnan(dropped));
 %           dropped_after = interpolated(isnan(dropped));
  %          dropped_scram = interp_scram(isnan(dropped));
            
            % for full dataset only
            full_before = data_full(frames_to_drop,marker);
            dropped_full = interp_full(frames_to_drop,marker);
%            dropped_scram_full = interp_scram_full(frames_to_drop,marker);
            
            dont_test = isnan(full_before); %in case some of the randomly dropped markers were already missing
            full_before = full_before(~dont_test);
            dropped_full = dropped_full(~dont_test);
 %           dropped_full_scram = dropped_scram_full(~dont_test);
 
            if sum(sum(isnan(dropped_full))) > 0 %ppca not interpolating long stretches of all markers dropped
                not_interpolated = isnan(dropped_full);
                full_before = full_before(~not_interpolated);
                dropped_full = dropped_full(~not_interpolated);
            end
                
           % error(i,j,k) = sum(abs(dropped_after - dropped_before)) / sum(sum(isnan(Input_test))); % average error on interpolated points
%            error_scram(i,j,k) = sum(abs(dropped_scram - dropped_before)) / sum(sum(isnan(Input_test)));
             error_full(i,j,k) = sum(abs(dropped_full - full_before)) / numel(dropped_full); %different format, but might change if we're looking frame by frame, or at all NaNs
%            error_full_ppca(i,j,k) = sum(abs(dropped_full - full_before)) / numel(dropped_full); %different format, but might change if we're looking frame by frame, or at all NaNs
%            error_full_scram(i,j,k) = sum(abs(dropped_full_scram - full_before)) / numel(dropped_full_scram);
        end


        end
        end


%% Create heatmap of average error over k runs
%check = error(:,1);
figure
hold on
% heatmap(mean(check,3))
%plot(markers_to_drop,error(:,1),'linewidth',4); hold on
plot(markers_to_drop,mean(linear_svd_13k_error,3),'linewidth',3,'Color','#0072BD');
plot(markers_to_drop,mean(linear_svd_47k_error,3),'linewidth',3,'Color','#EDB120')
%plot(markers_to_drop,error_full(:,3),'linewidth',3,'Color','#77AC30');
% xlabel('Consecutive Frames Dropped')
% ylabel('Number of Markers Dropped')
% title('Average Error on Interpolated Frames')

xlabel('Number of markers dropped')
ylabel('Error')
legend('13.5k frames','47k frames')
title('PCA - SVD Error by Markers Dropped - 7 PCs')

%% Plot times
figure
hold on

plot(markers_to_drop,mean(linear_svd_13k_times,3),'linewidth',3,'Color','#0072BD');
plot(markers_to_drop,mean(linear_svd_47k_times,3),'linewidth',3,'Color','#EDB120')
%plot(markers_to_drop,times(:,3),'linewidth',3,'Color','#77AC30');

xlabel('Number of markers dropped')
ylabel('Time to compute (s)')
legend('13.5k frames','47k frames')
title('Computation time comparison')
ylim([0.2 1.5])