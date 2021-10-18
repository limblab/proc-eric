function plotPPCAresults(pos_data,pos_ppca,vel_data,vel_ppca)

t = [0:0.0333333:20];

date='20210814';
pos_pcs=7;
vel_pcs=30;

%% Wrist

supertitle = strcat('PPCA - Wrist - ', date);

    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,pos_data(5400:6000,1),'k')
    plot(t,pos_ppca(5400:6000,1),'c')
    title('X pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,pos_data(5400:6000,2),'k')
    plot(t,pos_ppca(5400:6000,2),'m')
    title('Y pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,5)
    hold on
    plot(t,pos_data(5400:6000,3),'k')
    plot(t,pos_ppca(5400:6000,3),'g')
    title('Z pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,2)
    hold on
    plot(t,vel_data(5400:6000,1),'k')
    plot(t,vel_ppca(5400:6000,1),'c')
    title('X vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,vel_data(5400:6000,2),'k')
    plot(t,vel_ppca(5400:6000,2),'m')
    title('Y vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,vel_data(5400:6000,3),'k')
    plot(t,vel_ppca(5400:6000,3),'g')
    title('Z vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    sgtitle(supertitle)
    
%% MCP Thumb

supertitle = strcat('PPCA - MCP Thumb - ', date);

    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,pos_data(5400:6000,7),'k')
    plot(t,pos_ppca(5400:6000,7),'c')
    title('X pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,pos_data(5400:6000,8),'k')
    plot(t,pos_ppca(5400:6000,8),'m')
    title('Y pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')


    subplot(3,2,5)
    hold on
    plot(t,pos_data(5400:6000,9),'k')
    plot(t,pos_ppca(5400:6000,9),'g')
    title('Z pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,2)
    hold on
    plot(t,vel_data(5400:6000,7),'k')
    plot(t,vel_ppca(5400:6000,7),'c')
    title('X vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,vel_data(5400:6000,8),'k')
    plot(t,vel_ppca(5400:6000,8),'m')
    title('Y vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,vel_data(5400:6000,9),'k')
    plot(t,vel_ppca(5400:6000,9),'g')
    title('Z vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')
    
sgtitle(supertitle)
%% MCP Middle

supertitle = strcat('PPCA - MCP Middle - ', date);
    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,pos_data(5400:6000,13),'k')
    plot(t,pos_ppca(5400:6000,13),'c')
    title('X pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,pos_data(5400:6000,14),'k')
    plot(t,pos_ppca(5400:6000,14),'m')
    title('Y pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,5)
    hold on
    plot(t,pos_data(5400:6000,15),'k')
    plot(t,pos_ppca(5400:6000,15),'g')
    title('Z pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,2)
    hold on
    plot(t,vel_data(5400:6000,13),'k')
    plot(t,vel_ppca(5400:6000,13),'c')
    title('X vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,vel_data(5400:6000,14),'k')
    plot(t,vel_ppca(5400:6000,14),'m')
    title('Y vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,vel_data(5400:6000,15),'k')
    plot(t,vel_ppca(5400:6000,15),'g')
    title('Z vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    sgtitle(supertitle)
    
%% PIP Index

supertitle = strcat('PPCA - PIP Index - ', date);

    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,pos_data(5400:6000,25),'k')
    plot(t,pos_ppca(5400:6000,25),'c')
    title('X pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,pos_data(5400:6000,26),'k')
    plot(t,pos_ppca(5400:6000,26),'m')
    title('Y pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,5)
    hold on
    plot(t,pos_data(5400:6000,27),'k')
    plot(t,pos_ppca(5400:6000,27),'g')
    title('Z pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,2)
    hold on
    plot(t,vel_data(5400:6000,25),'k')
    plot(t,vel_ppca(5400:6000,25),'c')
    title('X vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')
    
    subplot(3,2,4)
    hold on
    plot(t,vel_data(5400:6000,26),'k')
    plot(t,vel_ppca(5400:6000,26),'m')
    title('Y vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('mm/sec')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,vel_data(5400:6000,27),'k')
    plot(t,vel_ppca(5400:6000,27),'g')
    title('Z vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('mm/sec')
    xlabel('sec')

    sgtitle(supertitle)
    
%% Tip Thumb

supertitle = strcat('PPCA - Tip Thumb - ', date);

    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,pos_data(5400:6000,49),'k')
    plot(t,pos_ppca(5400:6000,7),'c')
    title('X pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,pos_data(5400:6000,50),'k')
    plot(t,pos_ppca(5400:6000,50),'m')
    title('Y pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,5)
    hold on
    plot(t,pos_data(5400:6000,51),'k')
    plot(t,pos_ppca(5400:6000,51),'g')
    title('Z pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,2)
    hold on
    plot(t,vel_data(5400:6000,49),'k')
    plot(t,vel_ppca(5400:6000,49),'c')
    title('X vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,vel_data(5400:6000,50),'k')
    plot(t,vel_ppca(5400:6000,50),'m')
    title('Y vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,vel_data(5400:6000,51),'k')
    plot(t,vel_ppca(5400:6000,51),'g')
    title('Z vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    sgtitle(supertitle)
    
%% Tip Index

supertitle = strcat('PPCA - Tip Index - ', date);

    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,pos_data(5400:6000,52),'k')
    plot(t,pos_ppca(5400:6000,52),'c')
    title('X pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,pos_data(5400:6000,53),'k')
    plot(t,pos_ppca(5400:6000,53),'m')
    title('Y pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,5)
    hold on
    plot(t,pos_data(5400:6000,54),'k')
    plot(t,pos_ppca(5400:6000,54),'g')
    title('Z pos')
    legend('prePPCA',strcat('PPCA',string(pos_pcs)))
    ylabel('pixels')
    xlabel('sec')

    subplot(3,2,2)
    hold on
    plot(t,vel_data(5400:6000,52),'k')
    plot(t,vel_ppca(5400:6000,52),'c')
    title('X vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,vel_data(5400:6000,53),'k')
    plot(t,vel_ppca(5400:6000,53),'m')
    title('Y vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,vel_data(5400:6000,54),'k')
    plot(t,vel_ppca(5400:6000,54),'g')
    title('Z vel')
    legend('prePPCA',strcat('PPCA',string(vel_pcs)))
    ylabel('pixels/sec')
    xlabel('sec')

    sgtitle(supertitle)
%% Some PSDs?
%{
% MCP Thumb
figure
hold on

subplot(3,1,1)
hold on
plot(periodogram(vel_ppca(:,7)),'c')
plot(periodogram(vel_data_no_nans(:,7)),'k')
title('MCP Thumb X SPD')
legend('postPPCA','prePPCA')

subplot(3,1,2)
hold on
plot(periodogram(vel_ppca(:,8)),'m')
plot(periodogram(vel_data_no_nans(:,8)),'k')
title('MCP Thumb Y SPD')
legend('postPPCA','prePPCA')

subplot(3,1,3)
hold on
plot(periodogram(vel_ppca(:,9)),'g')
plot(periodogram(vel_data_no_nans(:,9)),'k')
title('MCP Thumb Z SPD')
legend('postPPCA','prePPCA')

% MCP Middle
figure
hold on

subplot(3,1,1)
hold on
plot(periodogram(vel_ppca(:,13)),'c')
plot(periodogram(vel_data_no_nans(:,13)),'k')
title('MCP Middle X SPD')
legend('postPPCA','prePPCA')

subplot(3,1,2)
hold on
plot(periodogram(vel_ppca(:,14)),'m')
plot(periodogram(vel_data_no_nans(:,14)),'k')
title('MCP Middle Y SPD')
legend('postPPCA','prePPCA')

subplot(3,1,3)
hold on
plot(periodogram(vel_ppca(:,15)),'g')
plot(periodogram(vel_data_no_nans(:,15)),'k')
title('MCP Middle Z SPD')
legend('postPPCA','prePPCA')

% PIP Index
figure
hold on

subplot(3,1,1)
hold on
plot(periodogram(vel_ppca(:,25)),'c')
plot(periodogram(vel_data_no_nans(:,25)),'k')
title('PIP Index X SPD')
legend('postPPCA','prePPCA')

subplot(3,1,2)
hold on
plot(periodogram(vel_ppca(:,26)),'m')
plot(periodogram(vel_data_no_nans(:,26)),'k')
title('PIP Index Y SPD')
legend('postPPCA','prePPCA')

subplot(3,1,3)
hold on
plot(periodogram(vel_ppca(:,27)),'g')
plot(periodogram(vel_data_no_nans(:,27)),'k')
title('PIP Index Z SPD')
legend('postPPCA','prePPCA')

% Tip Thumb
figure
hold on

subplot(3,1,1)
hold on
plot(periodogram(vel_ppca(:,49)),'c')
plot(periodogram(vel_data_no_nans(:,49)),'k')
title('Tip Thumb X SPD')
legend('postPPCA','prePPCA')

subplot(3,1,2)
hold on
plot(periodogram(vel_ppca(:,50)),'m')
plot(periodogram(vel_data_no_nans(:,50)),'k')
title('Tip Thumb Y SPD')
legend('postPPCA','prePPCA')

subplot(3,1,3)
hold on
plot(periodogram(vel_ppca(:,51)),'g')
plot(periodogram(vel_data_no_nans(:,51)),'k')
title('Tip Thumb Z SPD')
legend('postPPCA','prePPCA')

% Tip Index
figure
hold on

subplot(3,1,1)
hold on
plot(periodogram(vel_ppca(:,52)),'c')
plot(periodogram(vel_data_no_nans(:,52)),'k')
title('Tip Index X SPD')
legend('postPPCA','prePPCA')

subplot(3,1,2)
hold on
plot(periodogram(vel_ppca(:,53)),'m')
plot(periodogram(vel_data_no_nans(:,53)),'k')
title('Tip Index Y SPD')
legend('postPPCA','prePPCA')

subplot(3,1,3)
hold on
plot(periodogram(vel_ppca(:,54)),'g')
plot(periodogram(vel_data_no_nans(:,54)),'k')
title('Tip Index Z SPD')
legend('postPPCA','prePPCA')
%} 