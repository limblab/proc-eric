function plot_pca_comparison(data, pca, ppca1, ppca2, ppca3, ppca4, vel_data,vel_pca,vel_ppca1, vel_ppca2, vel_ppca3, vel_ppca4)

% need to run velocity beforehand so it can be independently subjected to PPCA

%% Setup
t = [0:0.0333333:19.96666];

joint = 'PIP Index';
num_pcs=3;
supertitle = strcat('P/PCA ',joint,' - ',string(num_pcs),' PCs');

%% Plot

% velocity
figure
hold on

subplot(2,1,1)
hold on
plot(t,vel_data(5400:5999,25),'k')
plot(t,vel_pca(5400:5999,25),'c')
plot(t,vel_ppca1(5400:5999,25),'m')
plot(t,vel_ppca2(5400:5999,25),'g')
plot(t,vel_ppca3(5400:5999,25),'b')
plot(t,vel_ppca4(5400:5999,25),'r')
title('X vel')
legend('rawData','PCA','PPCA1','PPCA2','PPCA3','PPCA4')
ylabel('mm/sec')
xlabel('sec')


%position
subplot(2,1,2)
hold on
plot(t,data(5400:5999,25),'k')
plot(t,pca(5400:5999,25),'c')
plot(t,ppca1(5400:5999,25),'m')
plot(t,ppca2(5400:5999,25),'g')
plot(t,ppca3(5400:5999,25),'b')
plot(t,ppca4(5400:5999,25),'r')
title('X pos')
legend('rawData','PCA','PPCA1','PPCA2','PPCA3','PPCA4')
xlabel('sec')
ylabel('mm')


sgtitle(supertitle)