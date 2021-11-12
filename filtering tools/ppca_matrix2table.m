function ppca_table = ppca_matrix2table(good_frames_3d,ppca_interpolated)

ppca_table = good_frames_3d;
ppca_interpolated = ppca_interpolated';
    

ppca_table(:,1:3) = num2cell(ppca_interpolated(:,1:3));
ppca_table(:,6:8) = num2cell(ppca_interpolated(:,4:6));
ppca_table(:,11:13) = num2cell(ppca_interpolated(:,7:9));
ppca_table(:,16:18) = num2cell(ppca_interpolated(:,10:12));
ppca_table(:,21:23) = num2cell(ppca_interpolated(:,13:15));
ppca_table(:,26:28) = num2cell(ppca_interpolated(:,16:18));
ppca_table(:,31:33) = num2cell(ppca_interpolated(:,19:21));
ppca_table(:,36:38) = num2cell(ppca_interpolated(:,22:24));
ppca_table(:,41:43) = num2cell(ppca_interpolated(:,25:27));
ppca_table(:,46:48) = num2cell(ppca_interpolated(:,28:30));
ppca_table(:,51:53) = num2cell(ppca_interpolated(:,31:33));
ppca_table(:,56:58) = num2cell(ppca_interpolated(:,34:36));
ppca_table(:,61:63) = num2cell(ppca_interpolated(:,37:39));
ppca_table(:,66:68) = num2cell(ppca_interpolated(:,40:42));
ppca_table(:,71:73) = num2cell(ppca_interpolated(:,43:45));
ppca_table(:,76:78) = num2cell(ppca_interpolated(:,46:48));
ppca_table(:,81:83) = num2cell(ppca_interpolated(:,49:51));
ppca_table(:,86:88) = num2cell(ppca_interpolated(:,52:54));
ppca_table(:,91:93) = num2cell(ppca_interpolated(:,55:57));
ppca_table(:,96:98) = num2cell(ppca_interpolated(:,58:60));
ppca_table(:,101:103) = num2cell(ppca_interpolated(:,61:63));
