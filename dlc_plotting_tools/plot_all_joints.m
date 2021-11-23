joints={'Wrist','CMC Thumb','MCP Thumb','MCP1','MCP2','MCP3','MCP4','IP Thumb','PIP1','PIP2','PIP3','PIP4','DIP1','DIP2','DIP3','DIP4','Tip Thumb','Tip1','Tip2','Tip3','Tip4'};

for joint =1:length(joints)
    plot_pca_lpf(string(joints(joint)),data_full,frames_to_drop,pca6,pca7,pca8,pca9,pca10,e6,e7,e8,e9,e10);
end