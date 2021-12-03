joints={'Wrist','CMC Thumb','MCP Thumb','MCP1','MCP2','MCP3','MCP4','IP Thumb','PIP1','PIP2','PIP3','PIP4','DIP1','DIP2','DIP3','DIP4','Tip Thumb','Tip1','Tip2','Tip3','Tip4'};

% SVD
%for joint =1:length(joints)
%    plot_pca_lpf(string(joints(joint)),146,156,data_full,data,train_recon_4,train_recon_5,train_recon_6,train_recon_7,train_recon_8,train_recon_9,train_recon_10,e4_train,e5_train,e6_train,e7_train,e8_train,e9_train,e10_train,f2d_train_4,f2d_train_5,f2d_train_6,f2d_train_7,f2d_train_8,f2d_train_9,f2d_train_10,train_ind_4, train_ind_5, train_ind_6, train_ind_7, train_ind_8, train_ind_9, train_ind_10)
%end

%ALS
for joint =1:length(joints)
    plot_pca_lpf(string(joints(joint)),146,156,data_full,data,train_recon_als_4,train_recon_als_5,train_recon_als_6,train_recon_als_7,train_recon_als_8,train_recon_als_9,train_recon_als_10,e4_als_train,e5_als_train,e6_als_train,e7_als_train,e8_als_train,e9_als_train,e10_als_train,f2d_train_als_4,f2d_train_als_5,f2d_train_als_6,f2d_train_als_7,f2d_train_als_8,f2d_train_als_9,f2d_train_als_10,train_ind_als_4, train_ind_als_5, train_ind_als_6, train_ind_als_7, train_ind_als_8, train_ind_als_9, train_ind_als_10)
end