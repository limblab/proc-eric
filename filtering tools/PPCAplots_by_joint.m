% all joints based on 106 cols now...please fix

t = [0:0.0333333:20];

%% MCP Thumb
figure
hold on

subplot(3,3,1)
hold on
plot(speed_lpf(5400:6000,11),'k')
plot(speed_ppca(5400:6000,11),'c')
title('MCP Thumb X vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,2)
hold on
plot(output3ddatalpf(5400:6000,11),'k')
plot(output3ddatalpfppca(5400:6000,11),'c')
title('MCP Thumb X pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,3)
hold on
plot(periodogram(speed_ppca(:,11)),'c')
plot(periodogram(speed_lpf_no_nans(:,11)),'k')
title('MCP Thumb X SPD')
legend('postPPCA','prePPCA')

subplot(3,3,4)
hold on
plot(speed_lpf(5400:6000,12),'k')
plot(speed_ppca(5400:6000,12),'m')
title('MCP Thumb Y vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,5)
hold on
plot(output3ddatalpf(5400:6000,12),'k')
plot(output3ddatalpfppca(5400:6000,12),'m')
title('MCP Thumb Y pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,6)
hold on
plot(periodogram(speed_ppca(:,12)),'m')
plot(periodogram(speed_lpf_no_nans(:,12)),'k')
title('MCP Thumb Y SPD')
legend('postPPCA','prePPCA')

subplot(3,3,7)
hold on
plot(speed_lpf(5400:6000,13),'k')
plot(speed_ppca(5400:6000,13),'g')
title('MCP Thumb Z vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,8)
hold on
plot(output3ddatalpf(5400:6000,13),'k')
plot(output3ddatalpfppca(5400:6000,13),'g')
title('MCP Thumb Z pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,9)
hold on
plot(periodogram(speed_ppca(:,13)),'g')
plot(periodogram(speed_lpf_no_nans(:,13)),'k')
title('MCP Thumb Z SPD')
legend('postPPCA','prePPCA')

%% MCP Middle

figure
hold on

subplot(3,3,1)
hold on
plot(speed_lpf(5400:6000,21),'k')
plot(speed_ppca(5400:6000,21),'c')
title('MCP Middle X vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,2)
hold on
plot(output3ddatalpf(5400:6000,21),'k')
plot(output3ddatalpfppca(5400:6000,21),'c')
title('MCP Middle X pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,3)
hold on
plot(periodogram(speed_ppca(:,21)),'c')
plot(periodogram(speed_lpf_no_nans(:,21)),'k')
title('MCP Middle X SPD')
legend('postPPCA','prePPCA')

subplot(3,3,4)
hold on
plot(speed_lpf(5400:6000,22),'k')
plot(speed_ppca(5400:6000,22),'m')
title('MCP Middle Y vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,5)
hold on
plot(output3ddatalpf(5400:6000,22),'k')
plot(output3ddatalpfppca(5400:6000,22),'m')
title('MCP Middle Y pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,6)
hold on
plot(periodogram(speed_ppca(:,22)),'m')
plot(periodogram(speed_lpf_no_nans(:,22)),'k')
title('MCP Middle Y SPD')
legend('postPPCA','prePPCA')

subplot(3,3,7)
hold on
plot(speed_lpf(5400:6000,23),'k')
plot(speed_ppca(5400:6000,23),'g')
title('MCP Middle Z vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,8)
hold on
plot(output3ddatalpf(5400:6000,23),'k')
plot(output3ddatalpfppca(5400:6000,23),'g')
title('MCP Middle Z pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,9)
hold on
plot(periodogram(speed_ppca(:,23)),'g')
plot(periodogram(speed_lpf_no_nans(:,23)),'k')
title('MCP Middle Z SPD')
legend('postPPCA','prePPCA')

%% PIP Index

figure
hold on

subplot(3,3,1)
hold on
plot(t,speed_lpf(5400:6000,41),'k')
plot(t,speed_ppca(5400:6000,41),'c')
title('PIP Index X vel')
legend('prePPCA','postPPCA')
ylabel('mm?/sec')

subplot(3,3,2)
hold on
plot(t,output3ddatalpf(5400:6000,41),'k')
plot(t,output3ddatalpfppca(5400:6000,41),'c')
title('PIP Index X pos')
legend('prePPCA','postPPCA')
%ylabel('pixels')

subplot(3,3,3)
hold on
[pxxxlpf,fxlpf]=pwelch(speed_lpf_no_nans(5400:5499,41),30);
[pxxxppca,fxppca]=pwelch(speed_ppca(5400:5499,41),30);
plot(fxlpf,pxxxlpf,'k')
plot(fxppca,pxxxppca,'c')
title('PIP Index X PSD')
legend('prePPCA','postPPCA')

subplot(3,3,4)
hold on
plot(t,speed_lpf(5400:6000,42),'k')
plot(t,speed_ppca(5400:6000,42),'m')
title('PIP Index Y vel')
legend('prePPCA','postPPCA')
ylabel('mm?/sec')

subplot(3,3,5)
hold on
plot(t,output3ddatalpf(5400:6000,42),'k')
plot(t,output3ddatalpfppca(5400:6000,42),'m')
title('PIP Index Y pos')
legend('prePPCA','postPPCA')
%ylabel('pixels')

subplot(3,3,6)
hold on
[pxxylpf,fylpf]=pwelch(speed_lpf_no_nans(5400:5499,41),30);
[pxxyppca,fyppca]=pwelch(speed_ppca(5400:5499,41),30);
plot(fylpf,pxxylpf,'k')
plot(fyppca,pxxyppca,'c')
title('PIP Index Y PSD')
legend('prePPCA','postPPCA')

subplot(3,3,7)
hold on
plot(t,speed_lpf(5400:6000,43),'k')
plot(t,speed_ppca(5400:6000,43),'g')
title('PIP Index Z vel')
legend('prePPCA','postPPCA')
ylabel('mm?/sec')

subplot(3,3,8)
hold on
plot(t,output3ddatalpf(5400:6000,43),'k')
plot(t,output3ddatalpfppca(5400:6000,43),'g')
title('PIP Index Z pos')
legend('prePPCA','postPPCA')
%ylabel('pixels')

subplot(3,3,9)
hold on
[pxxzlpf,fzlpf]=pwelch(speed_lpf_no_nans(5400:5499,41),30);
[pxxzppca,fzppca]=pwelch(speed_ppca(5400:5499,41),30);
plot(fzlpf,pxxzlpf,'k')
plot(fzppca,pxxzppca,'c')
title('PIP Index Z PSD')
legend('prePPCA','postPPCA')


%% Tip Thumb
figure
hold on

subplot(3,3,1)
hold on
plot(speed_lpf(5400:6000,81),'k')
plot(speed_ppca(5400:6000,81),'c')
title('Tip Thumb X vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,2)
hold on
plot(output3ddatalpf(5400:6000,81),'k')
plot(output3ddatalpfppca(5400:6000,81),'c')
title('Tip Thumb X pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,3)
hold on
plot(periodogram(speed_ppca(:,81)),'c')
plot(periodogram(speed_lpf_no_nans(:,81)),'k')
title('Tip Thumb X SPD')
legend('postPPCA','prePPCA')

subplot(3,3,4)
hold on
plot(speed_lpf(5400:6000,82),'k')
plot(speed_ppca(5400:6000,82),'m')
title('Tip Thumb Y vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,5)
hold on
plot(output3ddatalpf(5400:6000,82),'k')
plot(output3ddatalpfppca(5400:6000,82),'m')
title('Tip Thumb Y pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,6)
hold on
plot(periodogram(speed_ppca(:,82)),'m')
plot(periodogram(speed_lpf_no_nans(:,82)),'k')
title('Tip Thumb Y SPD')
legend('postPPCA','prePPCA')

subplot(3,3,7)
hold on
plot(speed_lpf(5400:6000,83),'k')
plot(speed_ppca(5400:6000,83),'g')
title('Tip Thumb Z vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,8)
hold on
plot(output3ddatalpf(5400:6000,83),'k')
plot(output3ddatalpfppca(5400:6000,83),'g')
title('Tip Thumb Z pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,9)
hold on
plot(periodogram(speed_ppca(:,83)),'g')
plot(periodogram(speed_lpf_no_nans(:,83)),'k')
title('Tip Thumb Z SPD')
legend('postPPCA','prePPCA')


%% Tip Index
figure
hold on

subplot(3,3,1)
hold on
plot(speed_lpf(5400:6000,86),'k')
plot(speed_ppca(5400:6000,86),'c')
title('Tip Index X vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,2)
hold on
plot(output3ddatalpf(5400:6000,86),'k')
plot(output3ddatalpfppca(5400:6000,86),'c')
title('Tip Index X pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,3)
hold on
plot(periodogram(speed_ppca(:,86)),'c')
plot(periodogram(speed_lpf_no_nans(:,86)),'k')
title('Tip Index X SPD')
legend('postPPCA','prePPCA')

subplot(3,3,4)
hold on
plot(speed_lpf(5400:6000,87),'k')
plot(speed_ppca(5400:6000,87),'m')
title('Tip Index Y vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,5)
hold on
plot(output3ddatalpf(5400:6000,87),'k')
plot(output3ddatalpfppca(5400:6000,87),'m')
title('Tip Index Y pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,6)
hold on
plot(periodogram(speed_ppca(:,87)),'m')
plot(periodogram(speed_lpf_no_nans(:,87)),'k')
title('Tip Index Y SPD')
legend('postPPCA','prePPCA')

subplot(3,3,7)
hold on
plot(speed_lpf(5400:6000,88),'k')
plot(speed_ppca(5400:6000,88),'g')
title('Tip Index Z vel')
legend('prePPCA','postPPCA')
ylabel('pixels/sec')

subplot(3,3,8)
hold on
plot(output3ddatalpf(5400:6000,88),'k')
plot(output3ddatalpfppca(5400:6000,88),'g')
title('Tip Index Z pos')
legend('prePPCA','postPPCA')
ylabel('pixels')

subplot(3,3,9)
hold on
plot(periodogram(speed_ppca(:,88)),'g')
plot(periodogram(speed_lpf_no_nans(:,88)),'k')
title('Tip Index Z SPD')
legend('postPPCA','prePPCA')