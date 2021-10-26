% to set up duct acoustic configuration
% This script sets up duct acoustic based on the data of microphone with 48 channel 3 planes.
% Written by Jiaqi Wang
% 10/26/2020

%%
clc, close all, clear all,

%% 
MICROPHONE = struct('loc', [], 'spc', '');

%% MICROPHONE Configuration # 1
load('Resource/mics_loc.mat')
microphone.spc = 'DcutTest-48';
microphone.loc = mics_loc;
MICROPHONE(1)  = microphone;
mic_save   = mics_loc.';
save(['Resource/' microphone.spc '.txt'], 'mic_save', '-ASCII');
figure, scatter3(microphone.loc(1, :).*cos(microphone.loc(2, :)), microphone.loc(1, :).*sin(microphone.loc(2, :)), microphone.loc(3, :), 'o')



%%
save('Resource/MICROPHONE', 'MICROPHONE')
