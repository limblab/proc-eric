function plot_pca_lpf(joint_interested,time_start, time_stop, data_full, data_truncated, pca4, pca5, pca6, pca7, pca8, pca9, pca10,e4, e5, e6, e7, e8, e9, e10, f2d4, f2d5, f2d6, f2d7, f2d8, f2d9, f2d10, train_ind_4, train_ind_5, train_ind_6, train_ind_7, train_ind_8, train_ind_9, train_ind_10)%,frames_to_drop)

% Low-pass filters the input data at 5 Hz, calculates velocities for input
% data and 6 pca runs

%% Setup

[x,y,z] = get_joint_coords(data_full, joint_interested);

%t = [193:0.0333333:195];
t = [time_start:0.0333333:time_stop];
pcs = [4 5 6 7 8 9 10];
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

    
%% Pull out frames that were interpolated for scattering
%interpolated = sort(frames_to_drop(frames_to_drop >= time_start*30 & frames_to_drop <= time_stop*30));
interpolated_fnums_4 = get_OG_fnums(f2d4, train_ind_4, data_truncated);
interpolated_fnums_5 = get_OG_fnums(f2d5, train_ind_5, data_truncated);
interpolated_fnums_6 = get_OG_fnums(f2d6, train_ind_6, data_truncated);
interpolated_fnums_7 = get_OG_fnums(f2d7, train_ind_7, data_truncated);
interpolated_fnums_8 = get_OG_fnums(f2d8, train_ind_8, data_truncated);
interpolated_fnums_9 = get_OG_fnums(f2d9, train_ind_9, data_truncated);
interpolated_fnums_10 = get_OG_fnums(f2d10, train_ind_10, data_truncated);

% full data frame numbers
fnum_plot_4 = interpolated_fnums_4(interpolated_fnums_4 >= time_start*30 & interpolated_fnums_4 <= time_stop*30);
fnum_plot_5 = interpolated_fnums_5(interpolated_fnums_5 >= time_start*30 & interpolated_fnums_5 <= time_stop*30);
fnum_plot_6 = interpolated_fnums_6(interpolated_fnums_6 >= time_start*30 & interpolated_fnums_6 <= time_stop*30);
fnum_plot_7 = interpolated_fnums_7(interpolated_fnums_7 >= time_start*30 & interpolated_fnums_7 <= time_stop*30);
fnum_plot_8 = interpolated_fnums_8(interpolated_fnums_8 >= time_start*30 & interpolated_fnums_8 <= time_stop*30);
fnum_plot_9 = interpolated_fnums_9(interpolated_fnums_9 >= time_start*30 & interpolated_fnums_9 <= time_stop*30);
fnum_plot_10 = interpolated_fnums_10(interpolated_fnums_10 >= time_start*30 & interpolated_fnums_10 <= time_stop*30);

%truncated data frame numbers
plot_frames_4 = get_interp_frames2plot(train_ind_4, fnum_plot_4, data_truncated);
plot_frames_5 = get_interp_frames2plot(train_ind_5, fnum_plot_5, data_truncated);
plot_frames_6 = get_interp_frames2plot(train_ind_6, fnum_plot_6, data_truncated);
plot_frames_7 = get_interp_frames2plot(train_ind_7, fnum_plot_7, data_truncated);
plot_frames_8 = get_interp_frames2plot(train_ind_8, fnum_plot_8, data_truncated);
plot_frames_9 = get_interp_frames2plot(train_ind_9, fnum_plot_9, data_truncated);
plot_frames_10 = get_interp_frames2plot(train_ind_10, fnum_plot_10, data_truncated);

%% Plot
f = figure;
hold on
f.Position = [10 10 1750 800];
%position
subplot(3,1,1)
hold on
plot(t,data_full(time_start*30:time_stop*30,x),'linewidth',3,'Color','k')
plot(t,data_lpf(time_start*30:time_stop*30,x),'linewidth',2,'Color','r')
scatter(fnum_plot_4/30, pca4(plot_frames_4,x),45,'filled','Color','#4DBEEE')
scatter(fnum_plot_5/30, pca5(plot_frames_5,x),45,'filled','Color','#A2142F')
scatter(fnum_plot_6/30,pca6(plot_frames_6,x),45,'filled','Color','#0072BD')
scatter(fnum_plot_7/30,pca7(plot_frames_7,x),45,'filled','Color','#D95319')
scatter(fnum_plot_8/30,pca8(plot_frames_8,x),45,'filled','Color','#EDB120')
scatter(fnum_plot_9/30,pca9(plot_frames_9,x),45,'filled','Color','#7E2F8E')
scatter(fnum_plot_10/30,pca10(plot_frames_10,x),45,'filled','Color','#77AC30')

