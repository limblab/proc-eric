function cam_interested = get_2d_frames(cam_full,extraction_indices)                                                                           
                                                                                                                                               
cam_interested = zeros(length(extraction_indices),width(cam_full));                                                                            
                                                                                                                                               
for idx = 1:length(extraction_indices)                                                                                                         
    cam_interested(idx,:) = cam_full(extraction_indices(idx)+1,:);                                                                             
end                                                                                                                                            
                                                                                                                                               
cam_interested = unique(cam_interested,'rows');                                                                                                
cam_interested(:,4:3:end) = [];  