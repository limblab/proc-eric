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
data_table = readtable('output_3d_data.csv');%select dataset to analyze
names = data.Properties.VariableNames;

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

%% Begin dropping markers for selected consecutative frames
markers = cell(1,21);
for i = 1:21 %set aside column index of the coordinates of each marker in the dataset
    m = ((i-1)*3+1):i*3;
    markers{i} = m; 
end

scrambled = Input(:,randperm(size(Input, 2)));
markers_to_drop = [1 4 8 16 20];

%% Interpolate

for k = 1 % number of iterations of random dropping and interpolating to run
    
%ms = randperm(21); % randomly select markers

for i = 1:5 % Number of Markers Dropped
    
    marker_selected = ms(1:markers_to_drop(i));% markers to drop
    marker = [markers{marker_selected}];
    number = round(length(Input)*(10/100)); % number of groups of consecuative frames to drop
    
    for j = 5 % number of consecuative frames marker is dropped
        
        % Drop tracking in selected frames
        
        frames = frames2drop(length(Input),number,j,dont_drop);
        Input_test = scrambled;
%        Input_test = Input;
        Input_test(marker,frames) = NaN;
        

        % Interpolate
%         interpolated = interpolation_method(Input_test')';
%         interpolated = ppca_interpolation(Input_test')';
          interpolated = pca_interpolation(Input_test');
          
        % Compute Error
%        E = sum((interpolated - Input).^2)/numel(frames);
%        error(i,j,k) = mean(E(E>0)); % average error on interpolated points
         original = Input';
         dropped = Input_test';
         scrambled_T = scrambled';
         
         
         dropped_before = scrambled_T(isnan(dropped));
         dropped_after = interpolated(isnan(dropped));
         dropped_means = subtract_means(isnan(dropped));
        
         E = sum(abs(dropped_after - dropped_before)) / sum(sum(isnan(Input_test)));
         e = dropped_after - dropped_means;% / sum(sum(isnan(Input_test)));
         error(i,j,k) = E; % average error on interpolated points


    end
end
end
%% Create heatmap of average error over k runs
check = error(:,5);
figure
heatmap(mean(check,3))
xlabel('Consecutive Frames Dropped')
ylabel('Number of Markers Dropped')
title('Average Error on Interpolated Frames')