function link_length = link_lengths(data)

data_coords = table2array(data);
fnum = data_coords(:,end);
data_coords(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105]) = [];
data(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105]) = [];

coords_dropped = sum(isnan(data_coords), 2);
coords_dropped(coords_dropped >= 9) = [];

percent_under3_dropped = length(coords_dropped) / size(data_coords, 1) * 100;

%% Get link lengths by frames
links = {'Wrist-CMC', 'CMC-MCP', 'MCP-IP', 'IP-Tip', 'Wrist-MCP1', 'MCP1-PIP1', 'PIP1-DIP1', 'DIP1-Tip1', 'Wrist-MCP2', 'MCP2-PIP2', 'PIP2-DIP2', 'DIP2-Tip2', 'Wrist-MCP3', 'MCP3-PIP3', 'PIP3-DIP3', 'DIP3-Tip3', 'Wrist-MCP4', 'MCP4-PIP4', 'PIP4-DIP4', 'DIP4-Tip4'};
link_length= table();

for frame = 1:size(data_coords,1)
    link_length{frame,1} = sqrt((data_coords(frame,4) - data_coords(frame,1))^2 + (data_coords(frame,5) - data_coords(frame,2))^2 + (data_coords(frame,6) - data_coords(frame,3))^2); %Wrist-CMC
    link_length{frame,2} = sqrt((data_coords(frame,7) - data_coords(frame,4))^2 + (data_coords(frame,8) - data_coords(frame,5))^2 + (data_coords(frame,9) - data_coords(frame,6))^2); %CMC-MCP
    link_length{frame,3} = sqrt((data_coords(frame,22) - data_coords(frame,7))^2 + (data_coords(frame,23) - data_coords(frame,8))^2 + (data_coords(frame,24) - data_coords(frame,9))^2); %MCP-IP
    link_length{frame,4} = sqrt((data_coords(frame,49) - data_coords(frame,22))^2 + (data_coords(frame,50) - data_coords(frame,23))^2 + (data_coords(frame,51) - data_coords(frame,24))^2); %IP-Tip

    link_length{frame,5} = sqrt((data_coords(frame,10) - data_coords(frame,1))^2 + (data_coords(frame,11) - data_coords(frame,2))^2 + (data_coords(frame,12) - data_coords(frame,3))^2); %Wrist-MCP1
    link_length{frame,6} = sqrt((data_coords(frame,25) - data_coords(frame,10))^2 + (data_coords(frame,26) - data_coords(frame,11))^2 + (data_coords(frame,27) - data_coords(frame,12))^2); %MCP1-PIP1
    link_length{frame,7} = sqrt((data_coords(frame,37) - data_coords(frame,25))^2 + (data_coords(frame,38) - data_coords(frame,26))^2 + (data_coords(frame,39) - data_coords(frame,27))^2); %PIP1-DIP1
    link_length{frame,8} = sqrt((data_coords(frame,52) - data_coords(frame,37))^2 + (data_coords(frame,53) - data_coords(frame,38))^2 + (data_coords(frame,54) - data_coords(frame,39))^2); %DIP1-Tip1

    link_length{frame,9} = sqrt((data_coords(frame,13) - data_coords(frame,1))^2 + (data_coords(frame,14) - data_coords(frame,2))^2 + (data_coords(frame,15) - data_coords(frame,3))^2); %Wrist-MCP2
    link_length{frame,10} = sqrt((data_coords(frame,28) - data_coords(frame,13))^2 + (data_coords(frame,29) - data_coords(frame,14))^2 + (data_coords(frame,30) - data_coords(frame,15))^2); %MCP2-PIP2
    link_length{frame,11} = sqrt((data_coords(frame,40) - data_coords(frame,28))^2 + (data_coords(frame,41) - data_coords(frame,29))^2 + (data_coords(frame,42) - data_coords(frame,30))^2); %PIP2-DIP2
    link_length{frame,12} = sqrt((data_coords(frame,55) - data_coords(frame,40))^2 + (data_coords(frame,56) - data_coords(frame,41))^2 + (data_coords(frame,57) - data_coords(frame,42))^2); %DIP2-Tip2

    link_length{frame,13} = sqrt((data_coords(frame,16) - data_coords(frame,1))^2 + (data_coords(frame,17) - data_coords(frame,2))^2 + (data_coords(frame,18) - data_coords(frame,3))^2); %Wrist-MCP3
    link_length{frame,14} = sqrt((data_coords(frame,31) - data_coords(frame,16))^2 + (data_coords(frame,32) - data_coords(frame,17))^2 + (data_coords(frame,33) - data_coords(frame,18))^2); %MCP3-PIP3
    link_length{frame,15} = sqrt((data_coords(frame,43) - data_coords(frame,31))^2 + (data_coords(frame,44) - data_coords(frame,32))^2 + (data_coords(frame,45) - data_coords(frame,33))^2); %PIP3-DIP3
    link_length{frame,16} = sqrt((data_coords(frame,58) - data_coords(frame,43))^2 + (data_coords(frame,59) - data_coords(frame,44))^2 + (data_coords(frame,60) - data_coords(frame,45))^2); %DIP3-Tip3

    link_length{frame,17} = sqrt((data_coords(frame,19) - data_coords(frame,1))^2 + (data_coords(frame,20) - data_coords(frame,2))^2 + (data_coords(frame,21) - data_coords(frame,3))^2); %Wrist-MCP4
    link_length{frame,18} = sqrt((data_coords(frame,34) - data_coords(frame,19))^2 + (data_coords(frame,35) - data_coords(frame,20))^2 + (data_coords(frame,36) - data_coords(frame,21))^2); %MCP4-PIP4
    link_length{frame,19} = sqrt((data_coords(frame,46) - data_coords(frame,34))^2 + (data_coords(frame,47) - data_coords(frame,35))^2 + (data_coords(frame,48) - data_coords(frame,36))^2); %PIP4-DIP4
    link_length{frame,20} = sqrt((data_coords(frame,61) - data_coords(frame,46))^2 + (data_coords(frame,62) - data_coords(frame,47))^2 + (data_coords(frame,63) - data_coords(frame,48))^2); %DIP4-Tip4
