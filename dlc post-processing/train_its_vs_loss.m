figure
hold on

xlim([0 7])
ylim([0 0.01])

x1 = zeros(5,1) + 2;
scatter(x1,results.loss_200000,75,c,'filled')

x2 = zeros(5,1) + 5;
scatter(x2,results.loss_500000,75,c,'filled')

plot([2 5],[results.loss_200000(1) results.loss_500000(1)])

plot([2 5],[results.loss_200000(2) results.loss_500000(2)])
