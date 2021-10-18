function plot_pos_vel_ppca(data,ppca,vel_data,vel_ppca)

% need to run velocity beforehand so it can be independently subjected to PPCA

%% Setup
t = [0:0.0333333:20];

joint = 'Wrist';
pos_pcs=7;
vel_pcs=30;
supertitle = strcat('PPCA - ',joint);%,' - ',string(num_pcs),' PCs');

%% Plot

% velocity
figure
hold on

subplot(3,2,1)
hold on
plot(t,vel_data(5400:6000,1),'k')
plot(t,vel_ppca(5400:6000,1),'c')
title('X vel')
legend('prePPCA','postPPCA')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,3)
hold on
plot(t,vel_data(5400:6000,2),'k')
plot(t,vel_ppca(5400:6000,2),'m')
title('Y vel')
legend('prePPCA','postPPCA')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,5)
hold on
plot(t,vel_data(5400:6000,3),'k')
plot(t,vel_ppca(5400:6000,3),'g')
title('Z vel')
legend('prePPCA','postPPCA')
ylabel('mm/sec')
xlabel('sec')

%position
subplot(3,2,2)
hold on
plot(t,data(5400:6000,1),'k')
plot(t,ppca(5400:6000,1),'c')
title('X pos')
legend('prePPCA','postPPCA')
xlabel('sec')

subplot(3,2,4)
hold on
plot(t,data(5400:6000,2),'k')
plot(t,ppca(5400:6000,2),'m')
title('Y pos')
legend('prePPCA','postPPCA')
xlabel('sec')

subplot(3,2,6)
hold on
plot(t,data(5400:6000,3),'k')
plot(t,ppca(5400:6000,3),'g')
title('Z pos')
legend('prePPCA','postPPCA')
xlabel('sec')

sgtitle(supertitle)