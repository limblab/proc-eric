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
data_full = table2array(data_table(:,ind));
data_full = data_full(1:47000,:);
 
%% Begin dropping markers for selected consecutative frames
markers = cell(1,21);
for i = 1:21 %set aside column index of the coordinates of each marker in the dataset
    m = ((i-1)*3+1):i*3;
    markers{i} = m; 
end
 
scrambled = Input(:,randperm(size(Input, 2)));
 
markers_to_drop = [1 4 8 16 20];
 
%% Interpolate
error_full = [];
 
for k = 1:20 % number of iterations of random dropping and interpolating to run
    ms = randperm(21); % randomly select markers
    for i = 1:5 % Number of Markers Dropped
 
        marker_selected = ms(1:markers_to_drop(i));% markers to drop
        marker = [markers{marker_selected}];
        number = round(length(Input)*(10/100)); % number of groups of consecuative frames to drop
 
            j = 1; % number of consecuative frames marker is dropped
  
            
            % put frames dopped back into full dataset
            frames_to_drop = frames2drop_full(data_full,markers_to_drop(i),10);
            
            Input_full_test = data_full;
            Input_full_test(frames_to_drop, marker) = NaN;
 
 
%            [times_1, errors_1] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,1);
%            [times_2, errors_2] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,2);
%            [times_3, errors_3] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,3);
%            [times_4, errors_4] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,4);
%            [times_5, errors_5] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,5);
%            [times_6, errors_6] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,6);
%            [times_7, errors_7] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,7);
            [times_8, errors_8] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,8);
            [times_9, errors_9] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,9);
            [times_10, errors_10] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,10);

 
%            t1(i,j,k) = times_1; e1(i,j,k) = errors_1;
%            t2(i,j,k) = times_2; e2(i,j,k) = errors_2;
%            t3(i,j,k) = times_3; e3(i,j,k) = errors_3;
%            t4(i,j,k) = times_4; e4(i,j,k) = errors_4;
%            t5(i,j,k) = times_5; e5(i,j,k) = errors_5;
%            t6(i,j,k) = times_6; e6(i,j,k) = errors_6;
%            t7(i,j,k) = times_7; e7(i,j,k) = errors_7;
            t8(i,j,k) = times_8; e8(i,j,k) = errors_8;
            t9(i,j,k) = times_9; e9(i,j,k) = errors_9;
            t10(i,j,k) = times_10; e10(i,j,k) = errors_10;            
    end
end
 
 
%% Create heatmap of average error over k runs
%check = error(:,1);
figure
hold on
% heatmap(mean(check,3))
%plot(markers_to_drop,error(:,1),'linewidth',4); hold on
%plot(markers_to_drop,mean(e1,3),'linewidth',3,'Color','#0072BD')
%plot(markers_to_drop,mean(e2,3),'linewidth',3,'Color','#D95319')
%plot(markers_to_drop,mean(e3,3),'linewidth',3,'Color','#EDB120')
plot(markers_to_drop,mean(e4,3),'linewidth',3,'Color','#7E2F8E')
plot(markers_to_drop,mean(e5,3),'linewidth',3,'Color','#77AC30')
plot(markers_to_drop,mean(e6,3),'linewidth',3,'Color','#4DBEEE')
plot(markers_to_drop,mean(e7,3),'linewidth',3,'Color','#A2142F')
plot(markers_to_drop,mean(e8,3),'linewidth',3,'Color','#0072BD')
plot(markers_to_drop,mean(e9,3),'linewidth',3,'Color','#D95319')
plot(markers_to_drop,mean(e10,3),'linewidth',3,'Color','#EDB120')

%% 
figure
hold on
plot(PCs,error_1,'linewidth',3,'Color','#7E2F8E')
plot(PCs,error_8,'linewidth',3,'Color','#EDB120')
plot(PCs,error_16,'linewidth',3,'Color','#4DBEEE')

% xlabel('Consecutive Frames Dropped')
% ylabel('Number of Markers Dropped')
% title('Average Error on Interpolated Frames')

xlabel('Number of PCs')
ylabel('Error')
legend('1 Marker Dropped','8 Markers Dropped','16 Markers Dropped')
title('PCA - SVD Error by Markers Dropped, PC Comparison')
%xlim([0 20])
%ylim([0 5.5])
%% Plot times
figure
hold on

plot(markers_to_drop,mean(t1,3),'linewidth',3,'Color','#0072BD')
plot(markers_to_drop,mean(t2,3),'linewidth',3,'Color','#D95319')
plot(markers_to_drop,mean(t3,3),'linewidth',3,'Color','#EDB120')
plot(markers_to_drop,mean(t4,3),'linewidth',3,'Color','#7E2F8E')
plot(markers_to_drop,mean(t5,3),'linewidth',3,'Color','#77AC30')
plot(markers_to_drop,mean(t6,3),'linewidth',3,'Color','#4DBEEE')
plot(markers_to_drop,mean(t7,3),'linewidth',3,'Color','#A2142F')

xlabel('Number of markers dropped')
ylabel('Time to compute (s)')
legend('13.5k frames','47k frames')
title('Computation time,PC comparison')
ylim([0.2 1.5])