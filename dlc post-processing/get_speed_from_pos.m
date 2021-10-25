function speed = get_speed_from_pos(data)

frame_rate = 30;
number_of_frames = size(data, 1);
number_of_landmarks = floor(size(data, 2)/3);

data = clean_position(data);
vel = get_vel_from_pos(data);

speed = zeros(number_of_frames-1, number_of_landmarks);

for i = 0:number_of_landmarks-1
    for fr = 1:number_of_frames-1
        H = vel(fr, 3*i+1:3*i+3);
        speed(fr, i+1) = sqrt(H * H');
    end
end