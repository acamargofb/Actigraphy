function activ_posprocessing(segment)

close all;

path_code = '/home/aldo/Documents/Projects/Avtivemeter/Data';

X_DFT = [];
X_DFT_emcs = [];
X_DFT_lis = [];
X_DFT_mcs = [];
X_DFT_mcs_p = [];
X_DFT_mcs_m = [];
X_DFT_uws = [];


if(strcmp(segment,'awd_files'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS*/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/';
    path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS*/';
    path_uws_non_TBI = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/NonTBI/';
    path_uws_TBI = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/TBI/';

elseif(strcmp(segment,'mtn_files'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/';
  %  path_uws_non_TBI = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/NonTBI/';
  %  path_uws_TBI = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/TBI/';
end


k = 30;   % average of 30 min 

  
cd(path_control);
SUBJlist_Control_MTN = dir('*_raw_.mat');

 for i = 1:length(SUBJlist_Control_MTN)
    SUBJname_Control_MTN = SUBJlist_Control_MTN(i).name;
    data=load(SUBJname_Control_MTN);
    Control_mtn_aux{i} = data.temp;
 end
 
cd(path_emcs);
SUBJlist_EMCS_MTN = dir('*_raw_.mat');

for i = 1:length(SUBJlist_EMCS_MTN)
    SUBJname_EMCS_MTN = SUBJlist_EMCS_MTN(i).name;
    data=load(SUBJname_EMCS_MTN);
    EMCS_mtn_aux{i} = data.temp;
end


cd(path_mcs);
SUBJlist_MCS_MTN = dir('*_raw_.mat');

for i = 1:length(SUBJlist_MCS_MTN)
    SUBJname_MCS_MTN = SUBJlist_MCS_MTN(i).name;
    data=load(SUBJname_MCS_MTN);
    MCS_mtn_aux{i} = data.temp;
end

cd(path_mcs_p);
SUBJlist_MCSp_MTN = dir('*_raw_.mat');

for i = 1:length(SUBJlist_MCSp_MTN)
    SUBJname_MCSp_MTN = SUBJlist_MCSp_MTN(i).name;
    data=load(SUBJname_MCSp_MTN);
    MCSp_mtn_aux{i} = data.temp;
end

cd(path_mcs_m);
SUBJlist_MCSm_MTN = dir('*_raw_.mat');

for i = 1:length(SUBJlist_MCSm_MTN)
    SUBJname_MCSm_MTN = SUBJlist_MCSm_MTN(i).name;
    data=load(SUBJname_MCSm_MTN);
    MCSm_mtn_aux{i} = data.temp;
end


cd(path_uws);
SUBJlist_UWS_MTN = dir('*_raw_.mat');

 for i = 1:length(SUBJlist_UWS_MTN)
    SUBJname_UWS_MTN = SUBJlist_UWS_MTN(i).name;
    data=load(SUBJname_UWS_MTN);
    UWS_mtn_aux{i} = data.temp;
 end
 
cd(path_code);

for ii = 1: length(Control_mtn_aux)

raw_data = Control_mtn_aux{ii};
%raw_data_mean = mean(raw_data);
fav_mean_raw_data(:,1) = act_mov_mean(raw_data(1,:),k);
fav_mean_raw_data(:,2) = act_mov_mean(raw_data(2,:),k);
fav_mean_raw_data(:,3) = act_mov_mean(raw_data(3,:),k);
fav_mean_raw_data(:,4) = act_mov_mean(raw_data(4,:),k);

X_ica = fav_mean_raw_data';

[weights,sphere] = runica(X_ica,'extended',1);
ica_raw_data = weights*sphere*(X_ica);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  DFT to find the periodicity   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The input signal is the ica of the raw%% 
%%% data(1 and 2 components)              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 1/60;  %% 1 min interval
X_fft = ica_raw_data(1,:)';  % choosing the first component of the ICA
abs_X_fft = abs(X_fft);
phase_X_fft = unwrap(angle(X_fft));

f = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector

% figure
% subplot(2,1,1)
% plot(f,abs_X_fft)
% title('Magnitude')
% ax = gca;
% ax.XTick = [10 40 70 90];
% 
% subplot(2,1,2)
% plot(f,phase_X_fft*180/pi)
% title('Phase')
% ax = gca;
% ax.XTick = [10 40 70 90];

X_DFT = [X_DFT; abs_X_fft'];

end

for ii = 1: length(EMCS_mtn_aux)

raw_data = EMCS_mtn_aux{ii};
%raw_data_mean = mean(raw_data);
fav_mean_raw_data(:,1) = act_mov_mean(raw_data(1,:),k);
fav_mean_raw_data(:,2) = act_mov_mean(raw_data(2,:),k);
fav_mean_raw_data(:,3) = act_mov_mean(raw_data(3,:),k);
fav_mean_raw_data(:,4) = act_mov_mean(raw_data(4,:),k);

X_ica = fav_mean_raw_data';

[weights,sphere] = runica(X_ica,'extended',1);
ica_raw_data = weights*sphere*(X_ica);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  DFT to find the periodicity   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The input signal is the ica of the raw%% 
%%% data(1 and 2 components)              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 1/60;  %% 1 min interval
X_fft = ica_raw_data(1,:)';  % choosing the first component of the ICA
abs_X_fft = abs(X_fft);
phase_X_fft = unwrap(angle(X_fft));

f = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector

% figure
% subplot(2,1,1)
% plot(f,abs_X_fft)
% title('Magnitude')
% ax = gca;
% ax.XTick = [10 40 70 90];
% 
% subplot(2,1,2)
% plot(f,phase_X_fft*180/pi)
% title('Phase')
% ax = gca;
% ax.XTick = [10 40 70 90];

X_DFT_emcs = [X_DFT_emcs; abs_X_fft'];

end

%for ii = 1: length(MCS_mtn_aux)
for ii = 1: 15    
ii
raw_data = MCS_mtn_aux{ii};
%raw_data_mean = mean(raw_data);
fav_mean_raw_data(:,1) = act_mov_mean(raw_data(1,:),k);
fav_mean_raw_data(:,2) = act_mov_mean(raw_data(2,:),k);
fav_mean_raw_data(:,3) = act_mov_mean(raw_data(3,:),k);
fav_mean_raw_data(:,4) = act_mov_mean(raw_data(4,:),k);

X_ica = fav_mean_raw_data';

[weights,sphere] = runica(X_ica,'extended',1);
ica_raw_data = weights*sphere*(X_ica);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  DFT to find the periodicity   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The input signal is the ica of the raw%% 
%%% data(1 and 2 components)              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 1/60;  %% 1 min interval
X_fft = ica_raw_data(1,:)';  % choosing the first component of the ICA
abs_X_fft = abs(X_fft);
phase_X_fft = unwrap(angle(X_fft));

f = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector

% figure
% subplot(2,1,1)
% plot(f,abs_X_fft)
% title('Magnitude')
% ax = gca;
% ax.XTick = [10 40 70 90];
% 
% subplot(2,1,2)
% plot(f,phase_X_fft*180/pi)
% title('Phase')
% ax = gca;
% ax.XTick = [10 40 70 90];

X_DFT_mcs = [X_DFT_mcs; abs_X_fft'];

end

for ii = 1: length(UWS_mtn_aux)

raw_data = UWS_mtn_aux{ii};
%raw_data_mean = mean(raw_data);
fav_mean_raw_data(:,1) = act_mov_mean(raw_data(1,:),k);
fav_mean_raw_data(:,2) = act_mov_mean(raw_data(2,:),k);
fav_mean_raw_data(:,3) = act_mov_mean(raw_data(3,:),k);
fav_mean_raw_data(:,4) = act_mov_mean(raw_data(4,:),k);

X_ica = fav_mean_raw_data';

[weights,sphere] = runica(X_ica,'extended',1);
ica_raw_data = weights*sphere*(X_ica);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  DFT to find the periodicity   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The input signal is the ica of the raw%% 
%%% data(1 and 2 components)              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 1/60;  %% 1 min interval
X_fft = ica_raw_data(1,:)';  % choosing the first component of the ICA
abs_X_fft = abs(X_fft);
phase_X_fft = unwrap(angle(X_fft));

f_uws = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector


X_DFT_uws = [X_DFT_uws; abs_X_fft'];

end



 % Control - EMCS
 figure
 y2_CC = mean(X_DFT);
 z2_CC = std(X_DFT)/sqrt(length(X_DFT));
 errorbar(f,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(X_DFT_emcs);
 z3_CC = std (X_DFT_emcs)/sqrt (length(X_DFT_emcs));
 errorbar (f, y3_CC,z3_CC, 'r'); grid on; 
 title( 'DFT of Control (blue) vs EMCS (red) on mtn files')
 ylabel('DFT (Abs of the Magnitude)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('frecuency (Hz)');


 % Controls - MCS
 figure
 y2_CC = mean(X_DFT);
 z2_CC = std(X_DFT)/sqrt(length(X_DFT));
 errorbar(f,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(X_DFT_mcs);
 z3_CC = std (X_DFT_mcs)/sqrt (length(X_DFT_mcs));
 errorbar (f, y3_CC,z3_CC, 'r'); grid on; 
 title( 'DFT of Control (blue) vs MCS (red) on mtn files')
 ylabel('DFT (Abs of the Magnitude)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('frecuency (Hz)');
 
 
 
% Controls - UWS
 figure
 y2_CC = mean(X_DFT);
 z2_CC = std(X_DFT)/sqrt(length(X_DFT));
 errorbar(f,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(X_DFT_uws);
 z3_CC = std (X_DFT_uws)/sqrt (length(X_DFT_uws));
 errorbar (f, y3_CC,z3_CC, 'r'); grid on; 
 title( 'DFT of Control (blue) vs UWS (red) on mtn files')
 ylabel('DFT (Abs of the Magnitude)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('frecuency (Hz)');
 
 %[h_Controls_aux,p_Controls_aux] = ttest2(Control_mtn_aux,Control_awd_aux,0.05)


 

