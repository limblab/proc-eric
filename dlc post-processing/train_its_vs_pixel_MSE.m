figure
hold on

xlim([0 7])
ylim([0 50])

x1 = zeros(5,1) + 2;
scatter(x1,results.train_200000,75,c)
scatter(x1,results.test_200000,75,c,'filled')

x2 = zeros(5,1) + 5;
scatter(x2,results.train_500000,75,c)
scatter(x2,results.test_500000,75,c,'filled')

plot([2 5],[results.train_200000(1) results.train_500000(1)])
plot([2 5],[results.train_200000(2) results.train_500000(2)])

plot([2 5],[results.test_200000(1) results.test_500000(1)])
plot([2 5],[results.test_200000(2) results.test_500000(2)])

legend('train','test')