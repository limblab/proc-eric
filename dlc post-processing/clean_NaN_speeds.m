function clean_speed = clean_NaN_speeds(raw_data,speed)

[~, ~, ~, ~, ~, DI, I] = local_speed(raw_data);

clean_speed = speed;

indices_to_NaN = [];
for i = 1:length(DI)
    if DI(i) > 2
        indices_to_NaN(end+1) = I(i+1);
    end
end

for j = 1:length(indices_to_NaN)
    clean_speed(indices_to_NaN(j)) = NaN;
end