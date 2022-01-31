
PCs = [1:10];
%error_1 = [mean(e1(1,:,:)) mean(e2(1,:,:)) mean(e3(1,:,:)) mean(e4(1,:,:)) mean(e5(1,:,:)) mean(e6(1,:,:)) mean(e7(1,:,:)) mean(e8(1,:,:)) mean(e9(1,:,:)) mean(e10(1,:,:))];
train_error_svd_8 = [e1_train_full(3) e2_train_full(3) e3_train_full(3) e4_train_full(3) e5_train_full(3) e6_train_full(3) e7_train_full(3) e8_train_full(3) e9_train_full(3) e10_train_full(3)];
train_error_als_8 = [e1_als_train_full(3) e2_als_train_full(3) e3_als_train_full(3) mean(e4_als_train_full(3,:)) mean(e5_als_train_full(3,:)) mean(e6_als_train_full(3,:)) mean(e7_als_train_full(3,:)) mean(e8_als_train_full(3,:)) mean(e9_als_train_full(3,:)) mean(e10_als_train_full(3,:))];
%error_16 = [mean(e1(4,:,:)) mean(e2(4,:,:)) mean(e3(4,:,:)) mean(e4(4,:,:)) mean(e5(4,:,:)) mean(e6(4,:,:)) mean(e7(4,:,:)) mean(e8(4,:,:)) mean(e9(4,:,:)) mean(e10(4,:,:))];

figure
hold on
%plot(PCs,error_1,'linewidth',3,'Color','#EDB120')
%plot(PCs,test_error_8,'linewidth',3,'Color','#7E2F8E','LineStyle','--')
plot(PCs,train_error_svd_8,'linewidth',3,'Color','#7E2F8E')
plot(PCs,train_error_als_8,'linewidth',3,'Color','#4DBEEE')

% xlabel('Consecutive Frames Dropped')
% ylabel('Number of Markers Dropped')
% title('Average Error on Interpolated Frames')

xlabel('Number of PCs')
ylabel('Error')
%legend('1 Marker Dropped','8 Markers Dropped','16 Markers Dropped')
title('Error by PCs - Full Dataset')
subtitle('Full restraint - 8 Markers Dropped')
legend('SVD','ALS')
%xlim([0 20])
%ylim([0 5.5])
xticks(PCs)