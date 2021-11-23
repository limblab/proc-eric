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
data_full = table2array(data_table(:,ind));
data_full = data_full(1:47000,:);
 
%% Begin dropping markers for selected consecutative frames
markers = cell(1,21);
for i = 1:21 %set aside column index of the coordinates of each marker in the dataset
    m = ((i-1)*3+1):i*3;
    markers{i} = m; 
end
 
%scrambled = Input(:,randperm(size(Input, 2)));
 
markers_to_drop = [1 4 8 16 20];
 
%% Interpolate
 
%for k = 1:20 % number of iterations of random dropping and interpolating to run
k = 1;
    ms = randperm(21); % randomly select markers
    for i = 1:5 % Number of Markers Dropped
 
        marker_selected = ms(1:markers_to_drop(i));% markers to drop
        marker = [markers{marker_selected}];
%        number = round(length(Input)*(10/100)); % number of groups of consecuative frames to drop
 
%            for j = 1:5; % number of consecuative frames marker is dropped
            j=1;
            
            % put frames dopped back into full dataset
           frames_to_drop = frames2drop_full(data_full,markers_to_drop(i),10);
%            frames_to_drop = frames2drop_full_consec(data_full,markers_to_drop(i),j,10);

            %do this in interp_method?
%            Input_full_test = data_full;
%            Input_full_test(frames_to_drop, marker) = NaN;
 
 
            %[train_error_1, test_error_1, ~, ~, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,1);
            %[train_error_2, test_error_2, ~, ~, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,2);
            %[train_error_3, test_error_3, ~, ~, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,3);
            [train_error_4, test_error_4, train_recon_4, test_recon_4, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,4);
            [train_error_5, test_error_5, train_recon_5, test_recon_5, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,5);
            [train_error_6, test_error_6, train_recon_6, test_recon_6, ~, ~,] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,6);
            [train_error_7, test_error_7, train_recon_7, test_recon_7, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,7);
            [train_error_8, test_error_8, train_recon_8, test_recon_8, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,8);
            %[train_error_9, test_error_9, ~, ~, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,9);
            %[train_error_10, test_error_10, ~, ~, ~, ~] = full_interpolation_method('SVD',data_full,frames_to_drop,marker,10);

            [train_error_ppca_5, test_error_ppca_5, train_recon_ppca_5, test_recon_ppca_5, ~, times_ppca_5] = full_interpolation_method('PPCA',data_full,frames_to_drop,marker,5);
            [train_error_als_5, test_error_als_5, train_recon_als_5, test_recon_als_5, ~, times_als_5] = full_interpolation_method('ALS',data_full,frames_to_drop,marker,5);

            %t1(i,j,k) = times_1; e1(i,j,k) = errors_1;
            %t2(i,j,k) = times_2; e2(i,j,k) = errors_2;
            %t3(i,j,k) = times_3; e3(i,j,k) = errors_3;
            %t4(i,j,k) = times_4; 
            e4_train(i,j,k) = train_error_4;
            e4_test(i,j,k) = test_error_4;
            %t5(i,j,k) = times_5; 
            e5_train(i,j,k) = train_error_5;
            e5_test(i,j,k) = test_error_5;
            %t6(i,j,k) = times_6; 
            e6_train(i,j,k) = train_error_6;
            e6_test(i,j,k) = test_error_6;
            %t7(i,j,k) = times_7; 
            e7_train(i,j,k) = train_error_7;
            e7_test(i,j,k) = test_error_7;
            %t8(i,j,k) = times_8; 
            e8_train(i,j,k) = train_error_8;
            e8_test(i,j,k) = test_error_8;
            %t9(i,j,k) = times_9; e9(i,j,k) = errors_9;
            %t10(i,j,k) = times_10; e10(i,j,k) = errors_10; 
            
            e5_ppca_train(i,j,k) = train_error_ppca_5;
            e5_ppca_test(i,j,k) = test_error_ppca_5;
            times_ppca(i,j,k) = times_ppca_5;
            
            e5_als_train(i,j,k) = train_error_als_5;
            e5_als_test(i,j,k) = test_error_als_5;
            times_als(i,j,k) = times_als_5;            
%            end
    end