end

link_length.Properties.VariableNames = links;

 %% Plots and measured lengths
figure; hold on; plot(link_length.(1)); yline(23.26, 'LineWidth',1); yline(23.26*1.15, '--','LineWidth',1), yline(23.26*0.85, '--', 'LineWidth',1); title(string(links(1))); 
figure; hold on; plot(link_length.(2)); yline(22.56, 'LineWidth',1); yline(22.56*1.15, '--','LineWidth',1), yline(22.56*0.85, '--', 'LineWidth',1); title(string(links(2))); 
figure; hold on; plot(link_length.(3)); yline(17.72, 'LineWidth',1); yline(17.72*1.15, '--','LineWidth',1), yline(17.72*0.85, '--', 'LineWidth',1); title(string(links(3))); 
figure; hold on; plot(link_length.(4)); yline(10.53, 'LineWidth',1); yline(10.53*1.15, '--','LineWidth',1), yline(10.53*0.85, '--', 'LineWidth',1); title(string(links(4))); 
figure; hold on; plot(link_length.(5)); yline(35.63, 'LineWidth',1); yline(35.63*1.15, '--','LineWidth',1), yline(35.63*0.85, '--', 'LineWidth',1); title(string(links(5))); 
figure; hold on; plot(link_length.(6)); yline(25.19, 'LineWidth',1); yline(25.19*1.15, '--','LineWidth',1), yline(25.19*0.85, '--', 'LineWidth',1); title(string(links(6))); 
figure; hold on; plot(link_length.(7)); yline(13.58, 'LineWidth',1); yline(13.58*1.15, '--','LineWidth',1), yline(13.58*0.85, '--', 'LineWidth',1); title(string(links(7))); 
figure; hold on; plot(link_length.(8)); yline(11.55, 'LineWidth',1); yline(11.55*1.15, '--','LineWidth',1), yline(11.55*0.85, '--', 'LineWidth',1); title(string(links(8))); 
figure; hold on; plot(link_length.(9)); yline(35.35, 'LineWidth',1); yline(35.35*1.15, '--','LineWidth',1), yline(35.35*0.85, '--', 'LineWidth',1); title(string(links(9))); 
figure; hold on; plot(link_length.(10)); yline(30.00, 'LineWidth',1); yline(30.00*1.15, '--','LineWidth',1), yline(30.00*0.85, '--', 'LineWidth',1); title(string(links(10))); 
figure; hold on; plot(link_length.(11)); yline(18.19, 'LineWidth',1); yline(18.19*1.15, '--','LineWidth',1), yline(18.19*0.85, '--', 'LineWidth',1); title(string(links(11))); 
figure; hold on; plot(link_length.(12)); yline(12.98, 'LineWidth',1); yline(12.98*1.15, '--','LineWidth',1), yline(12.98*0.85, '--', 'LineWidth',1); title(string(links(12))); 
figure; hold on; plot(link_length.(13)); yline(36.32, 'LineWidth',1); yline(36.32*1.15, '--','LineWidth',1), yline(36.32*0.85, '--', 'LineWidth',1); title(string(links(13))); 
figure; hold on; plot(link_length.(14)); yline(28.53, 'LineWidth',1); yline(28.53*1.15, '--','LineWidth',1), yline(28.53*0.85, '--', 'LineWidth',1); title(string(links(14))); 
figure; hold on; plot(link_length.(15)); yline(20.16, 'LineWidth',1); yline(20.16*1.15, '--','LineWidth',1), yline(20.16*0.85, '--', 'LineWidth',1); title(string(links(15))); 
figure; hold on; plot(link_length.(16)); yline(14.15, 'LineWidth',1); yline(14.15*1.15, '--','LineWidth',1), yline(14.15*0.85, '--', 'LineWidth',1); title(string(links(16))); 
figure; hold on; plot(link_length.(17)); yline(36.89, 'LineWidth',1); yline(36.89*1.15, '--','LineWidth',1), yline(36.89*0.85, '--', 'LineWidth',1); title(string(links(17))); 
figure; hold on; plot(link_length.(18)); yline(24.44, 'LineWidth',1); yline(24.44*1.15, '--','LineWidth',1), yline(24.44*0.85, '--', 'LineWidth',1); title(string(links(18))); 
figure; hold on; plot(link_length.(19)); yline(14.78, 'LineWidth',1); yline(14.78*1.15, '--','LineWidth',1), yline(14.78*0.85, '--', 'LineWidth',1); title(string(links(19))); 
figure; hold on; plot(link_length.(20)); yline(10.57, 'LineWidth',1); yline(10.57*1.15, '--','LineWidth',1), yline(10.57*0.85, '--', 'LineWidth',1); title(string(links(20))); 
