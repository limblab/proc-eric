function plot_speeds(data)
%% Setup
clean = clean_position(data);
no_MCPs = remove_MCPs_down(clean);

speed = get_speed_from_pos(clean);
speed_no_MCPs = get_speed_from_pos(no_MCPs);
clean_speed_no_MCPs = clean_NaN_speeds(data,speed_no_MCPs);

frame_rate = 30;
vid_length = height(clean) / frame_rate;
joints = {'Tip1', 'Tip2', 'Tip3', 'Tip4'};
threshold = 1200;
%joints = {'Wrist', 'CMC thumb', 'MCP thumb', 'MCP1', 'MCP2', 'MCP3', 'MCP4','IP thumb', 'PIP1', 'PIP2', 'PIP3', 'PIP4', 'Dip1', 'Dip2', 'Dip3', 'Dip4','Tip thumb', 'Tip1', 'Tip2', 'Tip3', 'Tip4'};

t_full = [0.0333333:0.0333333:vid_length-0.0333333];
t_chunk = [455:0.0333333:465];

screen = get(groot,'ScreenSize');
%% Plot
for joint = 1:width(joints)
    speed_fig = figure;
    speed_fig.Position = [0,screen(4)/2,screen(3),screen(4)/2];
    hold on
    
    %full vids
    subplot(2,2,1)
    plot(t_full,speed(:,joint))
    thresh = yline(threshold,'r');
    legend(thresh,'current threshold')
    title('Speed from raw data - full video')
    xlabel('sec')
    ylabel('mm/sec')
    
    subplot(2,2,2)
    plot(t_full,clean_speed_no_MCPs(:,joint))
    thresh = yline(threshold,'r');
    legend(thresh,'current threshold')
    title('Speed COG and post-NaN stretches removed - full video')
    xlabel('sec')
    ylabel('mm/sec')
    
    %10 sec
    subplot(2,2,3)
    plot(t_chunk,speed(21600:21900,joint))
    thresh = yline(threshold,'r');
    legend(thresh,'current threshold')
    title('Speed from raw data - 10 sec')
    xlabel('sec')
    ylabel('mm/sec')
    
    subplot(2,2,4)
    plot(t_chunk,clean_speed_no_MCPs(21600:21900,joint))
    thresh = yline(threshold,'r');
    legend(thresh,'current threshold')
    title('Speed COG and post-NaN stretches removed - 10 sec')
    xlabel('sec')
    ylabel('mm/sec')
    
    sgtitle(strcat('Speed comparison - ',joints(joint)))
    
    saveas(speed_fig,strcat('/Users/ercrg/LimbLab/analysis/10_21/speeds/',string(joints(joint)),'.png'))
end