function plot_pos_vel_psd(pos_data, vel_data, pos_data_ppca, vel_data_ppca, pos_data_pca, vel_data_pca, pos_data_lowpass, vel_data_lowpass, f)

num_pcs = 3;
filter_corner = 8;
joint = 'PIP Index';

%% Plot

metric = 'velocity';
supertitle = 'PSD Welch-PIP Index-Velocity';
figure
hold on

subplot(3,1,1)
hold on
plot(f,vel_data(:,25),'k')
plot(f,vel_data_ppca(:,25),'c')
plot(f,vel_data_pca(:,25),'b')
plot(f,vel_data_lowpass(:,25),'r')
legend('rawData', 'PPCA-3PCs', 'PCA-3PCs','8Hz LPF')
title('X vel')
xlabel('Hz')
ylabel('power/frequency')
xlim([0 10])

subplot(3,1,2)
hold on
plot(f,vel_data(:,26),'k')
plot(f,vel_data_ppca(:,26),'m')
plot(f,vel_data_pca(:,26),'b')
plot(f,vel_data_lowpass(:,26),'r')
legend('rawData', 'PPCA-3PCs', 'PCA-3PCs','8Hz LPF')
title('Y vel')
xlabel('Hz')
ylabel('power/frequency')
xlim([0 10])

subplot(3,1,3)
hold on
plot(f,vel_data(:,27),'k')
plot(f,vel_data_ppca(:,27),'g')
plot(f,vel_data_pca(:,27),'b')
plot(f,vel_data_lowpass(:,27),'r')
legend('rawData', 'PPCA-3PCs', 'PCA-3PCs','8Hz LPF')
title('Z vel')
xlabel('Hz')
ylabel('power/frequency')
xlim([0 10])

sgtitle(supertitle)

hold off
%% Pos
metric = 'position';
supertitle = 'PSD Welch-PIP Index-Position';

figure
hold on

subplot(3,1,1)
hold on
plot(f,pos_data(:,25),'k')
plot(f,pos_data_ppca(:,25),'c')
plot(f,pos_data_pca(:,25),'b')
plot(f,pos_data_lowpass(:,25),'r')
legend('rawData', 'PPCA-3PCs', 'PCA-3PCs','8Hz LPF')
title('X pos')
xlabel('Hz')
ylabel('power/frequency')
xlim([0 5])

subplot(3,1,2)
hold on
plot(f,pos_data(:,26),'k')
plot(f,pos_data_ppca(:,26),'m')
plot(f,pos_data_pca(:,26),'b')
plot(f,pos_data_lowpass(:,26),'r')
legend('rawData', 'PPCA-3PCs', 'PCA-3PCs','8Hz LPF')
title('Y pos')
xlabel('Hz')
ylabel('power/frequency')
xlim([0 5])

subplot(3,1,3)
hold on
plot(f,pos_data(:,27),'k')
plot(f,pos_data_ppca(:,27),'g')
plot(f,pos_data_pca(:,27),'b')
plot(f,pos_data_lowpass(:,27),'r')
legend('rawData', 'PPCA-3PCs', 'PCA-3PCs','8Hz LPF')
title('Z pos')
xlabel('Hz')
ylabel('power/frequency')
xlim([0 5])

sgtitle(supertitle)
hold off