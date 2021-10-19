function [COM_removed, COM] = remove_COM(data)

COM_removed = data;
COM = zeros(height(data),3);

for frame = 1:height(data)
    
    xs = data(frame,1:3:width(data));
    ys = data(frame,2:3:width(data));
    zs = data(frame,3:3:width(data));
    
    x_mean = nanmean(xs);
    y_mean = nanmean(ys);
    z_mean = nanmean(zs);
    
    COM(frame,1) = x_mean;
    COM(frame,2) = y_mean;
    COM(frame,3) = z_mean;
    
    for joint = 1:3:width(data)
        COM_removed(frame,joint) = COM_removed(frame,joint) - x_mean;
    end

    for joint = 2:3:width(data)
        COM_removed(frame,joint) = COM_removed(frame,joint) - y_mean;
    end

    for joint = 3:3:width(data)
        COM_removed(frame,joint) = COM_removed(frame,joint) - z_mean;
    end
    
end