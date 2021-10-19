function plot_pos_vel_COM_removed(data,joint_interested)

% need to run velocity beforehand so it can be independently subjected to PPCA

%% Clean up unneeded columns
data = clean_position(data);

%% Get Wrist and remove from other joints
[COM_removed, COM] = remove_COM(data);

%% Get velocities
vel_data = get_vel_from_pos(data);
vel_COM_removed = get_vel_from_pos(COM_removed);
vel_COM = get_vel_from_pos(COM);

%% Plot Setup
t = [190:0.0333333:200];
[x,y,z] = get_joint_coords(data,joint_interested);
supertitle = strcat('COM removal - ',joint_interested);

%% Plot
figure
hold on

%position
subplot(3,2,1)
hold on
plot(t,data(5700:6000,x),'k')
plot(t,COM_removed(5700:6000,x),'c')
plot(t,COM(5700:6000,1),'b')
title('X pos')
legend('w/COM','COM removed','COM')
xlabel('sec')
ylabel('mm')

subplot(3,2,3)
hold on
plot(t,data(5700:6000,y),'k')
plot(t,COM_removed(5700:6000,y),'m')
plot(t,COM(5700:6000,2),'b')
title('Y pos')
legend('w/COM','COM removed','COM')
xlabel('sec')
ylabel('mm')

subplot(3,2,5)
hold on
plot(t,data(5700:6000,z),'k')
plot(t,COM_removed(5700:6000,z),'g')
plot(t,COM(5700:6000,3),'b')
title('Z pos')
legend('w/COM','COM removed','COM')
xlabel('sec')
ylabel('mm')

% velocity
subplot(3,2,2)
hold on
plot(t,vel_data(5700:6000,x),'k')
plot(t,vel_COM_removed(5700:6000,x),'c')
plot(t,vel_COM(5700:6000,1),'b')
title('X vel')
legend('w/COM','COM removed','COM')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,4)
hold on
plot(t,vel_data(5700:6000,y),'k')
plot(t,vel_COM_removed(5700:6000,y),'m')
plot(t,vel_COM(5700:6000,2),'b')
title('Y vel')
legend('w/COM','COM removed','COM')
ylabel('mm/sec')
xlabel('sec')

subplot(3,2,6)
hold on
plot(t,vel_data(5700:6000,z),'k')
plot(t,vel_COM_removed(5700:6000,z),'g')
plot(t,vel_COM(5700:6000,3),'b')
title('Z vel')
legend('w/COM','COM removed','COM')
ylabel('mm/sec')
xlabel('sec')

sgtitle(supertitle)