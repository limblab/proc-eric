wr_mcp1=nanmean(link_length.(5));
wr_mcp2=nanmean(link_length.(9));
wr_mcp3=nanmean(link_length.(13));
wr_mcp4=nanmean(link_length.(17));
mcp3_pip3=nanmean(link_length.(14));
mcp4_pip4=nanmean(link_length.(18));

yline(wr_mcp1, 'r','LineWidth',1)
yline(wr_mcp1*1.15,'--r','LineWidth',1)
yline(wr_mcp1*0.85,'--r','LineWidth',1)
yline(wr_mcp2, 'r','LineWidth',1)
yline(wr_mcp2*1.15,'--r','LineWidth',1)
yline(wr_mcp2*0.85,'--r','LineWidth',1)
yline(wr_mcp3, 'r','LineWidth',1)
yline(wr_mcp3*1.15,'--r','LineWidth',1)
yline(wr_mcp3*0.85,'--r','LineWidth',1)
yline(wr_mcp4, 'r','LineWidth',1)
yline(wr_mcp4*1.15,'--r','LineWidth',1)
yline(wr_mcp4*0.85,'--r','LineWidth',1)
yline(mcp3_pip3, 'r','LineWidth',1)
yline(mcp3_pip3*1.15, 'r','LineWidth',1)
yline(mcp3_pip3*0.85, '--r', 'LineWidth',1)
yline(mcp4_pip4, 'r', 'LineWidth',1)
yline(mcp4_pip4*1.15, '--r', 'LineWidth',1)
yline(mcp4_pip4*0.85, '--r', 'LineWidth',1)
