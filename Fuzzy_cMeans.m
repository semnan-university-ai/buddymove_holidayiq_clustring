clc;
clear;
close all;

% Amir Shokri
% amirsh.nll@gmail.com
% amirshnll.ir
% github.com/amirshnll
% July 2020

% Load Data
dataFile = importdata('buddymove_holidayiq.csv');
data = dataFile.data;
textdata = dataFile.textdata;
colheaders = dataFile.colheaders;

% Data Normalized
data_normal = normalize(data,'range');

% Fuzzy c-Means Algorithm 
options_fcm = [2 100 0.00001 false];
cluster_size = 5;
[C_fcm,U_fcm] = fcm(data,cluster_size,options_fcm);
maxU_fcm = max(U_fcm);
index_fcm = cell(cluster_size,1);
for i=1:cluster_size
    index_fcm{i} = find(U_fcm(i,:) == maxU_fcm);
end
figure
hold on
for i=1:cluster_size
    plot(dataset(index_fcm{i},1),dataset(index_fcm{i},2),'o')
    plot(C_fcm(i,1),C_fcm(i,2),'x','MarkerSize',15,'LineWidth',2)
end
hold off