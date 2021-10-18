function [x, y, z, change_indices] = find_nan_changes(data, joint_interested)

% Inputs: 
    % data: Raw 3D data, with or without extra columns removed
    % joint_interested:one of the strings listed here
% Outputs: 
    % x, y, and z column numbers for given joint
    % indices where data goes from a value to NaN or NaN to value
    
% For a given joint, x, y, and z all have the same NaN indices

if width(data) > 63
    data(:,[4,5,9,10,14,15,19,20,24,25,29,30,34,35,39,40,44,45,49,50,54,55,59,60,64,65,69,70,74,75,79,80,84,85,89,90,94,95,99,100,104,105,106]) = [];
end


switch joint_interested
    case 'Wrist'
        x=1;y=2;z=3;
    case 'CMC Thumb'
        x=4;y=5;z=6;
    case 'MCP Thumb'
        x=7;y=8;z=9;
    case 'MCP1'
        x=10;y=11;z=12;
    case 'MCP2'
        x=13;y=14;z=15;
    case 'MCP3'
        x=16;y=17;z=18;
    case 'MCP4'
        x=19;y=20;z=21;
    case 'IP Thumb'
        x=22;y=23;z=24;
    case 'PIP1'
        x=25;y=26;z=27;
    case 'PIP2'
        x=28;y=29;z=30;
    case 'PIP3'
        x=31;y=32;z=33;
    case 'PIP4'
        x=34;y=35;z=36;
    case 'DIP1'
        x=37;y=38;z=39;
    case 'DIP2'
        x=40;y=41;z=42;
    case 'DIP3'
        x=43;y=44;z=45;
    case 'DIP4'
        x=46;y=47;z=48;
    case 'Tip Thumb'
        x=49;y=50;z=51;
    case 'Tip1'
        x=52;y=53;z=54;
    case 'Tip2'
        x=55;y=56;z=57;
    case 'Tip3'
        x=58;y=59;z=60;
    case 'Tip4'
        x=61;y=62;z=63;
end

changes = diff(isnan(data));
change_indices = find(changes(:,x))+1;
