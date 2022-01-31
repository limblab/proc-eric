%% Load in session data
data_table = readtable('/Users/ercrg/LimbLab/data/Pop_18E3/FIU Datashare/20211105/106/output_3d_data.csv');%select dataset to analyze
names = data_table.Properties.VariableNames;
ncam_columns  = ~cellfun('isempty',strfind(names,'ncams'));


ncams = table2array(data_table(:,ncam_columns));
ncams= ncams(~isnan(ncams));
ncams = ncams - 2;

sum(ncams)