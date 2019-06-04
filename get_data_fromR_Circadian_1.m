
% 
% data_from_R = load('/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/result_mat_circ_5days.mat');
% 
% [m,n] = size(data_from_R.data_circ_plot);
% 
% dd_1 =  data_from_R.data_circ_plot';
% 
% t_plot = [1:1:m];
% 
% figure
% y2_CC = mean(dd_1);
% z2_CC = std(dd_1)/sqrt (length(dd_1));
% errorbar(t_plot,y2_CC,z2_CC, 'b'); grid on;
% hold on
% y3_CC = mean (MCS_aux);
% z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
% errorbar (t_mcs, y3_CC,z3_CC, 'r'); grid on; 
% title( 'Control (blue) vs MCS (red)')
% ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
% xlabel('time (min)');

% MTN files

% MCS
clear all, close all, clc;
home = '/home/aldo/Documents/Projects/Avtivemeter/Data';
mcsp_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/'
mcsm_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/'
mcsast_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/'
file_mat_LS_circ_4d = 'result_LombScarge_circ_4days.mat'
cd(mcsp_folder)

%MCS+
file_w = strcat(mcsp_folder,file_mat_LS_circ_4d);
data_LS_mcsp_mtn = load(file_w)

dd_1 = data_LS_mcsp_mtn.data_LS;
t_plot = dd_1(:,1);

figure, plot(t_plot, dd_1(:,2));
hold on;

% MCS-
file_w = strcat(mcsm_folder,file_mat_LS_circ_4d);
data_LS_mcsm_mtn = load(file_w)

dd_1 = data_LS_mcsm_mtn.data_LS;
t_plot = dd_1(:,1);
plot(t_plot, dd_1(:,2));
hold on;

% MCS*
file_w = strcat(mcsast_folder,file_mat_LS_circ_4d);
data_LS_mcsast_mtn = load(file_w)

dd_1 = data_LS_mcsast_mtn.data_LS;
t_plot = dd_1(:,1);
plot(t_plot, dd_1(:,2));
hold on;

% UWS
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/'
file_mat_LS_circ_4d = 'result_LombScarge_circ_4days.mat'
cd(mcsp_folder)

%UWS
file_w = strcat(UWS_folder,file_mat_LS_circ_4d);
data_LS_UWS_mtn = load(file_w)

dd_1 = data_LS_UWS_mtn.data_LS;
t_plot = dd_1(:,1);

figure, plot(t_plot, dd_1(:,2));
hold on;


% AWD files

% MCS
clear all, close all, clc;
home = '/home/aldo/Documents/Projects/Avtivemeter/Data';
mcsp_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/'
mcsm_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/'
mcsast_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/'
file_mat_LS_circ_4d = 'result_LombScarge_circ_4days.mat'
cd(home)

%MCS+
file_w = strcat(mcsp_folder,file_mat_LS_circ_4d);
data_LS_mcsp_awd = load(file_w)

dd_1 = data_LS_mcsp_awd.data_LS;
t_plot = dd_1(:,1);

figure, plot(t_plot, dd_1(:,2));
hold on;

% MCS-
file_w = strcat(mcsm_folder,file_mat_LS_circ_4d);
data_LS_mcsm_awd = load(file_w)

dd_1 = data_LS_mcsm_awd.data_LS;
t_plot = dd_1(:,1);
plot(t_plot, dd_1(:,2));
hold on;

% MCS*
file_w = strcat(mcsast_folder,file_mat_LS_circ_4d);
data_LS_mcsast_awd = load(file_w)

dd_1 = data_LS_mcsast_awd.data_LS;
t_plot = dd_1(:,1);
plot(t_plot, dd_1(:,2));
hold on;

% UWS
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/'
file_mat_LS_circ_4d = 'result_LombScarge_circ_4days.mat'
cd(UWS_folder)

%UWS
file_w = strcat(UWS_folder,file_mat_LS_circ_4d);
data_LS_UWS_awd = load(file_w)

dd_1 = data_LS_UWS_awd.data_LS;
t_plot = dd_1(:,1);

figure, plot(t_plot, dd_1(:,2));
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MCS and UWS of MTN and AWD together    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
MCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/'
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/'
file_mat_LS_circ_4d = 'result_LombScarge_circ_4days.mat'
cd(UWS_folder)

%MCS
file_w = strcat(MCS_folder,file_mat_LS_circ_4d);
data_LS_MCS = load(file_w)

dd_1 = data_LS_MCS.data_LS;
t_plot = dd_1(:,1);

figure, plot(t_plot, dd_1(:,2));
hold on;

