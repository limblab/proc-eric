function wrist_removed = remove_wrist(data,wrist)

wrist_removed = data;

for joint = 1:3:width(data)
    wrist_removed(:,joint) = wrist_removed(:,joint) - wrist(:,1);
end

for joint = 2:3:width(data)
    wrist_removed(:,joint) = wrist_removed(:,joint) - wrist(:,2);
end

for joint = 3:3:width(data)
    wrist_removed(:,joint) = wrist_removed(:,joint) - wrist(:,3);
end