%end
 
 
%% Create heatmap of average error over k runs
%check = error(:,1);
figure
hold on
% heatmap(mean(check,3))
%plot(markers_to_drop,error(:,1),'linewidth',4); hold on
%plot(markers_to_drop,mean(e1,3),'linewidth',3,'Color','b')
%plot(markers_to_drop,mean(e2,3),'linewidth',3,'Color','m')
%plot(markers_to_drop,mean(e3,3),'linewidth',3,'Color','c')
plot(markers_to_drop,mean(e4,3),'linewidth',3,'Color','#7E2F8E')
plot(markers_to_drop,mean(e5,3),'linewidth',3,'Color','#77AC30')
plot(markers_to_drop,mean(e6,3),'linewidth',3,'Color','#4DBEEE')
plot(markers_to_drop,mean(e7,3),'linewidth',3,'Color','#A2142F')
plot(markers_to_drop,mean(e8,3),'linewidth',3,'Color','#D95319')
plot(markers_to_drop,mean(e9,3),'linewidth',3,'Color','#0072BD')
plot(markers_to_drop,mean(e10,3),'linewidth',3,'Color','#EDB120')

title('PCA - SVD Error by Markers Dropped, PC Comparison')
xlabel('Number of markers dropped')
ylabel('Error')
legend('4','5','6','7','8','9','10')

%% Scree plot

figure
hold on

plot(explained4(1:10,2),'linewidth',3)

title('Variance Explained by PCs - Full restraint')
xlabel('Number of PCs')
ylabel('Variance Explained')
xlim([1 10])
ylim([50 100])

%% error by PCs

PCs = [1:10];
error_1 = [mean(e1(1,:,:)) mean(e2(1,:,:)) mean(e3(1,:,:)) mean(e4(1,:,:)) mean(e5(1,:,:)) mean(e6(1,:,:)) mean(e7(1,:,:)) mean(e8(1,:,:)) mean(e9(1,:,:)) mean(e10(1,:,:))];
error_8 = [mean(e1(3,:,:)) mean(e2(3,:,:)) mean(e3(3,:,:)) mean(e4(3,:,:)) mean(e5(3,:,:)) mean(e6(3,:,:)) mean(e7(3,:,:)) mean(e8(3,:,:)) mean(e9(3,:,:)) mean(e10(3,:,:))];
error_16 = [mean(e1(4,:,:)) mean(e2(4,:,:)) mean(e3(4,:,:)) mean(e4(4,:,:)) mean(e5(4,:,:)) mean(e6(4,:,:)) mean(e7(4,:,:)) mean(e8(4,:,:)) mean(e9(4,:,:)) mean(e10(4,:,:))];

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
title('PCA - SVD Error by PCs - Full restraint')
%xlim([0 20])
%ylim([0 5.5])

%% Heatmap

figure
h1 = heatmap(mean(e1,3));
h1.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 1 PC')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h1,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/1pc.png')

figure
h2 = heatmap(mean(e2,3));
h2.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 2PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h2,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/2pcs.png')


figure
h3 = heatmap(mean(e3,3));
h3.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 3 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h3,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/3pcs.png')


figure
h4 = heatmap(mean(e4,3));
h4.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 4 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h4,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/4pcs.png')


figure
h5 = heatmap(mean(e5,3));
h5.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 5 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h5,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/5pcs.png')


figure
h6 = heatmap(mean(e6,3));
h6.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 6 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h6,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/6pcs.png')


figure
h7 = heatmap(mean(e7,3));
h7.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 7 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h7,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/7pcs.png')

figure
h8 = heatmap(mean(e8,3));
h8.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 8')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h8,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/8pcs.png')


figure
h9 = heatmap(mean(e9,3));
h9.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 9 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h9,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/9pcs.png')


figure
h10 = heatmap(mean(e10,3));
h10.YDisplayLabels = num2cell(markers_to_drop);
title('Error by Dropped Markers and Dropped Consecutive Frames - 10 PCs')
xlabel('Consecutive Frames Dropped')
ylabel('Number of markers Dropped')
saveas(h10,'/Users/ercrg/LimbLab/analysis/pca 11_20/8_14/heatmaps/10pcs.png')


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
legend('1','2','3','4','5','6','7')
title('Computation time,PC comparison')
ylim([0.2 0.3])