function nans = getNaNlocations(output3d)
% For converting 3D data from double format to a struct for FIU

nans = struct();

nans.Wrist_x = isnan(output3d(:,1)');
nans.Wrist_y = isnan(output3d(:,2)');
nans.Wrist_z = isnan(output3d(:,3)');
nans.Wrist_error = isnan(output3d(:,4)');
nans.Wrist_ncams = isnan(output3d(:,5)');

nans.CMC_thumb_x = isnan(output3d(:,6)');
nans.CMC_thumb_y = isnan(output3d(:,7)');
nans.CMC_thumb_z = isnan(output3d(:,8)');
nans.CMC_thumb_error = isnan(output3d(:,9)');
nans.CMC_thumb_ncams = isnan(output3d(:,10)');

nans.MCP_thumb_x = isnan(output3d(:,11)');
nans.MCP_thumb_y = isnan(output3d(:,12)');
nans.MCP_thumb_z = isnan(output3d(:,13)');
nans.MCP_thumb_error = isnan(output3d(:,14)');
nans.MCP_thumb_ncams = isnan(output3d(:,15)');

nans.MCP1_x = isnan(output3d(:,16)');
nans.MCP1_y = isnan(output3d(:,17)');
nans.MCP1_z = isnan(output3d(:,18)');
nans.MCP1_error = isnan(output3d(:,19)');
nans.MCP1_ncams = isnan(output3d(:,20)');

nans.MCP2_x = isnan(output3d(:,21)');
nans.MCP2_y = isnan(output3d(:,22)');
nans.MCP2_z = isnan(output3d(:,23)');
nans.MCP2_error = isnan(output3d(:,24)');
nans.MCP2_ncams = isnan(output3d(:,25)');

nans.MCP3_x = isnan(output3d(:,26)');
nans.MCP3_y = isnan(output3d(:,27)');
nans.MCP3_z = isnan(output3d(:,28)');
nans.MCP3_error = isnan(output3d(:,29)');
nans.MCP3_ncams = isnan(output3d(:,30)');

nans.MCP4_x = isnan(output3d(:,31)');
nans.MCP4_y = isnan(output3d(:,32)');
nans.MCP4_z = isnan(output3d(:,33)');
nans.MCP4_error = isnan(output3d(:,34)');
nans.MCP4_ncams = isnan(output3d(:,35)');

nans.IP_thumb_x = isnan(output3d(:,36)');
nans.IP_thumb_y = isnan(output3d(:,37)');
nans.IP_thumb_z = isnan(output3d(:,38)');
nans.IP_thumb_error = isnan(output3d(:,39)');
nans.IP_thumb_ncams = isnan(output3d(:,40)');

nans.PIP1_x = isnan(output3d(:,41)');
nans.PIP1_y = isnan(output3d(:,42)');
nans.PIP1_z = isnan(output3d(:,43)');
nans.PIP1_error = isnan(output3d(:,44)');
nans.PIP1_ncams = isnan(output3d(:,45)');

nans.PIP2_x = isnan(output3d(:,46)');
nans.PIP2_y = isnan(output3d(:,47)');
nans.PIP2_z = isnan(output3d(:,48)');
nans.PIP2_error = isnan(output3d(:,49)');
nans.PIP2_ncams = isnan(output3d(:,50)');

nans.PIP3_x = isnan(output3d(:,51)');
nans.PIP3_y = isnan(output3d(:,52)');
nans.PIP3_z = isnan(output3d(:,53)');
nans.PIP3_error = isnan(output3d(:,54)');
nans.PIP3_ncams = isnan(output3d(:,55)');

nans.PIP4_x = isnan(output3d(:,56)');
nans.PIP4_y = isnan(output3d(:,57)');
nans.PIP4_z = isnan(output3d(:,58)');
nans.PIP4_error = isnan(output3d(:,59)');
nans.PIP4_ncams = isnan(output3d(:,60)');

nans.Dip1_x = isnan(output3d(:,61)');
nans.Dip1_y = isnan(output3d(:,62)');
nans.Dip1_z = isnan(output3d(:,63)');
nans.Dip1_error = isnan(output3d(:,64)');
nans.Dip1_ncams = isnan(output3d(:,65)');

nans.Dip2_x = isnan(output3d(:,66)');
nans.Dip2_y = isnan(output3d(:,67)');
nans.Dip2_z = isnan(output3d(:,68)');
nans.Dip2_error = isnan(output3d(:,69)');
nans.Dip2_ncams = isnan(output3d(:,70)');

nans.Dip3_x = isnan(output3d(:,71)');
nans.Dip3_y = isnan(output3d(:,72)');
nans.Dip3_z = isnan(output3d(:,73)');
nans.Dip3_error = isnan(output3d(:,74)');
nans.Dip3_ncams = isnan(output3d(:,75)');

nans.Dip4_x = isnan(output3d(:,76)');
nans.Dip4_y = isnan(output3d(:,77)');
nans.Dip4_z = isnan(output3d(:,78)');
nans.Dip4_error = isnan(output3d(:,79)');
nans.Dip4_ncams = isnan(output3d(:,80)');

nans.Tip_thumb_x = isnan(output3d(:,81)');
nans.Tip_thumb_y = isnan(output3d(:,82)');
nans.Tip_thumb_z = isnan(output3d(:,83)');
nans.Tip_thumb_error = isnan(output3d(:,84)');
nans.Tip_thumb_ncams = isnan(output3d(:,85)');

nans.Tip1_x = isnan(output3d(:,86)');
nans.Tip1_y = isnan(output3d(:,87)');
nans.Tip1_z = isnan(output3d(:,88)');
nans.Tip1_error = isnan(output3d(:,89)');
nans.Tip1_ncams = isnan(output3d(:,90)');

nans.Tip2_x = isnan(output3d(:,91)');
nans.Tip2_y = isnan(output3d(:,92)');
nans.Tip2_z = isnan(output3d(:,93)');
nans.Tip2_error = isnan(output3d(:,94)');
nans.Tip2_ncams = isnan(output3d(:,95)');

nans.Tip3_x = isnan(output3d(:,96)');
nans.Tip3_y = isnan(output3d(:,97)');
nans.Tip3_z = isnan(output3d(:,98)');
nans.Tip3_error = isnan(output3d(:,99)');
nans.Tip3_ncams = isnan(output3d(:,100)');

nans.Tip4_x = isnan(output3d(:,101)');
nans.Tip4_y = isnan(output3d(:,102)');
nans.Tip4_z = isnan(output3d(:,103)');
nans.Tip4_error = isnan(output3d(:,104)');
nans.Tip4_ncams = isnan(output3d(:,105)');

nans.fnum = isnan(output3d(:,106)');