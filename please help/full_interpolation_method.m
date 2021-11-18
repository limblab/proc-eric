function [times, error_full] = full_interpolation_method(data_full,Input_full_test,frames_to_drop,marker,num_pcs)         
 
% Interpolate
            tic
 
    %        interp_full = ppca_interpolation(Input_full_test);
    %        interp_full = pca_interpolation(Input_full_test);
             interp_full = interpolation_method(Input_full_test,num_pcs);
 
            times = toc;
            
            
            % Compute Error
 
            % for full dataset only,
            full_before = data_full(frames_to_drop,marker);
            dropped_full = interp_full(frames_to_drop,marker);
            
            dont_test = isnan(full_before); %in case some of the randomly dropped markers were already missing
            full_before = full_before(~dont_test);
            dropped_full = dropped_full(~dont_test);
 %           dropped_full_scram = dropped_scram_full(~dont_test);
 
            if sum(sum(isnan(dropped_full))) > 0 %ppca not interpolating long stretches of all markers dropped
                not_interpolated = isnan(dropped_full);
                full_before = full_before(~not_interpolated);
                dropped_full = dropped_full(~not_interpolated);
            end
                
 
             error_full = sum(abs(dropped_full - full_before)) / numel(dropped_full); %different format, but might change if we're looking frame by frame, or at all NaNs

