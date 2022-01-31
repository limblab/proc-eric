function plot_pca_lpf_pc_times(joint_interested, time_start, time_stop, data_full, pca4, pca10, error4, error10, train_ind_4, train_ind_10)%,frames_to_drop)

% Low-pass filters the input data at 5 Hz, calculates velocities for input
% data and 6 pca runs

%% Setup

[x,y,z] = get_joint_coords(data_full, joint_interested);

%t = [193:0.0333333:195];
t = [time_start:0.0333333:time_stop];
pcs = [4 10];
supertitle = strcat(joint_interested,' - ALS PCA vs 5 Hz LPF');

%% Interp and lowpass

data_interpolated = data_full;
nanx = isnan(data_interpolated);
datum = 1:numel(data_interpolated);
data_interpolated(nanx) = interp1(datum(~nanx), data_interpolated(~nanx), datum(nanx));

%brute force fix right now because blargh
data_interpolated(46993:end,63) = nanmean(data_interpolated(:,63));

data_lpf = lowpass(data_interpolated,5,30);
%posx_lpf = lowpass(data_interpolated(:,x),5,30);
%posy_lpf = lowpass(data_interpolated(:,y),5,30);
%posz_lpf = lowpass(data_interpolated(:,z),5,30);

for k = 1:20
    lpf_error = get_lpf_error(data_full,data_lpf);

    e_lpf(k) = lpf_error;
end

%% Replace frames not in the interpolation (train set)

pca4_all_replaced = replace_missing_frames(data_full, pca4, train_ind_4);
pca10_all_replaced = replace_missing_frames(data_full, pca10, train_ind_10);

pca4_all_replaced = remove_pca_outliers(pca4_all_replaced);
pca10_all_replaced = remove_pca_outliers(pca10_all_replaced);


%% Plot
f = figure;
hold on
f.Position = [10 10 1750 800];
%position
subplot(3,1,1)
hold on
plot(t,data_full(time_start*30:time_stop*30,x),'linewidth',3,'Color','k')
plot(t,data_lpf(time_start*30:time_stop*30,x),'linewidth',2,'Color','r')
plot(t, pca4_all_replaced(time_start*30:time_stop*30,x),'linewidth',2,'Color','#4DBEEE')
plot(t,pca10_all_replaced(time_start*30:time_stop*30,x),'linewidth',2,'Color','#7E2F8E')

title('X pos')
legend('rawData',strcat('5Hz LPF - Error = ',string(mean(e_lpf))), strcat(string(pcs(1)),'PCs - Error = ',string(mean(error4(3,:)))),strcat(string(pcs(2)),'PCs - Error = ',string(mean(error10(3,:)))))
xlabel('sec')
ylabel('mm')

subplot(3,1,2)
hold on
plot(t,data_full(time_start*30:time_stop*30,y),'linewidth',3,'Color','k')
plot(t,data_lpf(time_start*30:time_stop*30,y),'linewidth',2,'Color','r')
plot(t, pca4_all_replaced(time_start*30:time_stop*30,y),'linewidth',2,'Color','#4DBEEE')
plot(t,pca10_all_replaced(time_start*30:time_stop*30,y),'linewidth',2,'Color','#7E2F8E')

title('Y pos')
legend('rawData',strcat('5Hz LPF - Error = ',string(mean(e_lpf))), strcat(string(pcs(1)),'PCs - Error = ',string(mean(error4(3,:)))),strcat(string(pcs(2)),'PCs - Error = ',string(mean(error10(3,:)))))
xlabel('sec')
ylabel('mm')

subplot(3,1,3)
hold on
plot(t,data_full(time_start*30:time_stop*30,z),'linewidth',3,'Color','k')
plot(t,data_lpf(time_start*30:time_stop*30,z),'linewidth',2,'Color','r')
plot(t, pca4_all_replaced(time_start*30:time_stop*30,z),'linewidth',2,'Color','#4DBEEE')
plot(t,pca10_all_replaced(time_start*30:time_stop*30,z),'linewidth',2,'Color','#7E2F8E')

title('Z pos')
legend('rawData',strcat('5Hz LPF - Error = ',string(mean(e_lpf))), strcat(string(pcs(1)),'PCs - Error = ',string(mean(error4(3,:)))),strcat(string(pcs(2)),'PCs - Error = ',string(mean(error10(3,:)))))
xlabel('sec')
ylabel('mm')


sgtitle(supertitle)

saveas(f,strcat('/Users/ercrg/LimbLab/analysis/12_4/full/als/',joint_interested,' - ALS PC comparison.png'))