title('X pos')
legend('rawData',strcat('5Hz LPF - Error = ',string(mean(e_lpf))), strcat(string(pcs(1)),'PCs - Error = ',string(mean(e4))),strcat(string(pcs(2)),'PCs - Error = ', string(mean(e5))),strcat(string(pcs(3)),'PCs - Error = ', string(mean(e6))),strcat(string(pcs(4)),'PCs - Error = ',string(mean(e7))),strcat(string(pcs(5)),'PCs - Error = ',string(mean(e8))), strcat(string(pcs(6)),'PCs - Error = ', string(mean(e9))), strcat(string(pcs(7)),'PCs - Error = ', string(mean(e10))))
xlabel('sec')
ylabel('mm')

subplot(3,1,2)
hold on
plot(t,data_full(time_start*30:time_stop*30,y),'linewidth',3,'Color','k')
plot(t,data_lpf(time_start*30:time_stop*30,y),'linewidth',2,'Color','r')
scatter(fnum_plot_4/30, pca4(plot_frames_4,y),45,'filled','Color','#4DBEEE')
scatter(fnum_plot_5/30, pca5(plot_frames_5,y),45,'filled','Color','#A2142F')
scatter(fnum_plot_6/30,pca6(plot_frames_6,y),45,'filled','Color','#0072BD')
scatter(fnum_plot_7/30,pca7(plot_frames_7,y),45,'filled','Color','#D95319')
scatter(fnum_plot_8/30,pca8(plot_frames_8,y),45,'filled','Color','#EDB120')
scatter(fnum_plot_9/30,pca9(plot_frames_9,y),45,'filled','Color','#7E2F8E')
scatter(fnum_plot_10/30,pca10(plot_frames_10,y),45,'filled','Color','#77AC30')

title('Y pos')
legend('rawData',strcat('5Hz LPF - Error = ',string(mean(e_lpf))), strcat(string(pcs(1)),'PCs - Error = ',string(mean(e4))),strcat(string(pcs(2)),'PCs - Error = ', string(mean(e5))),strcat(string(pcs(3)),'PCs - Error = ', string(mean(e6))),strcat(string(pcs(4)),'PCs - Error = ',string(mean(e7))),strcat(string(pcs(5)),'PCs - Error = ',string(mean(e8))), strcat(string(pcs(6)),'PCs - Error = ', string(mean(e9))), strcat(string(pcs(7)),'PCs - Error = ', string(mean(e10))))
xlabel('sec')
ylabel('mm')

subplot(3,1,3)
hold on
plot(t,data_full(time_start*30:time_stop*30,z),'linewidth',3,'Color','k')
plot(t,data_lpf(time_start*30:time_stop*30,z),'linewidth',2,'Color','r')
scatter(fnum_plot_4/30, pca4(plot_frames_4,z),45,'filled','Color','#4DBEEE')
scatter(fnum_plot_5/30, pca5(plot_frames_5,z),45,'filled','Color','#A2142F')
scatter(fnum_plot_6/30,pca6(plot_frames_6,z),45,'filled','Color','#0072BD')
scatter(fnum_plot_7/30,pca7(plot_frames_7,z),45,'filled','Color','#D95319')
scatter(fnum_plot_8/30,pca8(plot_frames_8,z),45,'filled','Color','#EDB120')
scatter(fnum_plot_9/30,pca9(plot_frames_9,z),45,'filled','Color','#7E2F8E')
scatter(fnum_plot_10/30,pca10(plot_frames_10,z),45,'filled','Color','#77AC30')

title('Z pos')
legend('rawData',strcat('5Hz LPF - Error = ',string(mean(e_lpf))), strcat(string(pcs(1)),'PCs - Error = ',string(mean(e4))),strcat(string(pcs(2)),'PCs - Error = ', string(mean(e5))),strcat(string(pcs(3)),'PCs - Error = ', string(mean(e6))),strcat(string(pcs(4)),'PCs - Error = ',string(mean(e7))),strcat(string(pcs(5)),'PCs - Error = ',string(mean(e8))), strcat(string(pcs(6)),'PCs - Error = ', string(mean(e9))), strcat(string(pcs(7)),'PCs - Error = ', string(mean(e10))))
xlabel('sec')
ylabel('mm')


sgtitle(supertitle)

saveas(f,strcat('/Users/ercrg/LimbLab/analysis/12_2/als/',joint_interested,' - SVD PC comparison.png'))