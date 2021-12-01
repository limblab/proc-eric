function [train_error, test_error] = pca_cross_validate(method,max_k,data_full,frames_to_drop,marker,num_pcs)         

Input_full_test = data_full;
Input_full_test(frames_to_drop, marker) = NaN;

%% If doing SVD PCA, need to do linear interp on input first

if strcmp(method,'SVD');
    Input_full_test = fillmissing(data_full,'linear');
end
    
%% Split data into train and test sets
train_error = zeros(1,max_k);
test_error = zeros(1,max_k);

for k = 1:max_k
    if k == 1;
        f2d_test = frames_to_drop(1:round(length(frames_to_drop)/max_k));
        f2d_train = frames_to_drop(round(length(frames_to_drop)/max_k)+1:end);
    elseif k == max_k;
        f2d_test = frames_to_drop(((k-1)*round(length(frames_to_drop)/max_k)+1):end);
        f2d_train = frames_to_drop(1:((k-1)*round(length(frames_to_drop)/max_k)));
    else
        f2d_test = frames_to_drop(((k-1)*round(length(frames_to_drop)/max_k):k*round(length(frames_to_drop)/max_k))); % 100/max_k % of data for test
        f2d_train = [frames_to_drop(1:((k-1)*round(length(frames_to_drop)/max_k))-1), frames_to_drop(k*round(length(frames_to_drop)/max_k)+1:end)]; % 95% of dropped frames for training set for max_k=20
    end

%split data that's being interpolated
train_data = Input_full_test;
train_data(f2d_test,:) = []; %remove test set
test_data = Input_full_test(f2d_test,:);

%% Interpolate training data

tic

if strcmp(method, 'PPCA')
    [train_recon, coeff] = ppca_interpolation(Input_full_test, num_pcs);
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
fnum = [1:length(data_full)];
fnum(f2d_test) = [];
f2d_train_new = [];
for frame = 1:length(f2d_train)
    f2d_train_new(end+1) = find(fnum == f2d_train(frame));
end

% train error
train_before = data_full(f2d_train,marker);
dropped_train = train_recon(f2d_train_new,marker);
            
dont_include = isnan(train_before); %in case some of the randomly dropped markers were already missing
train_before = train_before(~dont_include);
dropped_train = dropped_train(~dont_include);
 
if sum(sum(isnan(dropped_train))) > 0 %ppca not interpolating long stretches of all markers dropped
    not_interpolated = isnan(dropped_train);
    train_before = train_before(~not_interpolated);
    dropped_train = dropped_train(~not_interpolated);
end
                
train_error(k) = sum(abs(dropped_train - train_before)) / numel(dropped_train); %not Euclidean distanc

%test error
test_before = data_full(f2d_test,marker); 
dropped_test = test_recon(:,marker);

dont_include = isnan(test_before);
test_before = test_before(~dont_include);
dropped_test = dropped_test(~dont_include);

if sum(sum(isnan(dropped_test))) > 0
    not_interpolated = isnan(dropped_test);
    test_before = test_before(~not_interpolated);
    dropped_test = dropped_test(~not_interpolated);
end

test_error(k) = sum(abs(dropped_test - test_before)) / numel(dropped_test);

end

%% average errors
train_error = mean(train_error);
test_error = mean(test_error);
