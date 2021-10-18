% quick and easy plot of training iterations (ranging from 0 to 500k) vs
% pixel error on one axis and loss on the other.
% Results spreadsheets should be in format seen here: https://docs.google.com/spreadsheets/d/1ZN8x58NMUTu8QLR-Hli2PbTH0r3FJwvA_TbTSlXPX_Q/edit#gid=441276786

results = readmatrix('/Users/ercrg/Downloads/Grasp Model Stats - 104.csv');
results(:,1) = []; % remove variable name column

figure
hold on

yyaxis left
ylabel('pixels')
xlabel('training iterations')
xlim([0 550000])
ylim([0 32])

% plot pixel errors
plot(results(1,:),results(3,:),'-o')
plot(results(1,:),results(4,:),'-x')

% plot loss
yyaxis right
ylabel('loss')
xlim([0 550000])
ylim([0 0.016])
yticks(linspace(results(2,end),results(2,1),10))

plot(results(1,:),results(2,:),'-d')

legend('train','test','loss')