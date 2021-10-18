function plot_ppca_lpf(data, ppca1, ppca2, ppca3, ppca4,ppca5,ppca6, pos_lpf, vel_data,vel_ppca1, vel_ppca2, vel_ppca3, vel_ppca4, vel_ppca5,vel_ppca6,vel_lpf)

% need to run velocity beforehand so it can be independently subjected to PPCA

%% Setup
t = [0:0.0333333:19.96666];

joint = 'MCP Thumb';
pcs = [3 4 5 6 7 30];
supertitle = strcat(joint,'-PPCA vs 5 Hz LPF');

%% Plot

% velocity
figure
hold on

subplot(2,1,1)
hold on
plot(t,vel_data(5400:5999,7),'k')
plot(t,vel_ppca1(5400:5999,7),'MarkerEdgeColor','#0072BD')
plot(t,vel_ppca2(5400:5999,7),'MarkerEdgeColor','#D95319')
plot(t,vel_ppca3(5400:5999,7),'MarkerEdgeColor','#EDB120')
plot(t,vel_ppca4(5400:5999,7),'MarkerEdgeColor','#7E2F8E')
plot(t,vel_ppca5(5400:5999,7),'MarkerEdgeColor','#77AC30')
plot(t,vel_ppca6(5400:5999,7),'MarkerEdgeColor','#4DBEEE')
plot(t,vel_lpf(5400:5999,7),'MarkerEdgeColor',	'#A2142F')
title('X vel')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
ylabel('mm/sec')
xlabel('sec')


%position
subplot(2,1,2)
hold on
plot(t,data(5400:5999,7),'k')
plot(t,ppca1(5400:5999,7),'MarkerEdgeColor','#0072BD')
plot(t,ppca2(5400:5999,7),'MarkerEdgeColor','#D95319')
plot(t,ppca3(5400:5999,7),'MarkerEdgeColor','#EDB120')
plot(t,ppca4(5400:5999,7),'MarkerEdgeColor','#7E2F8E')
plot(t,ppca5(5400:5999,7),'MarkerEdgeColor','#77AC30')
plot(t,ppca6(5400:5999,7),'MarkerEdgeColor','#4DBEEE')
plot(t,pos_lpf(5400:5999,7),'MarkerEdgeColor',	'#A2142F')
title('X pos')
legend('rawData',strcat('PPCA',string(pcs(1))),strcat('PPCA',string(pcs(2))),strcat('PPCA',string(pcs(3))),strcat('PPCA',string(pcs(4))),strcat('PPCA',string(pcs(5))),strcat('PPCA',string(pcs(6))),'LPF5Hz')
xlabel('sec')
ylabel('mm')


sgtitle(supertitle)