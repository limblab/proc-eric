function plot_cdfs(data)

[~, ~, S, ~, Sb, DI, ~] = local_speed(data);
%joints = {'Wrist', 'CMC thumb', 'MCP thumb', 'MCP1', 'MCP2', 'MCP3', 'MCP4','IP thumb'};
joints = {'Wrist', 'CMC thumb', 'MCP thumb', 'MCP1', 'MCP2', 'MCP3', 'MCP4','IP thumb', 'PIP1', 'PIP2', 'PIP3', 'PIP4', 'Dip1', 'Dip2', 'Dip3', 'Dip4','Tip thumb', 'Tip1', 'Tip2', 'Tip3', 'Tip4'};

screen = get(groot,'ScreenSize');

for joint = 1:width(joints)
    cdf_fig = figure;
    cdf_fig.Position = [0,0,screen(3)/4,screen(4)/3];
    hold on
    
    H1 = histogram(Sb(DI<2,joint), 500, "Normalization", "cdf", "DisplayStyle", "stairs");
    z1 = H1.BinEdges(H1.Values>0.99);
    plot([z1(1) z1(1)],[0 0.99],'b')

    H2 = histogram(S(DI<2,joint), 500, "Normalization", "cdf", "DisplayStyle", "stairs");
    z2 = H2.BinEdges(H2.Values>0.99);
    plot([z2(1) z2(1)],[0 0.99],'m')
    
    title(strcat(string(joints(joint)),' after MCP down COG removal'))
    xlabel('mm/sec')
    ylabel('CDF')
    legend('With COG',strcat('99% at ',string(z1(1)),'mm/sec'),'COG removed',strcat('99% at ',string(z2(1)),'mm/sec'))
    ylim([0.8,1])
    
    saveas(cdf_fig,strcat('/Users/ercrg/LimbLab/analysis/10_21/cdfs/',string(joints(joint)),'.png'))
end