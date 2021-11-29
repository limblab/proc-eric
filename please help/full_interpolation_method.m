function [train_error, test_error, train_recon, test_recon, explained, times] = full_interpolation_method(method,data,markers_to_drop,marker,num_pcs)         

%% Get frames to drop (mostly for subsampled data for PPCA/ALS time considerations)

frames_to_drop = frames2drop_full(data,markers_to_drop,10);

%% Insert NaNs

Input_full_test = data;
Input_full_test(frames_to_drop, marker) = NaN;

%% If doing SVD PCA, need to do linear interp on input first

if strcmp(method,'SVD');
    Input_full_test = fillmissing(data,'linear');
end

%% Split data into train and test sets

f2d_train = frames_to_drop(1:round(length(frames_to_drop)*0.95)); % 95% of dropped frames for training set
f2d_test = frames_to_drop(length(f2d_train)+1:end);

%split data that's being interpolated
train_data = Input_full_test;
train_data(f2d_test,:) = []; %remove test set
test_data = data(f2d_test,:);
test_data(isnan(test_data)) = 0; %Replace already-missing values to avoid a test error of NaN

%% Interpolate training data

tic

if strcmp(method, 'PPCA')
    [train_recon, coeff] = ppca_interpolation(Input_full_test, num_pcs);
    explained = [];
elseif strcmp(method, 'ALS')
    [train_recon, coeff, explained] = als_interpolation(train_data, num_pcs);
elseif strcmp(method, 'SVD')
    [train_recon, coeff, explained] = svd_interpolation(train_data, num_pcs);
end

times = toc;

%% Project test data into PC space and reproject

test_mu = nanmean(test_data);
test_score = (test_data - test_mu) * coeff;

test_recon = test_score * coeff' + repmat(test_mu,size(test_data,1),1);

%% Compute Errors

% first get indices of training set drops after test set is removed
fnum = [1:length(data)];
fnum(f2d_test) = [];
f2d_train_new = [];
for frame = 1:length(f2d_train)
    f2d_train_new(end+1) = find(fnum == f2d_train(frame));
end

% train error
train_before = data(f2d_train,marker);
dropped_train = train_recon(f2d_train_new,marker);
            
dont_include = isnan(train_before); %in case some of the randomly dropped markers were already missing
train_before = train_before(~dont_include);
dropped_train = dropped_train(~dont_include);
 
if sum(sum(isnan(dropped_train))) > 0 %ppca not interpolating long stretches of all markers dropped
    not_interpolated = isnan(dropped_train);
    train_before = train_before(~not_interpolated);
    dropped_train = dropped_train(~not_interpolated);
end
                
train_error = sum(abs(dropped_train - train_before)) / numel(dropped_train); %not Euclidean distanc

%test error
test_before = data(f2d_test,marker); 
dropped_test = test_recon(:,marker);

dont_include = isnan(test_before);  % this should've taken care of NaNs...weird
test_before = test_before(~dont_include);
dropped_test = dropped_test(~dont_include);

if sum(sum(isnan(dropped_test))) > 0
    not_interpolated = isnan(dropped_test);
    test_before = test_before(~not_interpolated);
    dropped_test = dropped_test(~not_interpolated);
end

test_error = sum(abs(dropped_test - test_before)) / numel(dropped_test);