%UWS
file_w = strcat(UWS_folder,file_mat_LS_circ_4d);
data_LS_UWS = load(file_w)

dd_1 = data_LS_UWS.data_LS;
t_plot = dd_1(:,1);

plot(t_plot, dd_1(:,2));


% p-value

[h_right,p_right]=ttest2(data_LS_MCS.data_LS(:,2),data_LS_UWS.data_LS(:,2), 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(data_LS_MCS.data_LS(:,2),data_LS_UWS.data_LS(:,2), 0.05,'left') %p-value = 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MCS and UWS of MTN and AWD together    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
%% Circadian %%
%%%%%%%%%%%%%%%
clc, clear all, close all;
MCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/'
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/'
EMCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/EMCS/'
LIS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/LIS/'
Control_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/Control/'

file_mat_LS_circ_4d = 'result_LombScarge_circ_4days_2.mat'

%MCS
file_w = strcat(MCS_folder,file_mat_LS_circ_4d);
data_LS_MCS = load(file_w)

dd_1 = data_LS_MCS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);
y_MCS = y_plot;


figure
y2_CC = mean(y_plot,2);
z2_CC = std(y_plot,1,2)/sqrt (length(y_plot));
errorbar(t_plot(:,1)/60,y2_CC,z2_CC, 'b'); grid on;
%legend('MCS');
hold on



%UWS
file_w = strcat(UWS_folder,file_mat_LS_circ_4d);
data_LS_UWS = load(file_w)

dd_1 = data_LS_UWS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);
y_plot_UWS = y_plot;

y3_CC = mean(y_plot,2);
z3_CC = std (y_plot,1,2)/sqrt (length(y_plot));
errorbar (t_plot(:,1)/60, y3_CC,z3_CC, 'r'); grid on; 
title( 'Circadian - Lomb Scargle', 'FontSize',14,'FontWeight','bold','Color','k')
ylabel('Power', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (hours)','FontSize',14,'FontWeight','bold','Color','k')
%legend('UWS');
hold on;


%EMCS
file_w = strcat(EMCS_folder,file_mat_LS_circ_4d);
data_LS_EMCS = load(file_w)

dd_1 = data_LS_EMCS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);
y_MCS = y_plot;


y4_CC = mean(y_plot,2);
z4_CC = std(y_plot,1,2)/sqrt (length(y_plot));
errorbar(t_plot(:,1)/60,y4_CC,z4_CC, 'g'); grid on;
%legend('EMCS');
hold on

%LIS
file_w = strcat(LIS_folder,file_mat_LS_circ_4d);
data_LS_LIS = load(file_w)

dd_1 = data_LS_LIS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);
y_MCS = y_plot;


y5_CC = mean(y_plot,2);
z5_CC = std(y_plot,1,2)/sqrt (length(y_plot));
errorbar(t_plot(:,1)/60,y5_CC,z5_CC, 'k'); grid on;
%legend('LIS');
hold on


%Control
file_w = strcat(Control_folder,file_mat_LS_circ_4d);
data_LS_Control = load(file_w)

dd_1 = data_LS_Control.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);
y_MCS = y_plot;


y6_CC = mean(y_plot,2);
z6_CC = std(y_plot,1,2)/sqrt (length(y_plot));
errorbar(t_plot(:,1)/60,y6_CC,z6_CC, 'm'); grid on;
%legend('Control');


legend({'MCS', 'UWS', 'EMCS',  'LIS', 'CONTROL'});


% p-value

[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1



%%%%%%%%%%%%%%
%% Ultradian %%
%%%%%%%%%%%%%%%
MCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/'
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/'
file_mat_LS_circ_4d = 'result_LombScarge_ultra_4days_2.mat'
cd(UWS_folder)

%MCS
file_w = strcat(MCS_folder,file_mat_LS_circ_4d);
data_LS_MCS = load(file_w)

dd_1 = data_LS_MCS.data_LS;
t_plot = dd_1(:,1:2:end);

y_plot = dd_1(:,2:2:end);
y_MCS = y_plot;


figure
y2_CC = mean(y_plot,2);
z2_CC = std(y_plot,1,2)/sqrt (length(y_plot));
errorbar(t_plot(:,1),y2_CC,z2_CC, 'b'); grid on;
hold on


%UWS
file_w = strcat(UWS_folder,file_mat_LS_circ_4d);
data_LS_UWS = load(file_w)

dd_1 = data_LS_UWS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);
y_plot_UWS = y_plot;

