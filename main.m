
%change file name based on the name of the real file
file_name = "test_case.csv";
org_feature_com = csvread(file_name);

%when there is index in csv file, change number 1 to 2
feature_com = org_feature_com(:,1:end);

load("experiment_data");

result = [org_feature_com, ones(size(feature_com, 1),1)];

for index = 1:size(feature_com,1)
	test_case = [1, feature_com(index,:) + 1];
	cross_validation_10_folder;
end

csvwrite("result.csv", result);