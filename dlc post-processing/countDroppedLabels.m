it1011_cam3=cam3DLCresnet50PoplefthandJul2shuffle1300000;
it1011_cam3 = removevars(it1011_cam3, 'scorer');
dropped=sum(sum(isnan(table2array(lpf))));
dropped

good_frames=sum(isnan(table2array(lpf)),2);
good_frames=sum(good_frames==0);
good_frames

dropped=sum(sum(isnan(lpf)));
dropped

good_frames=sum(isnan(lpf),2);
good_frames=sum(good_frames==0);
good_frames