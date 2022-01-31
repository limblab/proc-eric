% quick and easy plot of training iterations (ranging from 0 to 500k) vs
% pixel error on one axis and loss on the other.
% Results spreadsheets should be in format seen here: https://docs.google.com/spreadsheets/d/1ZN8x58NMUTu8QLR-Hli2PbTH0r3FJwvA_TbTSlXPX_Q/edit#gid=441276786

%results = readmatrix('/Users/ercrg/Downloads/GraspModelStats_108.csv');
%results(:,1) = []; % remove variable name column

figure
hold on

yyaxis left
ylabel('Mean Average Euclidean error (pixels)')
xlabel('training iterations')
xlim([0 550000])
ylim([0 40])

% plot pixel errors
plot(results(1,:),results(3,:),'-o')
plot(results(1,:),results(4,:),'-x')

% plot loss
yyaxis right
ylabel('loss')
%xlim([0 550000])
ylim([0.002 0.0175])
yticks(linspace(ylimits(1),0.0175,32))

plot(results(1,:),results(2,:),'-d')

legend('train','test','loss')
title('iteration-106 (left MVB)')