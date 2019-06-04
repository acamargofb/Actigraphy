function Actigraphy_Stats_v2_5(segment)

clc
% clear all
close all

% segment = 'mtn_files'

path_code = '/home/aldo/Documents/Projects/Avtivemeter/Data';

if(strcmp(segment,'morning'))
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

 elseif(strcmp(segment,'se_morning_awd'))
    
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_morning/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_morning/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_morning/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_morning/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_morning/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_morning/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_morning/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_morning/';
    path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_morning/';
          
 elseif(strcmp(segment,'se_morning_mtn'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_morning/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_morning/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_morning/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_morning/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_morning/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_morning/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_morning/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_morning/';
    
elseif(strcmp(segment,'se_wholeday_awd'))
    
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_whole_day/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_whole_day/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_whole_day/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_whole_day/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day/';
    path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_whole_day/';
    
    plot_statistics_awd(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws, path_uws_ast);
          
 elseif(strcmp(segment,'se_wholeday_mtn'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_whole_day/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_whole_day/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_whole_day/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day/';     
 
    plot_statistics_mtn(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws);
    
elseif(strcmp(segment,'control_comparison'))
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/';
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/';
  
  
elseif(strcmp(segment,'night'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/Controls/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/EMCS/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS+/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS-/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS*/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/UWS/';
    path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/UWS*/';

elseif(strcmp(segment,'allday'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/Controls/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/EMCS/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS+/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS-/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS*/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/UWS/';
    path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/UWS*/';
    
else
      fprintf(1,'\n I do not recognize that segment sorry \n' )
end
%%%%%% Import data for Group 1: Controls


plot_statistics_awd(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws, path_uws_ast);

plot_statistics_mtn(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws);

if(strcmp(segment,'morning'))
 cd(path_control);
 SUBJlist_Control = dir('*.mat');

 for i = 1:length(SUBJlist_Control)
    SUBJname_Control = SUBJlist_Control(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_Control);
    Control_aux(i,:,:) = data.aux;
 end
 t_control = data.time;
% figure
% plot(t_control, Control_aux');


%%%%%% Import data for Group 2: EMCSs

 cd(path_emcs);
 SUBJlist_EMCS = dir('EMC*.mat');

 for i = 1:length(SUBJlist_EMCS)
    SUBJname_EMCS = SUBJlist_EMCS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_EMCS);
    EMCS_aux(i,:,:) = data.aux;
 end
 t_emcs = data.time;
% figure
% plot(t_emc,EMCS_aux');


%%%%%% Import data for Group 2-b: LIS

 cd(path_lis);
 SUBJlist_LIS = dir('LIS*.mat');

 for i = 1:length(SUBJlist_LIS)
    SUBJname_LIS = SUBJlist_LIS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_LIS);
    LIS_aux(i,:,:) = data.aux;
 end
 t_lis = data.time;



%%%%%% import data for group 3: MCS-

 cd(path_mcs_m);
 SUBJlist_MCS_m = dir('MCS_m_*.mat');

 for i = 1:length(SUBJlist_MCS_m)
    SUBJname_MCS_m = SUBJlist_MCS_m(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_m);
    MCS_m_aux(i,:,:) = data.aux;

 end
 t_mcs_m = data.time;
% figure
% plot(t_mcs_m,MCS_m_aux');



%%%%%% import data for group 4: MCS+



 cd(path_mcs_p);
 SUBJlist_MCS_p = dir('MCS_p_*.mat');

 for i = 1:length(SUBJlist_MCS_p)
    SUBJname_MCS_p = SUBJlist_MCS_p(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_p);
    MCS_p_aux(i,:,:) = data.aux;

 end

 t_mcs_p = data.time;
% figure
% plot(t_mcs_p,MCS_p_aux');

%%%%%% import data for group 4-b: MCS*



 cd(path_mcs_ast);
 SUBJlist_MCS_p = dir('MCS_ast_*.mat');

 for i = 1:length(SUBJlist_MCS_p)
    SUBJname_MCS_p = SUBJlist_MCS_p(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_p);
    MCS_ast_aux(i,:,:) = data.aux;

 end

 t_mcs_ast = data.time;
% figure
% plot(t_mcs_ast,MCS_ast_aux');


%%%%%% import data for group 4-c: MCS+, MCS* and MCS-



 cd(path_mcs);
 SUBJlist_MCS = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS)
    SUBJname_MCS = SUBJlist_MCS(i).name;
    data=load(SUBJname_MCS);
    MCS_aux(i,:,:) = data.aux;

 end

 t_mcs = data.time;
% figure
% plot(t_mcs,MCS_aux');


%%%%%% import data for group 5: UWS


 cd(path_uws);
 SUBJlist_UWS = dir('UWS_*.mat');

 for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
    UWS_aux(i,:,:) = data.aux;

 end
 t_uws = data.time;
% figure
% plot(t_uws,UWS_aux');


 cd(path_code);

% Creating data for the tables 

% Control
 mean_control = mean(mean(Control_aux))
 std_control = std(mean(Control_aux))

% EMCS
 mean_EMCS = mean(mean(EMCS_aux))
 std_EMCS = std(mean(EMCS_aux))

% LIS
 mean_LIS = mean(mean(LIS_aux))
 std_LIS = std(mean(LIS_aux))

% MCS
 mean_MCS = mean(mean(MCS_aux))
 std_MCS = std(mean(MCS_aux))

% MCS+
 mean_MCSp = mean(mean(MCS_p_aux))
 std_MCSp = std(mean(MCS_p_aux))

% MCS-
 mean_MCSm = mean(mean(MCS_m_aux))
 std_MCSm = std(mean(MCS_m_aux))


% MCS*
 mean_MCS_ast = mean(mean(MCS_ast_aux))
 std_MCS_ast = std(mean(MCS_ast_aux))


% UWS
 mean_UWS = mean(mean(UWS_aux))
 std_UWS = std(mean(UWS_aux))




%%%  Statistics of Group Comparison:
cd(path_code);

[Cohens_d_control_EMCS, effect_size_r_control_EMCS] = effect_size(mean_control, mean_EMCS, std_control, std_EMCS)
[Cohens_d_control_LIS, effect_size_r_control_LIS] = effect_size(mean_control, mean_LIS, std_control, std_LIS)
[Cohens_d_control_MCS, effect_size_r_control_MCS] = effect_size(mean_control, mean_MCS, std_control, std_MCS)
[Cohens_d_control_MCS_p, effect_size_r_control_MCS_p] = effect_size(mean_control, mean_MCSp, std_control, std_MCSp)
[Cohens_d_control_MCS_m, effect_size_r_control_MCS_m] = effect_size(mean_control, mean_MCSm, std_control, std_MCSm)
[Cohens_d_control_MCS_ast, effect_size_r_control_MCS_ast] = effect_size(mean_control, mean_MCS_ast, std_control, std_MCS_ast)
[Cohens_d_control_UWS, effect_size_r_control_UWS] = effect_size(mean_control, mean_UWS, std_control, std_UWS)

%% Computing the area under the curve and the statistics for it
%
%
% AUC: Area Under the Curve or tpz
%
% 
%%%%%%%%%%%%



tpz_Control = trapz(Control_aux)/length(Control_aux);
tpz_EMCS = trapz(EMCS_aux)/length(EMCS_aux);
tpz_LIS = trapz(LIS_aux)/length(LIS_aux);
tpz_MCS = trapz(MCS_aux)/length(MCS_aux);
tpz_MCS_p = trapz(MCS_p_aux)/length(MCS_p_aux);
tpz_MCS_m = trapz(MCS_m_aux)/length(MCS_m_aux);
tpz_MCS_a = trapz(MCS_ast_aux)/length(MCS_ast_aux);
tpz_UWS = trapz(UWS_aux)/length(UWS_aux);



tpz_mean_Control = mean(tpz_Control);
tpz_mean_EMCS = mean(tpz_EMCS);
tpz_mean_LIS = mean(tpz_LIS);
tpz_mean_MCS = mean(tpz_MCS);
tpz_mean_MCS_p = mean(tpz_MCS_p);
tpz_mean_MCS_m = mean(tpz_MCS_m);
tpz_mean_MCS_a = mean(tpz_MCS_a);
tpz_mean_UWS =  mean(tpz_UWS);


tpz_STD_Control = std(tpz_Control);
tpz_STD_EMCS = std(tpz_EMCS);
tpz_STD_LIS = std(tpz_LIS);
tpz_STD_MCS = std(tpz_MCS);
tpz_STD_MCS_p = std(tpz_MCS_p);
tpz_STD_MCS_m = std(tpz_MCS_m);
tpz_STD_MCS_a = std(tpz_MCS_a);
tpz_STD_UWS =  std(tpz_UWS);


[h,p_conVSemcs]=ttest2(tpz_Control,tpz_EMCS, 0.05,'left');
[h,p_conVSlis]=ttest2(tpz_Control,tpz_LIS, 0.05,'left');
[h,p_conVSmcs]=ttest2(tpz_Control,tpz_MCS, 0.05,'left');
[h,p_conVSmcs_p]=ttest2(tpz_Control,tpz_MCS_p, 0.05,'left');
[h,p_conVSmcs_m]=ttest2(tpz_Control,tpz_MCS_m, 0.05,'left');
[h,p_conVSmcs_a]=ttest2(tpz_Control,tpz_MCS_a, 0.05,'right');
[h,p_conVSuws]=ttest2(tpz_Control,tpz_UWS, 0.05,'left');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Ploting 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (EMCS_aux);
%y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
z3_CC = std (EMCS_aux)/sqrt (length(EMCS_aux));
errorbar (t_emcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs EMCS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


% Statastical difference between Control and EMCS

[h_EMCS_aux,p_EMCS_aux] = ttest2(Control_aux,EMCS_aux,0.05)

% LIS
figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (LIS_aux);
z3_CC = std (LIS_aux)/sqrt (length(LIS_aux));
errorbar (t_lis, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs LIS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


% Statastical difference between Control and LIS

[h_LIS_aux,p_LIS_aux] = ttest2(Control_aux,LIS_aux,0.05)


% Statastical difference between  Control and MCS-

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_m_aux);
z3_CC = std (MCS_m_aux)/sqrt (length(MCS_m_aux));
errorbar (t_mcs_m, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS-')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_m_aux,p_MCS_m_aux] = ttest2(Control_aux,MCS_m_aux,0.05)



% Statastical difference between t Control and MCS+


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_p_aux);
z3_CC = std (MCS_p_aux)/sqrt (length(MCS_p_aux));
errorbar (t_mcs_p, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS+')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');




[h_MCS_p_aux,p_MCS_p_aux] = ttest2(Control_aux,MCS_p_aux,0.05)



% Statastical difference between t Control and MCS*


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_ast_aux);
z3_CC = std (MCS_ast_aux)/sqrt (length(MCS_ast_aux));
errorbar (t_mcs_ast, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS*')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_ast_aux,p_MCS_ast_aux] = ttest2(Control_aux,MCS_ast_aux,0.05)


% Statastical difference between t Control and MCS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_aux);
z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_mcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_aux,p_MCS_aux] = ttest2(Control_aux,MCS_aux,0.05)


% Statistical difference between Control and UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control vs UWS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05)


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control vs UWS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05)


cd(path_code);

%% Plot of all the different results in one just figure
%  (ask by Steven Laureys)

y_control = mean(Control_aux);
y_EMCS =  mean(EMCS_aux);
y_LIS = mean(LIS_aux);
y_MCS_p = mean(MCS_p_aux);
y_MCS_m = mean(MCS_m_aux);
y_MCS_ast = mean(MCS_ast_aux);
y_MCS = mean(MCS_aux);
y_UWS = mean(UWS_aux);


figure,
hh = plot(t_control, y_control, t_emcs, y_EMCS, t_lis, y_LIS, t_mcs, y_MCS, t_mcs_p, y_MCS_p, t_mcs_m, y_MCS_m, t_mcs_ast, y_MCS_ast, t_uws, y_UWS );
legend(hh, 'Control', 'EMCS', 'LIS','MCS', 'MCS+ ', 'MCS- ', 'MCS*', 'UWS')
title( 'Plot of Control, EMCS, LIS, MCS, MCS+, MCS-, MCS*, and UWS')



%%% for Multiple Comparision

p_all_aux = [p_EMCS_aux p_LIS_aux  p_MCS_m_aux p_MCS_p_aux p_MCS_aux p_UWS_aux];


[p_fdr, h_fdr] = fdr(p_all_aux, 0.09);
p_fdr
h_fdr

[p_mafdr] = mafdr(p_all_aux);
p_mafdr

%%%%
%%
elseif(strcmp(segment,'se_morning_awd'))
  cd(path_control);
  SUBJlist_Control = dir('*.mat');

 for i = 1:length(SUBJlist_Control)
    SUBJname_Control = SUBJlist_Control(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_Control);
    Control_aux(i,:,:) = data.aux;
 end
 t_control = data.time;
% figure
% plot(t_control, Control_aux');


%%%%%% Import data for Group 2: EMCSs

 cd(path_emcs);
 SUBJlist_EMCS = dir('EMC*.mat');

 for i = 1:length(SUBJlist_EMCS)
    SUBJname_EMCS = SUBJlist_EMCS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_EMCS);
    EMCS_aux(i,:,:) = data.aux;
 end
 t_emcs = data.time;
% figure
% plot(t_emc,EMCS_aux');


%%%%%% Import data for Group 2-b: LIS

 cd(path_lis);
 SUBJlist_LIS = dir('*.mat');

 for i = 1:length(SUBJlist_LIS)
    SUBJname_LIS = SUBJlist_LIS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_LIS);
    LIS_aux(i,:,:) = data.aux;
 end
 t_lis = data.time;




%%%%%% import data for group 3: MCS-

 cd(path_mcs_m);
 SUBJlist_MCS_m = dir('MCS_m_*.mat');

 for i = 1:length(SUBJlist_MCS_m)
    SUBJname_MCS_m = SUBJlist_MCS_m(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_m);
    MCS_m_aux(i,:,:) = data.aux;

 end
 t_mcs_m = data.time;
% figure
% plot(t_mcs_m,MCS_m_aux');



%%%%%% import data for group 4: MCS+



 cd(path_mcs_p);
 SUBJlist_MCS_p = dir('MCS_p_*.mat');

 for i = 1:length(SUBJlist_MCS_p)
    SUBJname_MCS_p = SUBJlist_MCS_p(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_p);
    MCS_p_aux(i,:,:) = data.aux;

 end

 t_mcs_p = data.time;
% figure
% plot(t_mcs_p,MCS_p_aux');

%%%%%% import data for group 4-b: MCS*



 cd(path_mcs_ast);
 SUBJlist_MCS_p = dir('MCS_ast_*.mat');

 for i = 1:length(SUBJlist_MCS_p)
    SUBJname_MCS_p = SUBJlist_MCS_p(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_p);
    MCS_ast_aux(i,:,:) = data.aux;

 end

 t_mcs_ast = data.time;



 cd(path_mcs);
 SUBJlist_MCS = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS)
    SUBJname_MCS = SUBJlist_MCS(i).name;
    data=load(SUBJname_MCS);
    MCS_aux(i,:,:) = data.aux;

 end

 t_mcs = data.time;
% figure
% plot(t_mcs,MCS_aux');


%%%%%% import data for group 5: UWS


 cd(path_uws);
 SUBJlist_UWS = dir('UWS_*.mat');

 for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
    UWS_aux(i,:,:) = data.aux;

 end
 t_uws = data.time;
% figure
% plot(t_uws,UWS_aux');

  %%%%%% import data for group 5-b: UWS*


 cd(path_uws_ast);
 SUBJlist_UWS_ast = dir('UWS_*.mat');

 for i = 1:length(SUBJlist_UWS_ast)
    SUBJname_UWS_ast = SUBJlist_UWS_ast(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS_ast);
    UWS_ast_aux(i,:,:) = data.aux;

 end
 t_uws_ast = data.time;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Ploting 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (EMCS_aux);
%y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
z3_CC = std (EMCS_aux)/sqrt (length(EMCS_aux));
errorbar (t_emcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs EMCS (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


% Statastical difference between Control and EMCS

[h_EMCS_aux,p_EMCS_aux] = ttest2(Control_aux,EMCS_aux,0.05)

% LIS
figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (LIS_aux);
z3_CC = std (LIS_aux)/sqrt (length(LIS_aux));
errorbar (t_lis, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs LIS (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


% Statastical difference between Control and LIS

[h_LIS_aux,p_LIS_aux] = ttest2(Control_aux,LIS_aux,0.05)



% Statastical difference between t Control and MCS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_aux);
z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_mcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs MCS (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');



[h_MCS_aux,p_MCS_aux] = ttest2(Control_aux,MCS_aux,0.05)




% Statastical difference between  Control and MCS-

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_m_aux);
z3_CC = std (MCS_m_aux)/sqrt (length(MCS_m_aux));
errorbar (t_mcs_m, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS-')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_m_aux,p_MCS_m_aux] = ttest2(Control_aux,MCS_m_aux,0.05)



% Statastical difference between t Control and MCS+


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_p_aux);
z3_CC = std (MCS_p_aux)/sqrt (length(MCS_p_aux));
errorbar (t_mcs_p, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS+')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');




[h_MCS_p_aux,p_MCS_p_aux] = ttest2(Control_aux,MCS_p_aux,0.05)



% Statastical difference between t Control and MCS*


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_ast_aux);
z3_CC = std (MCS_ast_aux)/sqrt (length(MCS_ast_aux));
errorbar (t_mcs_ast, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS*')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_ast_aux,p_MCS_ast_aux] = ttest2(Control_aux,MCS_ast_aux,0.05)


% Statistical difference between Control and UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control (blue) vs UWS (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05)

% Statistical difference between Control and UWS*


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_ast_aux);
z3_CC = std (UWS_ast_aux)/sqrt (length(UWS_ast_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control (blue) vs UWS* (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_aux,p_UWS_ast_aux] = ttest2(Control_aux,UWS_ast_aux,0.05)

cd(path_code);
%%%%%
%%

elseif(strcmp(segment,'se_morning_mtn'))
   
     cd(path_control);
  SUBJlist_Control = dir('*.mat');

 for i = 1:length(SUBJlist_Control)
    SUBJname_Control = SUBJlist_Control(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_Control);
    Control_aux(i,:,:) = data.aux;
 end
 t_control = data.time;
% figure
% plot(t_control, Control_aux');


%%%%%% Import data for Group 2: EMCSs

 cd(path_emcs);
 SUBJlist_EMCS = dir('EMC*.mat');

 for i = 1:length(SUBJlist_EMCS)
    SUBJname_EMCS = SUBJlist_EMCS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_EMCS);
    EMCS_aux(i,:,:) = data.aux;
 end
 t_emcs = data.time;
% figure
% plot(t_emc,EMCS_aux');


%%%%%% Import data for Group 2-b: LIS

 cd(path_lis);
 SUBJlist_LIS = dir('*.mat');

 for i = 1:length(SUBJlist_LIS)
    SUBJname_LIS = SUBJlist_LIS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_LIS);
    LIS_aux(i,:,:) = data.aux;
 end
 t_lis = data.time;

%%%%%% Import data for Group 3: MCS
 cd(path_mcs);
 SUBJlist_MCS = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS)
    SUBJname_MCS = SUBJlist_MCS(i).name;
    data=load(SUBJname_MCS);
    MCS_aux(i,:,:) = data.aux;

 end

 t_mcs = data.time;

%%%%%% Import data for Group 3: MCS-
 cd(path_mcs_m);
 SUBJlist_MCS_m = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS_m)
    SUBJname_MCS_m = SUBJlist_MCS_m(i).name;
    data=load(SUBJname_MCS_m);
    MCS_m_aux(i,:,:) = data.aux;

 end

 t_mcs_m = data.time;

%%%%%% Import data for Group 3: MCS+
 cd(path_mcs_p);
 SUBJlist_MCS_p = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS_p)
    SUBJname_MCS_p = SUBJlist_MCS_p(i).name;
    data=load(SUBJname_MCS_p);
    MCS_p_aux(i,:,:) = data.aux;

 end

 t_mcs_p = data.time;
 
  %%%%%% Import data for Group 3: MCS*
 
 cd(path_mcs_ast);
 SUBJlist_MCS_ast = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS_ast)
    SUBJname_MCS_ast = SUBJlist_MCS_ast(i).name;
    data=load(SUBJname_MCS_ast);
    MCS_ast_aux(i,:,:) = data.aux;

 end

 t_mcs_ast = data.time;
% figure
% plot(t_mcs,MCS_aux');


%%%%%% import data for group 5: UWS


 cd(path_uws);
 SUBJlist_UWS = dir('UWS_*.mat');

 for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
    UWS_aux(i,:,:) = data.aux;

 end
 t_uws = data.time;
% figure
% plot(t_uws,UWS_aux');


  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Ploting 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (EMCS_aux);
%y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
z3_CC = std (EMCS_aux)/sqrt (length(EMCS_aux));
errorbar (t_emcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs EMCS')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


% Statastical difference between Control and EMCS

[h_EMCS_aux,p_EMCS_aux] = ttest2(Control_aux,EMCS_aux,0.05)

% LIS
figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (LIS_aux);
z3_CC = std (LIS_aux)/sqrt (length(LIS_aux));
errorbar (t_lis, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs LIS')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


% Statastical difference between Control and LIS

[h_LIS_aux,p_LIS_aux] = ttest2(Control_aux,LIS_aux,0.05)



% Statastical difference between t Control and MCS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_aux);
z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_mcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');




[h_MCS_aux,p_MCS_aux] = ttest2(Control_aux,MCS_aux,0.05)



% Statastical difference between  Control and MCS-

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_m_aux);
z3_CC = std (MCS_m_aux)/sqrt (length(MCS_m_aux));
errorbar (t_mcs_m, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS-')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_m_aux,p_MCS_m_aux] = ttest2(Control_aux,MCS_m_aux,0.05)



% Statastical difference between t Control and MCS+


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_p_aux);
z3_CC = std (MCS_p_aux)/sqrt (length(MCS_p_aux));
errorbar (t_mcs_p, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS+')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');




[h_MCS_p_aux,p_MCS_p_aux] = ttest2(Control_aux,MCS_p_aux,0.05)



% Statastical difference between t Control and MCS*


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_ast_aux);
z3_CC = std (MCS_ast_aux)/sqrt (length(MCS_ast_aux));
errorbar (t_mcs_ast, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS*')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_ast_aux,p_MCS_ast_aux] = ttest2(Control_aux,MCS_ast_aux,0.05)





% Statistical difference between Control and UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control vs UWS')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05)



figure
y2_CC = mean(MCS_aux);
z2_CC = std(Control_aux)/sqrt (length(MCS_aux));
errorbar(t_mcs,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
%y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title( 'MCS (blue) vs UWS (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');







cd(path_code);
    
    
    
end


end