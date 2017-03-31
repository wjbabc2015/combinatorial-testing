
%change file name based on the name of the real file
pre_file_name = "16-2 features 2-way 12 comb";
file_name = strcat(pre_file_name, '.csv');
org_feature_com = csvread(file_name);

%when there is index in csv file, change number 1 to 2
feature_com = org_feature_com(:,2:end);

load("experiment_data");

result = [org_feature_com, ones(size(feature_com, 1),1)];

for index = 1:size(feature_com,1)
	test_case = [1, feature_com(index,:) + 1];
	cross_validation_10_folder;
end

output_file_name = strcat(pre_file_name, ' result.csv');
csvwrite(output_file_name, result);