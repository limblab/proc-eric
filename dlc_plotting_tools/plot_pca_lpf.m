function plot_pca_lpf(joint_interested, data, frames_to_drop, pca6, pca7, pca8,pca9,pca10,e6,e7,e8,e9,e10)

% Low-pass filters the input data at 5 Hz, calculates velocities for input
% data and 6 pca runs

%% Setup

[x,y,z] = get_joint_coords(data, joint_interested);

%t = [193:0.0333333:195];
t = [377:0.0333333:379];
pcs = [6 7 8 9 10];
supertitle = strcat(joint_interested,' - PCA vs 5 Hz LPF');

%% Interp and lowpass

nanx = isnan(data);
datum = 1:numel(data);
data(nanx) = interp1(datum(~nanx), data(~nanx), datum(nanx));

posx_lpf = lowpass(data(:,x),5,30);
posy_lpf = lowpass(data(:,y),5,30);
posz_lpf = lowpass(data(:,z),5,30);


%% PCA

%pca6 = interpolation_method(data,pcs(1));
%pca7 = interpolation_method(data,pcs(2));
%pca8 = interpolation_method(data,pcs(3));
%pca9 = interpolation_method(data,pcs(4));
%pca10 = interpolation_method(data,pcs(5));
    
%% Need to integrate this with the ppca_metric_2 code
%interpolated = sort(frames_to_drop(frames_to_drop >= 11310 & frames_to_drop <= 11370));
interpolated = sort(frames_to_drop(frames_to_drop >= 11310 & frames_to_drop <= 11370));

%% Plot
f = figure;
hold on
f.Position = [10 10 1750 800];
%position
subplot(3,1,1)
hold on
plot(t,data(11310:11370,x),'linewidth',2,'Color','k')
plot(t,posx_lpf(11310:11370),'linewidth',2,'Color','r')
plot(t,pca6(11310:11370,x),'linewidth',2,'Color','#0072BD')
plot(t,pca7(11310:11370,x),'linewidth',2,'Color','#D95319')
plot(t,pca8(11310:11370,x),'linewidth',2,'Color','#EDB120')
plot(t,pca9(11310:11370,x),'linewidth',2,'Color','#7E2F8E')
plot(t,pca10(11310:11370,x),'linewidth',2,'Color','#77AC30')
xline(interpolated(1)/30,'-','Interpolated')
for frame = 2:length(interpolated)
    xline(interpolated(frame)/30)
end

title('X pos')
legend('rawData','5Hz LPF',strcat(string(pcs(1)),'PCs - Error = ',string(mean(e6(4,:,:)))),strcat(string(pcs(2)),'PCs - Error = ', string(mean(e7(4,:,:)))),strcat(string(pcs(3)),'PCs - Error = ', string(mean(e8(4,:,:)))),strcat(string(pcs(4)),'PCs - Error = ',string(mean(e9(4,:,:)))),strcat(string(pcs(5)),'PCs - Error = ',string(mean(e10(4,:,:)))))
xlabel('sec')
ylabel('mm')

subplot(3,1,2)
hold on
plot(t,data(11310:11370,y),'linewidth',2,'Color','k')
plot(t,posy_lpf(11310:11370),'linewidth',2,'Color','r')
plot(t,pca6(11310:11370,y),'linewidth',2,'Color','#0072BD')
plot(t,pca7(11310:11370,y),'linewidth',2,'Color','#D95319')
plot(t,pca8(11310:11370,y),'linewidth',2,'Color','#EDB120')
plot(t,pca9(11310:11370,y),'linewidth',2,'Color','#7E2F8E')
plot(t,pca10(11310:11370,y),'linewidth',2,'Color','#77AC30')
xline(interpolated(1)/30,'-','Interpolated')
for frame = 2:length(interpolated)
    xline(interpolated(frame)/30)
end

title('Y pos')
legend('rawData','5Hz LPF',strcat(string(pcs(1)),'PCs - Error = ',string(mean(e6(4,:,:)))),strcat(string(pcs(2)),'PCs - Error = ', string(mean(e7(4,:,:)))),strcat(string(pcs(3)),'PCs - Error = ', string(mean(e8(4,:,:)))),strcat(string(pcs(4)),'PCs - Error = ',string(mean(e9(4,:,:)))),strcat(string(pcs(5)),'PCs - Error = ',string(mean(e10(4,:,:)))))
xlabel('sec')
ylabel('mm')

subplot(3,1,3)
hold on
plot(t,data(11310:11370,z),'linewidth',2,'Color','k')
plot(t,posz_lpf(11310:11370),'linewidth',2,'Color','r')
plot(t,pca6(11310:11370,z),'linewidth',2,'Color','#0072BD')
plot(t,pca7(11310:11370,z),'linewidth',2,'Color','#D95319')
plot(t,pca8(11310:11370,z),'linewidth',2,'Color','#EDB120')
plot(t,pca9(11310:11370,z),'linewidth',2,'Color','#7E2F8E')
plot(t,pca10(11310:11370,z),'linewidth',2,'Color','#77AC30')
xline(interpolated(1)/30,'-','Interpolated')
for frame = 2:length(interpolated)
    xline(interpolated(frame)/30)
end

title('Z pos')
legend('rawData','5Hz LPF',strcat(string(pcs(1)),'PCs - Error = ',string(mean(e6(4,:,:)))),strcat(string(pcs(2)),'PCs - Error = ', string(mean(e7(4,:,:)))),strcat(string(pcs(3)),'PCs - Error = ', string(mean(e8(4,:,:)))),strcat(string(pcs(4)),'PCs - Error = ',string(mean(e9(4,:,:)))),strcat(string(pcs(5)),'PCs - Error = ',string(mean(e10(4,:,:)))))
xlabel('sec')
ylabel('mm')


sgtitle(supertitle)

saveas(f,strcat('/Users/ercrg/LimbLab/analysis/pca 11_20/9_21/joint timeseries/',joint_interested,' - PCA comparison.png'))