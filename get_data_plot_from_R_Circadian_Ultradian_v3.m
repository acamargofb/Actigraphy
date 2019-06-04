
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Circadian for MCS, UWS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


MCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/'
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/'
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

legend({'MCS', 'UWS'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')


% p-value
% MCS vs UWS
[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1


% In this part of the code, I create a table and save it in a mat file,
% than then I will read it in Python to create nice plots :)


% The form of the table will be 
% time MCS_power UWS_power

% table(:,1) = t_plot(:,1)/60;
% table(:,2) = y2_CC;
% table(:,3) = y3_CC;
% 
% save('MCS_UWS_LombScargle.mat', 'table');
% 
% load 'MCS_UWS_LombScargle.mat'


table_results.MCS(:,1) = t_plot(:,1)/60;
table_results.MCS(:,2) = y2_CC;
table_results.UWS(:,1) = t_plot(:,1)/60;
table_results.UWS(:,2) = y3_CC;

save('MCS_UWS_LombScargle.mat', 'table_results');

load 'MCS_UWS_LombScargle.mat'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ultradian for MCS, UWS%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc, clear all, close all;
MCS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/MCS/'
UWS_folder = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_AWD_Together/UWS/'

file_mat_LS_circ_4d = 'result_LombScarge_ultra_4days_2.mat'
%cd(UWS_folder)

%MCS
file_w = strcat(MCS_folder,file_mat_LS_circ_4d);
data_LS_MCS = load(file_w);

dd_1 = data_LS_MCS.data_LS;
t_plot = dd_1(:,1:2:end);

% getting the data to plot between to and tf
% The following range was selected based on the previous report of
% rhythmicity
to = 120; 
tf = 200;

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
title( 'Ultradian - Lomb Scargle', 'FontSize',14,'FontWeight','bold','Color','k')
ylabel('Power', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)','FontSize',14,'FontWeight','bold','Color','k')

legend({'MCS', 'UWS'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')


% p-value
% MCS vs UWS
[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1



table_results.MCS(:,1) = t_plot(:,1);
table_results.MCS(:,2) = y2_CC;
table_results.UWS(:,1) = t_plot(:,1);
table_results.UWS(:,2) = y3_CC;

save('MCS_UWS_LombScargle_ultradian.mat', 'table_results');

load 'MCS_UWS_LombScargle_ultradian.mat'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MCS and UWS of MTN and AWD together    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Circadian for MCS, UWS, EMCS, LIS, Control%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


legend({'MCS', 'UWS', 'EMCS',  'LIS', 'CONTROL'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')


% p-value
% MCS vs UWS
[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1


% Error bar plot
mean_values = [mean(y2_CC); % MCS
               mean(y3_CC); % UWS
               mean(y4_CC); % EMCS
               mean(y5_CC); % LIS
               mean(y6_CC)] ;% Control

stde_values = [std(y2_CC)/sqrt(length(y2_CC)); % MCS
                std(y3_CC)/sqrt(length(y3_CC)); % UWS
                std(y4_CC)/sqrt(length(y4_CC)); % EMCS
                std(y5_CC)/sqrt(length(y5_CC)); % LIS
                std(y6_CC)/sqrt(length(y6_CC))] ;% Control      
           


% errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS',  'UWS','EMCS', 'LIS', 'CONTROL'}, ...
%     'bar_width',0.75,'errorbar_width',0.5, ...
%      'optional_bar_arguments',{'LineWidth',1.5}, ...
%      'optional_errorbar_arguments',{'LineStyle','none','Marker','none','LineWidth',1.5});
% 
% ylim([0 240])
% 
% xlabel({'Circadian','(in minutes)'})
% legend('MCS', 'UWS');

%saving to a mat file
table_results.MCS(:,1) = t_plot(:,1);
table_results.MCS(:,2) = y2_CC;
table_results.UWS(:,1) = t_plot(:,1);
table_results.UWS(:,2) = y3_CC;
table_results.EMCS(:,1) = t_plot(:,1);
table_results.EMCS(:,2) = y4_CC;
table_results.LIS(:,1) = t_plot(:,1);
table_results.LIS(:,2) = y5_CC;
table_results.Control(:,1) = t_plot(:,1);
table_results.Control(:,2) = y6_CC;


save('MCS_UWS_all_LombScargle_circadian.mat', 'table_results');

%%%%%%%%%%%%%%
%% Ultradian %%
%%%%%%%%%%%%%%%
clc, clear all, close all;
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
% The following range was selected based on the previous report of
% rhythmicity
to = 120; 
tf = 200;

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
title( 'Ultradian - Lomb Scargle', 'FontSize',14,'FontWeight','bold','Color','k')
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
errorbar (t_plot_idx, y5_CC,z5_CC, 'k'); grid on; 
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
errorbar (t_plot_idx, y6_CC,z6_CC, 'm'); grid on; 


legend({'MCS', 'UWS', 'EMCS',  'LIS', 'CONTROL'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')

% p-value

% MCS vs UWS
[h_right,p_right]=ttest2(y2_CC,y3_CC, 0.05,'right') % p-value < 0.05
[h_left,p_left]=ttest2(y2_CC,y3_CC, 0.05,'left') %p-value = 1

%%%%


%saving to a mat file
table_results.MCS(:,1) = t_plot_idx;
table_results.MCS(:,2) = y2_CC;
table_results.UWS(:,1) = t_plot_idx;
table_results.UWS(:,2) = y3_CC;
table_results.EMCS(:,1) = t_plot_idx;
table_results.EMCS(:,2) = y4_CC;
table_results.LIS(:,1) = t_plot_idx;
table_results.LIS(:,2) = y5_CC;
table_results.Control(:,1) = t_plot_idx;
table_results.Control(:,2) = y6_CC;


save('MCS_UWS_all_LombScargle_ultradian.mat', 'table_results');

