function plot_CoM_compare(raw,CoMremoved)

t = [0:0.0333333:19.96666];

joint = 'Pip1';
num_pcs=7;
figure
hold on


plot(t,raw(5400:5999,26),'k')
plot(t,CoMremoved(5400:5999,26),'m')
title(strcat('X pos: ', joint))
legend('rawData','CoMremoved')
xlabel('sec')
ylabel('mm')