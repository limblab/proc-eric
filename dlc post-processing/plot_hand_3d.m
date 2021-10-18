function plot_hand_3d(output3ddata, selected_frames)
%takes in processed 3d data and spits out 3d skeletons for the selected
%frames. Add warnings for missing labels

%if class(output3Ddata) == 'table'
%    output3Ddata = table2array(output3Ddata);
%end
    
if length(output3ddata) > 63: & length(output3ddata) < 107:
    output3ddata(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105,106]) = [];
end
if length(output3ddata) == 107:
    output3ddata(:,[1,5,6,10,11,15,16,20,21,25,26,30,31,35,36,40,41,45,46,50,51,55,56,60,61,65,66,70,71,75,76,80,81,85,86,90,91,95,96,100,101,105,106,107]) = [];
end

pos_by_hand=zeros(size(reshape(output3ddata,21,3,length(output3ddata))));

for hand_frame = 1:length(output3ddata)
    hand = output3ddata(hand_frame,:)';
    hand = reshape(hand,3,21)';         %makes a matrix with dimensions joint x coordinate
    pos_by_hand(:,:,hand_frame) = hand; %each page is one frame's hand
end

%selected_frames = [1 16000 35000 54000];

for frame = 1:length(selected_frames)
    
    figure
    hold on
    
    title(['Frame', num2str(selected_frames(frame))])

    for joint = 1:21
        scatter3(pos_by_hand(joint,1,selected_frames(frame)),pos_by_hand(joint,2,selected_frames(frame)),pos_by_hand(joint,3,selected_frames(frame)),'filled')
    end



%% draw skeleton
    
% thumb
    plot3([pos_by_hand(1,1,selected_frames(frame)) pos_by_hand(2,1,selected_frames(frame))],[pos_by_hand(1,2,selected_frames(frame)) pos_by_hand(2,2,selected_frames(frame))], [pos_by_hand(1,3,selected_frames(frame)) pos_by_hand(2,3,selected_frames(frame))])
    plot3([pos_by_hand(2,1,selected_frames(frame)) pos_by_hand(3,1,selected_frames(frame))],[pos_by_hand(2,2,selected_frames(frame)) pos_by_hand(3,2,selected_frames(frame))], [pos_by_hand(2,3,selected_frames(frame)) pos_by_hand(3,3,selected_frames(frame))])
    plot3([pos_by_hand(3,1,selected_frames(frame)) pos_by_hand(8,1,selected_frames(frame))],[pos_by_hand(3,2,selected_frames(frame)) pos_by_hand(8,2,selected_frames(frame))], [pos_by_hand(3,3,selected_frames(frame)) pos_by_hand(8,3,selected_frames(frame))])
    plot3([pos_by_hand(8,1,selected_frames(frame)) pos_by_hand(17,1,selected_frames(frame))],[pos_by_hand(8,2,selected_frames(frame)) pos_by_hand(17,2,selected_frames(frame))], [pos_by_hand(8,3,selected_frames(frame)) pos_by_hand(17,3,selected_frames(frame))])

% index
    plot3([pos_by_hand(1,1,selected_frames(frame)) pos_by_hand(4,1,selected_frames(frame))],[pos_by_hand(1,2,selected_frames(frame)) pos_by_hand(4,2,selected_frames(frame))], [pos_by_hand(1,3,selected_frames(frame)) pos_by_hand(4,3,selected_frames(frame))])
    plot3([pos_by_hand(4,1,selected_frames(frame)) pos_by_hand(9,1,selected_frames(frame))],[pos_by_hand(4,2,selected_frames(frame)) pos_by_hand(9,2,selected_frames(frame))], [pos_by_hand(4,3,selected_frames(frame)) pos_by_hand(9,3,selected_frames(frame))])
    plot3([pos_by_hand(9,1,selected_frames(frame)) pos_by_hand(13,1,selected_frames(frame))],[pos_by_hand(9,2,selected_frames(frame)) pos_by_hand(13,2,selected_frames(frame))], [pos_by_hand(9,3,selected_frames(frame)) pos_by_hand(13,3,selected_frames(frame))])
    plot3([pos_by_hand(13,1,selected_frames(frame)) pos_by_hand(18,1,selected_frames(frame))],[pos_by_hand(13,2,selected_frames(frame)) pos_by_hand(18,2,selected_frames(frame))], [pos_by_hand(13,3,selected_frames(frame)) pos_by_hand(18,3,selected_frames(frame))])

