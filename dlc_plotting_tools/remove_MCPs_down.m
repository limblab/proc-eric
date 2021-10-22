function [MCPs_down_removed, COM] = remove_MCPs_down(data)

MCPs_down_removed = data;
COM = zeros(height(data),3);

for frame = 1:height(data)
    
    xs = data(frame,1:3:35);
    ys = data(frame,2:3:35);
    zs = data(frame,3:3:35);
    
    x_mean = nanmean(xs);
    y_mean = nanmean(ys);
    z_mean = nanmean(zs);
    
    COM(frame,1) = x_mean;
    COM(frame,2) = y_mean;
    COM(frame,3) = z_mean;
    
    for joint = 1:3:width(data)
        MCPs_down_removed(frame,joint) = MCPs_down_removed(frame,joint) - x_mean;
    end

    for joint = 2:3:width(data)
        MCPs_down_removed(frame,joint) = MCPs_down_removed(frame,joint) - y_mean;
    end

    for joint = 3:3:width(data)
        MCPs_down_removed(frame,joint) = MCPs_down_removed(frame,joint) - z_mean;
    end
    
end