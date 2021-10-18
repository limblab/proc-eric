function [pos_pca, vel_pca] = hand_pca(data,frame_length)

pcs = 3;
vel_frame_length = frame_length - 1;

vel_data = zeros(size(data) - 1);
for frame = 1:height(data) - 1
    for joint = 1:width(data)
        vel_data(frame,joint) = (data(frame + 1, joint) - data(frame, joint)) * 30;
    end
end


[coeff,score,~,~,explained,mu] = pca(data);

[vel_coeff,vel_score,~,~,vel_explained,vel_mu] = pca(vel_data);

score_select_pcs = score(:,1:pcs);
coeff_select_pcs = coeff(:,1:pcs);
pos_pca = score_select_pcs * transpose(coeff_select_pcs) + repmat(mu,frame_length,1);

vel_score_select_pcs = vel_score(:,1:pcs);
vel_coeff_select_pcs = vel_coeff(:,1:pcs);
vel_pca = vel_score_select_pcs * transpose(vel_coeff_select_pcs) + repmat(vel_mu,vel_frame_length,1);
