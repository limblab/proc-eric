function [train_error, test_error, train_recon, test_recon, explained, times, f2d_train, train_ind] = full_interpolation_method(method,data,markers_to_drop,marker,num_pcs)         

%% Pre-processing

fnum = data(:,64);
data = data(:,1:63);

%% Split data into train and test sets

%shuffle indices and select 95% to train PCA on
shuffle_ind = randperm(length(data))';
train_ind = shuffle_ind(1:round(length(shuffle_ind)*0.95));
test_ind = shuffle_ind(length(train_ind)+1:end);

%f2d_test = f2d_new(1:round(length(f2d_new)*0.05)); % 5% of dropped frames for test set
%f2d_train = f2d_new(length(f2d_test)+1:end);
%split data that's being interpolated

train_data = data(train_ind,:);
test_data = data(test_ind,:); %this is very problematic

%% Drop frames from train set

f2d_train = frames2drop_full(train_data,markers_to_drop,10); % 10% of train set gets extra drops
train_drop = train_data;
train_drop(f2d_train, marker) = NaN;

%% If doing SVD PCA, need to do linear interp on input first

if strcmp(method,'SVD');
    data = fillmissing(data,'linear');
    train_drop = data(train_ind, :);
end

%% Interpolate training data

tic

if strcmp(method, 'PPCA')
    [train_recon, coeff] = ppca_interpolation(train_drop, num_pcs);
    explained = [];
elseif strcmp(method, 'ALS')
    [train_recon, coeff, explained] = als_interpolation(train_drop, num_pcs);
elseif strcmp(method, 'SVD')
    [train_recon, coeff, explained] = svd_interpolation(train_drop, num_pcs);
end

times = toc;

%% Project test data into PC space and reproject

test_mu = nanmean(test_data); %more accurate to get mean before replacing with 0

test_data_nomean = test_data - test_mu;
%test_data(isnan(test_data)) = 0;
test_data_nomean(isnan(test_data_nomean)) = 0; %Replace already-missing values to avoid a test error of NaN
test_score = test_data_nomean * coeff; 

test_recon = test_score * coeff' + repmat(test_mu,size(test_data,1),1);

%% Compute Errors

% train error
train_before = train_data(f2d_train,marker);
dropped_train = train_recon(f2d_train,marker);

dont_include = isnan(train_before); %in case some of the randomly dropped markers were already missing
train_before = train_before(~dont_include);
dropped_train = dropped_train(~dont_include);
                
train_error = sum(abs(dropped_train - train_before)) / numel(dropped_train); %not Euclidean distanc

%test error
test_before = test_data(:,marker); 
dropped_test = test_recon(:,marker);

dont_include = isnan(test_before);  % this should've taken care of NaNs...weird
test_before = test_before(~dont_include);
dropped_test = dropped_test(~dont_include);

test_error = sum(abs(dropped_test - test_before)) / numel(dropped_test);

