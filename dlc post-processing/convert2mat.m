function output3ddata = convert2mat(output3d)
% For converting 3D data from double format to a struct for FIU

output3ddata = struct();

output3ddata.Wrist_x = output3d(:,1)';
output3ddata.Wrist_y = output3d(:,2)';
output3ddata.Wrist_z = output3d(:,3)';
output3ddata.Wrist_error = output3d(:,4)';
output3ddata.Wrist_ncams = output3d(:,5)';

output3ddata.CMC_thumb_x = output3d(:,6)';
output3ddata.CMC_thumb_y = output3d(:,7)';
output3ddata.CMC_thumb_z = output3d(:,8)';
output3ddata.CMC_thumb_error = output3d(:,9)';
output3ddata.CMC_thumb_ncams = output3d(:,10)';

output3ddata.MCP_thumb_x = output3d(:,11)';
output3ddata.MCP_thumb_y = output3d(:,12)';
output3ddata.MCP_thumb_z = output3d(:,13)';
output3ddata.MCP_thumb_error = output3d(:,14)';
output3ddata.MCP_thumb_ncams = output3d(:,15)';

output3ddata.MCP1_x = output3d(:,16)';
output3ddata.MCP1_y = output3d(:,17)';
output3ddata.MCP1_z = output3d(:,18)';
output3ddata.MCP1_error = output3d(:,19)';
output3ddata.MCP1_ncams = output3d(:,20)';

output3ddata.MCP2_x = output3d(:,21)';
output3ddata.MCP2_y = output3d(:,22)';
output3ddata.MCP2_z = output3d(:,23)';
output3ddata.MCP2_error = output3d(:,24)';
output3ddata.MCP2_ncams = output3d(:,25)';

output3ddata.MCP3_x = output3d(:,26)';
output3ddata.MCP3_y = output3d(:,27)';
output3ddata.MCP3_z = output3d(:,28)';
output3ddata.MCP3_error = output3d(:,29)';
output3ddata.MCP3_ncams = output3d(:,30)';

output3ddata.MCP4_x = output3d(:,31)';
output3ddata.MCP4_y = output3d(:,32)';
output3ddata.MCP4_z = output3d(:,33)';
output3ddata.MCP4_error = output3d(:,34)';
output3ddata.MCP4_ncams = output3d(:,35)';

output3ddata.IP_thumb_x = output3d(:,36)';
output3ddata.IP_thumb_y = output3d(:,37)';
output3ddata.IP_thumb_z = output3d(:,38)';
output3ddata.IP_thumb_error = output3d(:,39)';
output3ddata.IP_thumb_ncams = output3d(:,40)';

output3ddata.PIP1_x = output3d(:,41)';
output3ddata.PIP1_y = output3d(:,42)';
output3ddata.PIP1_z = output3d(:,43)';
output3ddata.PIP1_error = output3d(:,44)';
output3ddata.PIP1_ncams = output3d(:,45)';

output3ddata.PIP2_x = output3d(:,46)';
output3ddata.PIP2_y = output3d(:,47)';
output3ddata.PIP2_z = output3d(:,48)';
output3ddata.PIP2_error = output3d(:,49)';
output3ddata.PIP2_ncams = output3d(:,50)';

output3ddata.PIP3_x = output3d(:,51)';
output3ddata.PIP3_y = output3d(:,52)';
output3ddata.PIP3_z = output3d(:,53)';
output3ddata.PIP3_error = output3d(:,54)';
output3ddata.PIP3_ncams = output3d(:,55)';

output3ddata.PIP4_x = output3d(:,56)';
output3ddata.PIP4_y = output3d(:,57)';
output3ddata.PIP4_z = output3d(:,58)';
output3ddata.PIP4_error = output3d(:,59)';
output3ddata.PIP4_ncams = output3d(:,60)';

output3ddata.Dip1_x = output3d(:,61)';
output3ddata.Dip1_y = output3d(:,62)';
output3ddata.Dip1_z = output3d(:,63)';
output3ddata.Dip1_error = output3d(:,64)';
output3ddata.Dip1_ncams = output3d(:,65)';

output3ddata.Dip2_x = output3d(:,66)';
output3ddata.Dip2_y = output3d(:,67)';
output3ddata.Dip2_z = output3d(:,68)';
output3ddata.Dip2_error = output3d(:,69)';
output3ddata.Dip2_ncams = output3d(:,70)';

output3ddata.Dip3_x = output3d(:,71)';
output3ddata.Dip3_y = output3d(:,72)';
output3ddata.Dip3_z = output3d(:,73)';
output3ddata.Dip3_error = output3d(:,74)';
output3ddata.Dip3_ncams = output3d(:,75)';

output3ddata.Dip4_x = output3d(:,76)';
output3ddata.Dip4_y = output3d(:,77)';
output3ddata.Dip4_z = output3d(:,78)';
output3ddata.Dip4_error = output3d(:,79)';
output3ddata.Dip4_ncams = output3d(:,80)';

output3ddata.Tip_thumb_x = output3d(:,81)';
output3ddata.Tip_thumb_y = output3d(:,82)';
output3ddata.Tip_thumb_z = output3d(:,83)';
output3ddata.Tip_thumb_error = output3d(:,84)';
output3ddata.Tip_thumb_ncams = output3d(:,85)';

output3ddata.Tip1_x = output3d(:,86)';
output3ddata.Tip1_y = output3d(:,87)';
output3ddata.Tip1_z = output3d(:,88)';
output3ddata.Tip1_error = output3d(:,89)';
output3ddata.Tip1_ncams = output3d(:,90)';

output3ddata.Tip2_x = output3d(:,91)';
output3ddata.Tip2_y = output3d(:,92)';
output3ddata.Tip2_z = output3d(:,93)';
output3ddata.Tip2_error = output3d(:,94)';
output3ddata.Tip2_ncams = output3d(:,95)';

output3ddata.Tip3_x = output3d(:,96)';
output3ddata.Tip3_y = output3d(:,97)';
output3ddata.Tip3_z = output3d(:,98)';
output3ddata.Tip3_error = output3d(:,99)';
output3ddata.Tip3_ncams = output3d(:,100)';

output3ddata.Tip4_x = output3d(:,101)';
output3ddata.Tip4_y = output3d(:,102)';
output3ddata.Tip4_z = output3d(:,103)';
output3ddata.Tip4_error = output3d(:,104)';
output3ddata.Tip4_ncams = output3d(:,105)';

output3ddata.fnum = output3d(:,106)';