function [vel_pca, pos_pca] = plot_pos_vel_pca(data)

%% Setup
t = [0:0.0333333:19.96666];
%lpf(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105,106]) = [];
pcs= [3];
frame_length = 40000;
vel_frame_length = frame_length - 1;

%% Calculate velocity
vel_data = [];
for j = 1:width(data)
    for f = 1:height(data)-1
        vel_data(f,j) = (data(f + 1,j) - data(f,j)) * 30;
    end
end

%% PCA
[coeff,score,latent,tsquared,explained,mu] = pca(data);

[vel_coeff,vel_score,vel_latent,vel_tsquared,vel_explained,vel_mu] = pca(vel_data);

%% Varience explained
pos_scree = zeros(size(explained));
pos_scree(1) = explained(1);

for i = 2:length(explained)
    pos_scree(i) = pos_scree(i-1) + explained(i);
end

vel_scree = zeros(size(vel_explained));
vel_scree(1) = vel_explained(1);

for i = 2:length(vel_explained)
    vel_scree(i) = vel_scree(i-1) + vel_explained(i);
end

%% Plots
for pc = 1:length(pcs)
    
    pc = pcs(pc);
    
    score_select_pcs = score(:,1:pc);
    coeff_select_pcs = coeff(:,1:pc);
    pos_pca = score_select_pcs * transpose(coeff_select_pcs) + repmat(mu,frame_length,1);

    vel_score_select_pcs = vel_score(:,1:pc);
    vel_coeff_select_pcs = vel_coeff(:,1:pc);
    vel_pca = vel_score_select_pcs * transpose(vel_coeff_select_pcs) + repmat(vel_mu,vel_frame_length,1);

    
    joint = 'PIP Index';
    supertitle = strcat('PCA - ',joint,' - ',string(pc),' PCs');
    subt_vel = strcat('Velocity: ', string(round(vel_scree(pc),2)), '% varience explained');
    subt_pos = strcat('Position: ', string(round(pos_scree(pc),2)), '% varience explained');

    % velocity
    fig = figure;
    hold on

    subplot(3,2,1)
    hold on
    plot(t,vel_data(5400:5999,25),'k')
    plot(t,vel_pca(5400:5999,25),'c')
    title(subt_vel,'FontWeight','normal')
    subtitle('X vel','FontWeight','bold')
    legend('prePCA','postPCA')
    ylabel('mm/sec')   
    xlabel('sec')

    subplot(3,2,3)
    hold on
    plot(t,vel_data(5400:5999,26),'k')
    plot(t,vel_pca(5400:5999,26),'m')
    title('Y vel')
    legend('prePCA','postPCA')
    ylabel('mm/sec')
    xlabel('sec')

    subplot(3,2,5)
    hold on
    plot(t,vel_data(5400:5999,27),'k')
    plot(t,vel_pca(5400:5999,27),'g')
    title('Z vel')
    legend('prePCA','postPCA')
    ylabel('mm/sec')
    xlabel('sec')

    %position
    subplot(3,2,2)
    hold on
    plot(t,data(5400:5999,25),'k')
    plot(t,pos_pca(5400:5999,25),'c')
    title(subt_pos,'FontWeight','normal')
    subtitle('X pos','Fontweight','bold')
    legend('prePCA','postPCA')
    ylabel('mm')
    xlabel('sec')

    subplot(3,2,4)
    hold on
    plot(t,data(5400:5999,26),'k')
    plot(t,pos_pca(5400:5999,26),'m')
    title('Y pos')
    legend('prePCA','postPCA')
    ylabel('mm')
    xlabel('sec')

    subplot(3,2,6)
    hold on
    plot(t,data(5400:5999,27),'k')
    plot(t,pos_pca(5400:5999,27),'g')
    title('Z pos')
    legend('prePCA','postPCA')
    ylabel('mm')
    xlabel('sec')

    sgtitle(supertitle)
    
    hold off
    
    %save_name = strcat('/Users/ercrg/LimbLab/analysis/PIP1_raw_interp_pca_',string(pc));
    %saveas(fig,strcat(save_name,'.png'))
end

%% Scree Plots
figure
plot(pos_scree,'-*')

figure
plot(vel_scree,'-*')