y3_CC = mean(y_plot,2);
z3_CC = std (y_plot,1,2)/sqrt (length(y_plot));
errorbar (t_plot(:,1), y3_CC,z3_CC, 'r'); grid on; 
hold on;



title( 'Ultradian - Lomb Scargle : MCS (blue) vs UWS (red)', 'FontSize',14,'FontWeight','bold','Color','k')
ylabel('Power', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)','FontSize',14,'FontWeight','bold','Color','k')


% p-value

[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1



index_time = find(t_plot > 20 & t_plot < 90);

%%%%%%%%%%%%%%
%% Ultradian %%
%%%%%%%%%%%%%%%
MCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/'
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/'
EMCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/EMCS/'
LIS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/LIS/'
Control_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/Control/'

file_mat_LS_circ_4d = 'result_LombScarge_ultra_4days_2.mat'
%cd(UWS_folder)

%MCS
file_w = strcat(MCS_folder,file_mat_LS_circ_4d);
data_LS_MCS = load(file_w);

dd_1 = data_LS_MCS.data_LS;
t_plot = dd_1(:,1:2:end);

% getting the data to plot between to and tf

to = 120;
tf = 150;

index_t = find((t_plot(:,1) >to) & (t_plot(:,1) < tf));

y_plot = dd_1(:,2:2:end);

y_plot_idx = y_plot(index_t,:);
t_plot_idx = t_plot(index_t,1);


figure
y2_CC = mean(y_plot_idx,2);
z2_CC = std(y_plot_idx,1,2)/sqrt(length(y_plot_idx));
errorbar(t_plot_idx,y2_CC,z2_CC, 'b'); grid on;
hold on


%UWS
file_w = strcat(UWS_folder,file_mat_LS_circ_4d);
data_LS_UWS = load(file_w);

dd_1 = data_LS_UWS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);

% getting the data to plot between to and tf
index_t = find((t_plot(:,1) > to) & (t_plot(:,1) < tf));

y_plot_idx = y_plot(index_t,:);
t_plot_idx = t_plot(index_t,1);


y_plot_UWS = y_plot;

y3_CC = mean(y_plot_idx,2);
z3_CC = std (y_plot_idx,1,2)/sqrt (length(y_plot_idx));
errorbar (t_plot_idx, y3_CC,z3_CC, 'r'); grid on; 
title( 'Ultradian - Lomb Scargle : MCS (blue) vs UWS (red)', 'FontSize',14,'FontWeight','bold','Color','k')
ylabel('Power', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)','FontSize',14,'FontWeight','bold','Color','k')
hold on;

%EMCS
file_w = strcat(EMCS_folder,file_mat_LS_circ_4d);
data_LS_EMCS = load(file_w)

dd_1 = data_LS_EMCS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);


% getting the data to plot between to and tf
index_t = find((t_plot(:,1) > to) & (t_plot(:,1) < tf));

y_plot_idx = y_plot(index_t,:);
t_plot_idx = t_plot(index_t,1);

%figure;
y4_CC = mean(y_plot_idx,2);
z4_CC = std (y_plot_idx,1,2)/sqrt (length(y_plot_idx));
errorbar (t_plot_idx, y4_CC,z4_CC, 'g'); grid on; 
hold on;

%LIS
file_w = strcat(LIS_folder,file_mat_LS_circ_4d);
data_LS_LIS = load(file_w)

dd_1 = data_LS_LIS.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);


% getting the data to plot between to and tf
index_t = find((t_plot(:,1) > to) & (t_plot(:,1) < tf));

y_plot_idx = y_plot(index_t,:);
t_plot_idx = t_plot(index_t,1);


y5_CC = mean(y_plot_idx,2);
z5_CC = std (y_plot_idx,1,2)/sqrt (length(y_plot_idx));
errorbar (t_plot_idx, y4_CC,z4_CC, 'k'); grid on; 
hold on;

%Control
file_w = strcat(Control_folder,file_mat_LS_circ_4d);
data_LS_Control = load(file_w)

dd_1 = data_LS_Control.data_LS;
t_plot = dd_1(:,1:2:end);
y_plot = dd_1(:,2:2:end);


% getting the data to plot between to and tf
index_t = find((t_plot(:,1) > to) & (t_plot(:,1) < tf));

y_plot_idx = y_plot(index_t,:);
t_plot_idx = t_plot(index_t,1);


y6_CC = mean(y_plot_idx,2);
z6_CC = std (y_plot_idx,1,2)/sqrt (length(y_plot_idx));
errorbar (t_plot_idx, y4_CC,z4_CC, 'm'); grid on; 




% p-value

[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1





