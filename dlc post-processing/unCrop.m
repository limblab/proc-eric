function [cam_0, cam_1, cam_2, cam_3] = unCrop(cam_0_cropped, cam_1_cropped, cam_2_cropped, cam_3_cropped)
% I've been doing this pretty hackily, just changing the numbers every
% time. Same for saving the output tmatrices. There's probably a better way

%% cam_0

cam_0 = cam_0_cropped;

for frame = 1:height(cam_0)
    
    for bp_x = 2:3:64
        if cam_0(frame,bp_x) > 50
            cam_0(frame,bp_x) = cam_0(frame,bp_x) + 700;
        end
    end
    
    for bp_y = 3:3:64
        if cam_0(frame,bp_y) > 50
            cam_0(frame,bp_y) = cam_0(frame,bp_y) + 450;
        end
    end
    
end

%% cam_1

cam_1 =cam_1_cropped;

for frame = 1:height(cam_1)
    
    for bp_x = 2:3:64
        if cam_1(frame,bp_x) > 50
            cam_1(frame,bp_x) = cam_1(frame,bp_x) + 1150;
        end
    end
    
    for bp_y = 3:3:64
        if cam_1(frame,bp_y) > 50
            cam_1(frame,bp_y) = cam_1(frame,bp_y) + 275;
        end
    end
    
end

%% cam_2

cam_2 = cam_2_cropped;

for frame = 1:height(cam_2)
    
    for bp_x = 2:3:64
        if cam_2(frame,bp_x) > 50
            cam_2(frame,bp_x) = cam_2(frame,bp_x) + 200;
        end
    end
    
    for bp_y = 3:3:64
        if cam_2(frame,bp_y) > 50
            cam_2(frame,bp_y) = cam_2(frame,bp_y) + 200;
        end
    end
    
end


%% cam_3

cam_3 =cam_3_cropped;

for frame = 1:height(cam_3)
    
    for bp_x = 2:3:64
        if cam_3(frame,bp_x) > 50
            cam_3(frame,bp_x) = cam_3(frame,bp_x) + 450;
        end
    end
    
    for bp_y = 3:3:64
        if cam_3(frame,bp_y) > 50
            cam_3(frame,bp_y) = cam_3(frame,bp_y) + 250;
        end
    end
    
end

%% write to csv

writematrix(cam_0,'/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20210710/106/cam_0_output.csv');
writematrix(cam_1,'/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20210710/106/cam_1_output.csv');
writematrix(cam_2,'/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20210710/106/cam_2_output.csv');
writematrix(cam_3,'/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20210710/106/cam_3_output.csv');