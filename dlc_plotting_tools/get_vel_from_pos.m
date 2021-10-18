function vel = get_vel_from_pos(data)

%output3d(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105,106]) = [];
%output3ddatalpfppca(:,[1,5,6,10,11,15,16,20,21,25,26,30,31,35,36,40,41,45,46,50,51,55,56,60,61,65,66,70,71,75,76,80,81,85,86,90,91,95,96,100,101,105,106,107]) = [];

vel = zeros(size(data) - 1);
for frame = 1:height(data) - 1
    for joint = 1:width(data)
        vel(frame,joint) = (data(frame + 1, joint) - data(frame, joint)) * 30;
    end
end