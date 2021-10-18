function plot_pos_vel(t,vel_lpf,vel_ppca,lpf,ppca)
%% ppca

% PIP Index
figure
hold on

subplot(3,2,1)
hold on
plot(t,vel_lpf(5400:5999,25),'k')
plot(t,vel_ppca(5400:5999,25),'c')
title('PIP Index X vel')
legend('prePCA','postPCA')
ylabel('mm?/sec')

subplot(3,2,3)
hold on
plot(t,vel_lpf(5400:5999,26),'k')
plot(t,vel_ppca(5400:5999,26),'m')
title('PIP Index Y vel')
legend('prePCA','postPCA')
ylabel('mm?/sec')

subplot(3,2,5)
hold on
plot(t,vel_lpf(5400:5999,27),'k')
plot(t,vel_ppca(5400:5999,27),'g')
title('PIP Index Z vel')
legend('prePCA','postPCA')
ylabel('mm?/sec')

%position
subplot(3,2,2)
hold on
plot(lpf(5400:5999,41),'k')
plot(ppca(5400:5999,41),'c')
title('PIP Index X pos')
legend('prePPCA','postPPCA')

subplot(3,2,4)
hold on
plot(lpf(5400:5999,42),'k')
plot(ppca(5400:5999,42),'m')
title('PIP Index Y pos')
legend('prePPCA','postPPCA')

subplot(3,2,6)
hold on
plot(lpf(5400:5999,43),'k')
plot(ppca(5400:5999,43),'g')
title('PIP Index Z pos')
legend('prePPCA','postPPCA')

%% low-pass

