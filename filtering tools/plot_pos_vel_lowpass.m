function plot_pos_vel_lowpass(data)

%% Setup
t = [0:0.0333333:19.96666];
joint = 'MCP Thumb';
corner_freqs = [5];

%% Calculate velocity
vel_data = [];
for j = 1:width(data)
    for f = 1:height(data)-1
        vel_data(f,j) = (data(f + 1,j) - data(f,j)) * 30;
    end
end

%% Filter and plot
for freq = 1:length(corner_freqs)
    pos_lowpass = lowpass(data,corner_freqs(freq),30);
    vel_lowpass = lowpass(vel_data,corner_freqs(freq),30);

supertitle = strcat('LPF - ',joint,' - ',string(corner_freqs(freq)),' Hz');

    % velocity
    figure
    hold on

    subplot(3,2,1)
    hold on
    plot(t,vel_data(5400:5999,7),'k')
    plot(t,vel_lowpass(5400:5999,7),'c')
    title('X vel')
    legend('preLPF','postLPF')
    ylabel('mm/sec')
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,vel_data(5400:5999,8),'k')
    plot(t,vel_lowpass(5400:5999,8),'m')
    title('Y vel')
    legend('preLPF','postLPF')
    ylabel('mm/sec')
    xlabel('sec')


    subplot(3,2,5)
    hold on
    plot(t,vel_data(5400:5999,9),'k')
    plot(t,vel_lowpass(5400:5999,9),'g')
    title('Z vel')
    legend('preLPF','postLPF')
    ylabel('mm/sec')
    xlabel('sec')

    %position
    subplot(3,2,2)
    hold on
    plot(t,data(5400:5999,7),'k')
    plot(t,pos_lowpass(5400:5999,7),'c')
    title('X pos')
    legend('preLPF','postLPF')
    ylabel('mm')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,data(5400:5999,8),'k')
    plot(t,pos_lowpass(5400:5999,8),'m')
    title('Y pos')
    legend('preLPF','postLPF')
    ylabel('mm')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,data(5400:5999,9),'k')
    plot(t,pos_lowpass(5400:5999,9),'g')
    title('Z pos')
    legend('preLPF','postLPF')
    ylabel('mm')
    xlabel('sec')

    sgtitle(supertitle)
    
    hold off
    
end
