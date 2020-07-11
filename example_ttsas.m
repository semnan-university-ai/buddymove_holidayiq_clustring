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

% TTSAS Algorithm 
theta1 = 2.2; 
theta2 = 4;
TTSAS_labels = TTSAS(data,theta1,theta2);
figure, scatter( data(:,1), data(:,2), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,1), data(:,3), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,1), data(:,4), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,1), data(:,5), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,1), data(:,6), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,2), data(:,3), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,2), data(:,4), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,2), data(:,5), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,2), data(:,6), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,3), data(:,4), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,3), data(:,5), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,3), data(:,6), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,4), data(:,5), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,4), data(:,6), 5, TTSAS_labels, 'filled' );
figure, scatter( data(:,5), data(:,6), 5, TTSAS_labels, 'filled' );