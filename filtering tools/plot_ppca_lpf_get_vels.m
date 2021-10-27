function plot_ppca_lpf_get_vels(joint_interested, data, ppca1, ppca2, ppca3, ppca4, ppca5, ppca6)
% for integrating after PPCA

% Low-pass filters the input data at 5 Hz, calculates velocities for input
% data and 6 ppca

%% Setup

pos_lpf = lowpass(data,5,30);

vel_data = get_vel_from_pos(data);
vel_lpf = get_vel_from_pos(pos_lpf);
vel_ppca1 = get_vel_from_pos(ppca1);
vel_ppca2 = get_vel_from_pos(ppca2);
vel_ppca3 = get_vel_from_pos(ppca3);
vel_ppca4 = get_vel_from_pos(ppca4);
vel_ppca5 = get_vel_from_pos(ppca5);
vel_ppca6 = get_vel_from_pos(ppca6);

[x,y,z] = get_joint_coords(data, joint_interested);

t = [190:0.0333333:200];

pcs = [3 4 5 6 7 30];
supertitle = strcat(joint_interested,'-PPCA vs 5 Hz LPF');

%% Plot
figure
hold on

%position
subplot(3,2,1)
hold on
plot(t,data(5700:6000,x),'k')
plot(t,ppca1(5700:6000,x),'MarkerEdgeColor','#0072BD')
plot(t,ppca2(5700:6000,x),'MarkerEdgeColor','#D95319')
plot(t,ppca3(5700:6000,x),'MarkerEdgeColor','#EDB120')
plot(t,ppca4(5700:6000,x),'MarkerEdgeColor','#7E2F8E')
plot(t,ppca5(5700:6000,x),'MarkerEdgeColor','#77AC30')
plot(t,ppca6(5700:6000,x),'MarkerEdgeColor','#4DBEEE')
plot(t,pos_lpf(5700:6000,x),'MarkerEdgeColor',	'#A2142F')
title('X pos')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
xlabel('sec')
ylabel('mm')

subplot(3,2,3)
hold on
plot(t,data(5700:6000,y),'k')
plot(t,ppca1(5700:6000,y),'MarkerEdgeColor','#0072BD')
plot(t,ppca2(5700:6000,y),'MarkerEdgeColor','#D95319')
plot(t,ppca3(5700:6000,y),'MarkerEdgeColor','#EDB120')
plot(t,ppca4(5700:6000,y),'MarkerEdgeColor','#7E2F8E')
plot(t,ppca5(5700:6000,y),'MarkerEdgeColor','#77AC30')
plot(t,ppca6(5700:6000,y),'MarkerEdgeColor','#4DBEEE')
plot(t,pos_lpf(5700:6000,y),'MarkerEdgeColor',	'#A2142F')
title('Y pos')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
xlabel('sec')
ylabel('mm')

subplot(3,2,5)
hold on
plot(t,data(5700:6000,z),'k')
plot(t,ppca1(5700:6000,z),'MarkerEdgeColor','#0072BD')
plot(t,ppca2(5700:6000,z),'MarkerEdgeColor','#D95319')
plot(t,ppca3(5700:6000,z),'MarkerEdgeColor','#EDB120')
plot(t,ppca4(5700:6000,z),'MarkerEdgeColor','#7E2F8E')
plot(t,ppca5(5700:6000,z),'MarkerEdgeColor','#77AC30')
plot(t,ppca6(5700:6000,z),'MarkerEdgeColor','#4DBEEE')
plot(t,pos_lpf(5700:6000,z),'MarkerEdgeColor',	'#A2142F')
title('Z pos')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
xlabel('sec')
ylabel('mm')

% velocity
subplot(3,2,2)
hold on
plot(t,vel_data(5700:6000,x),'k')
plot(t,vel_ppca1(5700:6000,x),'MarkerEdgeColor','#0072BD')
plot(t,vel_ppca2(5700:6000,x),'MarkerEdgeColor','#D95319')
plot(t,vel_ppca3(5700:6000,x),'MarkerEdgeColor','#EDB120')
plot(t,vel_ppca4(5700:6000,x),'MarkerEdgeColor','#7E2F8E')
plot(t,vel_ppca5(5700:6000,x),'MarkerEdgeColor','#77AC30')
plot(t,vel_ppca6(5700:6000,x),'MarkerEdgeColor','#4DBEEE')
plot(t,vel_lpf(5700:6000,x),'MarkerEdgeColor',	'#A2142F')
title('X vel')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,4)
hold on
plot(t,vel_data(5700:6000,y),'k')
plot(t,vel_ppca1(5700:6000,y),'MarkerEdgeColor','#0072BD')
plot(t,vel_ppca2(5700:6000,y),'MarkerEdgeColor','#D95319')
plot(t,vel_ppca3(5700:6000,y),'MarkerEdgeColor','#EDB120')
plot(t,vel_ppca4(5700:6000,y),'MarkerEdgeColor','#7E2F8E')
plot(t,vel_ppca5(5700:6000,y),'MarkerEdgeColor','#77AC30')
plot(t,vel_ppca6(5700:6000,y),'MarkerEdgeColor','#4DBEEE')
plot(t,vel_lpf(5700:6000,y),'MarkerEdgeColor',	'#A2142F')
title('Y vel')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,6)
hold on
plot(t,vel_data(5700:6000,z),'k')
plot(t,vel_ppca1(5700:6000,z),'MarkerEdgeColor','#0072BD')
plot(t,vel_ppca2(5700:6000,z),'MarkerEdgeColor','#D95319')
plot(t,vel_ppca3(5700:6000,z),'MarkerEdgeColor','#EDB120')
plot(t,vel_ppca4(5700:6000,z),'MarkerEdgeColor','#7E2F8E')
plot(t,vel_ppca5(5700:6000,z),'MarkerEdgeColor','#77AC30')
plot(t,vel_ppca6(5700:6000,z),'MarkerEdgeColor','#4DBEEE')
plot(t,vel_lpf(5700:6000,z),'MarkerEdgeColor',	'#A2142F')
title('Z vel')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
ylabel('mm/sec')
xlabel('sec')

sgtitle(supertitle)