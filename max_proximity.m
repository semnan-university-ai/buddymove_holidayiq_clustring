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

% Max Proximity
Z = linkage(data,'average','chebychev');
T = cluster(Z,'maxclust',3);
cutoff = median([Z(end-2,3) Z(end-1,3)]);
dendrogram(Z,'ColorThreshold',cutoff)