function plot_pos_vel_wrist_and_removed(data,joint_interested)

% need to run velocity beforehand so it can be independently subjected to PPCA

%% Clean up unneeded columns
data = clean_position(data);

%% Get Wrist and remove from other joints
wrist = data(:,1:3);
wrist_removed = remove_wrist(data,wrist);

%% Get velocities
vel_data = get_vel_from_pos(data);
vel_wrist = get_vel_from_pos(wrist);
vel_wrist_removed = get_vel_from_pos(wrist_removed);

%% Plot Setup
t = [90:0.0333333:100];
[x,y,z] = get_joint_coords(data,joint_interested);
supertitle = strcat('Wrist removal - ',joint_interested);

%% Plot
figure
hold on

%position
subplot(3,2,1)
hold on
plot(t,data(2786:3086,x),'k')
plot(t,wrist_removed(2786:3086,x),'c')
plot(t,wrist(2786:3086,1),'b')
title('X pos')
legend('w/wrist','wrist removed','wrist')
xlabel('sec')
ylabel('mm')

subplot(3,2,3)
hold on
plot(t,data(2786:3086,y),'k')
plot(t,wrist_removed(2786:3086,y),'m')
plot(t,wrist(2786:3086,2),'b')
title('Y pos')
legend('w/wrist','wrist removed','wrist')
xlabel('sec')
ylabel('mm')

subplot(3,2,5)
hold on
plot(t,data(2786:3086,z),'k')
plot(t,wrist_removed(2786:3086,z),'g')
plot(t,wrist(2786:3086,3),'b')
title('Z pos')
legend('w/wrist','wrist removed','wrist')
xlabel('sec')
ylabel('mm')

% velocity
subplot(3,2,2)
hold on
plot(t,vel_data(2786:3086,x),'k')
plot(t,vel_wrist_removed(2786:3086,x),'c')
plot(t,vel_wrist(2786:3086,1),'b')
title('X vel')
legend('w/wrist','wrist removed','wrist')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,4)
hold on
plot(t,vel_data(2786:3086,y),'k')
plot(t,vel_wrist_removed(2786:3086,y),'m')
plot(t,vel_wrist(2786:3086,2),'b')
title('Y vel')
legend('w/wrist','wrist removed','wrist')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,6)
hold on
plot(t,vel_data(2786:3086,z),'k')
plot(t,vel_wrist_removed(2786:3086,z),'g')
plot(t,vel_wrist(2786:3086,3),'b')
title('Z vel')
legend('w/wrist','wrist removed','wrist')
ylabel('mm/sec')
xlabel('sec')

sgtitle(supertitle)