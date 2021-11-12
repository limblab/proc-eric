function extraction_indices = get_extraction_indices(data, frames_to_extg ract)                                                                
                                                                                                                                               
extraction_indices = zeros(size(frames_to_extract));                                                                                           
                                                                                                                                               
for idx = 1:length(frames_to_extract)                                                                                                          
    extraction_indices(idx) = data.fnum(frames_to_extract(idx));                                                                               
end                                                                                                                                            
             