% middle
    plot3([pos_by_hand(1,1,selected_frames(frame)) pos_by_hand(5,1,selected_frames(frame))],[pos_by_hand(1,2,selected_frames(frame)) pos_by_hand(5,2,selected_frames(frame))], [pos_by_hand(1,3,selected_frames(frame)) pos_by_hand(5,3,selected_frames(frame))])
    plot3([pos_by_hand(5,1,selected_frames(frame)) pos_by_hand(10,1,selected_frames(frame))],[pos_by_hand(5,2,selected_frames(frame)) pos_by_hand(10,2,selected_frames(frame))], [pos_by_hand(5,3,selected_frames(frame)) pos_by_hand(10,3,selected_frames(frame))])
    plot3([pos_by_hand(10,1,selected_frames(frame)) pos_by_hand(14,1,selected_frames(frame))],[pos_by_hand(10,2,selected_frames(frame)) pos_by_hand(14,2,selected_frames(frame))], [pos_by_hand(10,3,selected_frames(frame)) pos_by_hand(14,3,selected_frames(frame))])
    plot3([pos_by_hand(14,1,selected_frames(frame)) pos_by_hand(19,1,selected_frames(frame))],[pos_by_hand(14,2,selected_frames(frame)) pos_by_hand(19,2,selected_frames(frame))], [pos_by_hand(14,3,selected_frames(frame)) pos_by_hand(19,3,selected_frames(frame))])

% ring
    plot3([pos_by_hand(1,1,selected_frames(frame)) pos_by_hand(6,1,selected_frames(frame))],[pos_by_hand(1,2,selected_frames(frame)) pos_by_hand(6,2,selected_frames(frame))], [pos_by_hand(1,3,selected_frames(frame)) pos_by_hand(6,3,selected_frames(frame))])
    plot3([pos_by_hand(6,1,selected_frames(frame)) pos_by_hand(11,1,selected_frames(frame))],[pos_by_hand(6,2,selected_frames(frame)) pos_by_hand(11,2,selected_frames(frame))], [pos_by_hand(6,3,selected_frames(frame)) pos_by_hand(11,3,selected_frames(frame))])
    plot3([pos_by_hand(11,1,selected_frames(frame)) pos_by_hand(15,1,selected_frames(frame))],[pos_by_hand(11,2,selected_frames(frame)) pos_by_hand(15,2,selected_frames(frame))], [pos_by_hand(11,3,selected_frames(frame)) pos_by_hand(15,3,selected_frames(frame))])
    plot3([pos_by_hand(15,1,selected_frames(frame)) pos_by_hand(20,1,selected_frames(frame))],[pos_by_hand(15,2,selected_frames(frame)) pos_by_hand(20,2,selected_frames(frame))], [pos_by_hand(15,3,selected_frames(frame)) pos_by_hand(20,3,selected_frames(frame))])

% pinky
    plot3([pos_by_hand(1,1,selected_frames(frame)) pos_by_hand(7,1,selected_frames(frame))],[pos_by_hand(1,2,selected_frames(frame)) pos_by_hand(7,2,selected_frames(frame))], [pos_by_hand(1,3,selected_frames(frame)) pos_by_hand(7,3,selected_frames(frame))])
    plot3([pos_by_hand(7,1,selected_frames(frame)) pos_by_hand(12,1,selected_frames(frame))],[pos_by_hand(7,2,selected_frames(frame)) pos_by_hand(12,2,selected_frames(frame))], [pos_by_hand(7,3,selected_frames(frame)) pos_by_hand(12,3,selected_frames(frame))])
    plot3([pos_by_hand(12,1,selected_frames(frame)) pos_by_hand(16,1,selected_frames(frame))],[pos_by_hand(12,2,selected_frames(frame)) pos_by_hand(16,2,selected_frames(frame))], [pos_by_hand(12,3,selected_frames(frame)) pos_by_hand(16,3,selected_frames(frame))])
    plot3([pos_by_hand(16,1,selected_frames(frame)) pos_by_hand(21,1,selected_frames(frame))],[pos_by_hand(16,2,selected_frames(frame)) pos_by_hand(21,2,selected_frames(frame))], [pos_by_hand(16,3,selected_frames(frame)) pos_by_hand(21,3,selected_frames(frame))])
end
