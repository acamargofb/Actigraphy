function Actigraphy_Stats_v2_7_single_level_msa_se_(segment)

clc
% clear all
close all

% segment = 'mtn_files'

path_code = '/home/aldo/Documents/Projects/Avtivemeter/Data';

presentation_results = true;
presentation_all = false;


cd(path_code);

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
    
    plot_statistics_awd(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws, path_uws_ast);

 elseif(strcmp(segment,'se_morning_120min_'))
    
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_120min/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_120min/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_120min/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_120min/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_120min/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_120min/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_120min/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_120min/';
    path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_120min/';
    
    plot_statistics_awd(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws, path_uws_ast);

    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_120min/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_120min/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_120min/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_120min/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_120min/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_120min/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_120min/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_120min/';
    
    plot_statistics_mtn(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws);
   
          
 elseif(strcmp(segment,'se_morning_mtn'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_morning/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_morning/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_morning/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_morning/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_morning/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_morning/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_morning/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_morning/';
    
    plot_statistics_mtn(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws);
    
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
%     path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/';
%     path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/';
%     path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/';
%     path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_whole_day/';
%     path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_whole_day/';
%     path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_whole_day/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day_v2/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day_v2/';     
 
    plot_statistics_MCS_UWS_mtn(path_code, path_mcs, path_uws);
    
elseif(strcmp(segment,'control_comparison'))
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/';
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/';

elseif(strcmp(segment, 'comparison_morning'))
    
    fprintf(1,'\n Working with the comparison of morning recordings to find the ultradian rhythmycity...  \n' )
    
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_120min/';
    path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_120min/';
    path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_120min/';
    path_mcs_p_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_120min/';
    path_mcs_m_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_120min/';
    path_mcs_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_120min/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_120min/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_120min/';
    path_uws_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_120min/';
    
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_120min/';
    path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_120min/';
    path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_120min/';
    path_mcs_p_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_120min/';
    path_mcs_m_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_120min/';
    path_mcs_ast_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_120min/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_120min/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_120min/';     
 
   
 
elseif(strcmp(segment, 'comparison'))
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/';
    path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_whole_day/';
    path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/';
    path_mcs_p_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_whole_day/';
    path_mcs_m_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_whole_day/';
    path_mcs_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_whole_day/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day/';
    path_uws_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_whole_day/';
    
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/';
    path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/';
    path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/';
    path_mcs_p_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_whole_day/';
    path_mcs_m_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_whole_day/';
    path_mcs_ast_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_whole_day/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day/';     
    
elseif(strcmp(segment, 'comparison_msa_se_whole_day'))
    
    %%%%%
    %%% Folder where the MSA data are
    %%%%%
    
    MSA = true;
    
%     path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/';
%     %path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_whole_day/';
%     path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day_v2/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day_v2/';
    
    
    title_1 = 'Comparison of MSA on MCS (blue) vs UWS (red) for AWD';
    
    plot_statistics_paper1_v2(path_code, path_mcs_awd, path_uws_awd, MSA, title_1);
    
    
%     path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/';
%     %path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/';
%     path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day_v2/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day_v2/';     
    
    title_1 = 'Comparison of MSA on MCS (blue) vs UWS (red) for MTN';
    plot_statistics_paper1_v2(path_code, path_mcs_mtn, path_uws_mtn, MSA,title_1 );
    
  
    %%%%%
    %%% Folder where the SE data are
    %%%%%  
    
    MSA = false;
    
%     path_control_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/SE/';
%     path_emcs_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/SE/';
    path_mcs_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day_v2/SE/';
    path_uws_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day_v2/SE/';
    
    
    title_2 = 'Comparison of SE on MCS (blue) vs UWS (red) for AWD';
    plot_statistics_paper1_v2(path_code,path_mcs_awd_se, path_uws_awd_se, MSA, title_2)
    
   
%   path_control_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/SE/';
%   path_emcs_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/SE/';
    path_mcs_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day_v2/SE/';
    path_uws_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day_v2/SE/';     
    
    title_2 = 'Comparison of SE on MCS (blue) vs UWS (red) for MTN';
    
    path_mcs = path_mcs_mtn_se;
    path_uws = path_uws_mtn_se;
    title_1 = title_2;
    
    plot_statistics_paper1_v2(path_code, path_mcs_mtn_se, path_uws_mtn_se, MSA, title_2)
    
elseif(strcmp(segment, 'comparison_msa_se_120min'))
    
    %%%%%
    %%% Folder where the MSA data are  (AWD Files)
    %%%%%
    
     MSA = true;
    
    
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_120min/';
   % path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_120min/';
    path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_120min/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_120min/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_120min/';
    
    plot_statistics_paper1(path_code, path_control_awd, path_emcs_awd, path_mcs_awd, path_uws_awd, MSA );
    
    %%%%%
    %%% Folder where the MSA data are  (MTN Files)
    %%%%%
    
    
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_120min/';
   % path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_120min/';
    path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_120min/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_120min/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_120min/';     
    
    plot_statistics_paper1(path_code, path_control_mtn, path_emcs_mtn, path_mcs_mtn, path_uws_mtn, MSA);
  
       
    
    
    
    %%%%%
    %%% Folder where the SE data are (AWD files)
    %%%%%  
    
    MSA = false;
     
    path_control_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_120min/SE/';
    %path_lis_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_120min/SE/';
    path_emcs_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_120min/SE/';
    path_mcs_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_120min/SE/';
    path_uws_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_120min/SE/';
    
%     path_control = path_control_awd_se
%     path_emcs = path_emcs_awd_se
%     path_mcs = path_mcs_awd_se
%     path_uws = path_uws_awd_se
%     time_analysis = 120
    
    plot_statistics_paper1(path_code, path_control_awd_se, path_emcs_awd_se, path_mcs_awd_se, path_uws_awd_se, MSA)
    
    
    %%%%%
    %%% Folder where the SE data are (MTN files)
    %%%%% 
   
        
    path_control_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_120min/SE/';
    %path_lis_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_120min/SE/';
    path_emcs_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_120min/SE/';
    path_mcs_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_120min/SE/';
    path_uws_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_120min/SE/';     
    
    
  
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



if(strcmp(segment,'comparison_msa_se_whole_day')   )
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      Control  MTN        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 cd(path_control_mtn);
 SUBJlist_Control_MTN = dir('*.mat');

 for i = 1:length(SUBJlist_Control_MTN)
    SUBJname_Control = SUBJlist_Control_MTN(i).name;
    data=load(SUBJname_Control);
    Control_mtn_aux(i,:,:) = data.aux;
 end
 t_control_mtn = data.time;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 cd(path_control_mtn_se);
 SUBJlist_Control_MTN_SE = dir('*.mat');

 for i = 1:length(SUBJlist_Control_MTN_SE)
    SUBJname_Control_SE = SUBJlist_Control_MTN_SE(i).name;
    data_se=load(SUBJname_Control_SE);
    Control_mtn_SE_aux(i,:) = data_se.aux;
 end
 t_control_mtn_se = data_se.t_aux;
 
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      Control  AWD        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%% Import data for Group 2: Controls AWD files

 cd(path_control_awd);
 SUBJlist_Control_AWD = dir('*.mat');

 for i = 1:length(SUBJlist_Control_AWD)
    SUBJname_Control_AWD = SUBJlist_Control_AWD(i).name;
    data=load(SUBJname_Control_AWD);
    Control_awd_aux(i,:,:) = data.aux;
 end
 t_control_awd = data.time;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 cd(path_control_awd_se);
 SUBJlist_Control_AWD_SE = dir('*.mat');

 for i = 1:length(SUBJlist_Control_AWD_SE)
    SUBJname_Control_SE = SUBJlist_Control_AWD_SE(i).name;
    data_se=load(SUBJname_Control_SE);
    Control_awd_SE_aux(i,:) = data_se.aux;
 end
 t_control_awd_se = data_se.t_aux;
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      EMCS  AWD           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%%%%%% Import data for Group 3: EMCS AWD files

 cd(path_emcs_awd);
 SUBJlist_EMCS_AWD = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_AWD)
    SUBJname_EMCS_AWD = SUBJlist_EMCS_AWD(i).name;
    data=load(SUBJname_EMCS_AWD);
    EMCS_awd_aux(i,:,:) = data.aux;
 end
 t_emcs_awd = data.time;
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       SE                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 cd(path_emcs_awd_se);
 SUBJlist_EMCS_AWD_SE = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_AWD_SE)
    SUBJname_EMCS_AWD_SE = SUBJlist_EMCS_AWD_SE(i).name;
    data_se=load(SUBJname_EMCS_AWD_SE);
    EMCS_awd_SE_aux(i,:) = data_se.aux;
 end
 t_emcs_awd_se = data_se.t_aux;
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      EMCS  MTN           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 

%%%%%% Import data for Group 4: EMCS MTN files

 cd(path_emcs_mtn);
 SUBJlist_EMCS_MTN = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_MTN)
    SUBJname_EMCS_MTN = SUBJlist_EMCS_MTN(i).name;
    data=load(SUBJname_EMCS_MTN);
    EMCS_mtn_aux(i,:,:) = data.aux;
 end
 t_emcs_mtn = data.time;

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 cd(path_emcs_mtn_se);
 SUBJlist_EMCS_MTN_SE = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_MTN_SE)
    SUBJname_EMCS_MTN_SE = SUBJlist_EMCS_MTN_SE(i).name;
    data_se=load(SUBJname_EMCS_MTN_SE);
    EMCS_mtn_SE_aux(i,:) = data_se.aux;
 end
 
 t_emcs_mtn_se = data_se.t_aux;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      LIS  AWD            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
 %%%%%% Import data for Group 5: LIS AWD files

%  cd(path_lis_awd);
%  SUBJlist_LIS_AWD = dir('*.mat');
% 
%  for i = 1:length(SUBJlist_LIS_AWD)
%     SUBJname_LIS_AWD = SUBJlist_LIS_AWD(i).name;
%     data=load(SUBJname_LIS_AWD);
%     LIS_awd_aux(i,:,:) = data.aux;
%  end
%  t_lis_awd = data.time;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  cd(path_lis_awd_se);
%  SUBJlist_LIS_AWD_SE = dir('EMCS*.mat');
% 
%  for i = 1:length(SUBJlist_LIS_AWD_SE)
%     SUBJname_LIS_MTN_SE = SUBJlist_LIS_AWD_SE(i).name;
%     data_se=load(SUBJname_LIS_MTN_SE);
%     EMCS_mtn_SE_aux(i,:) = data_se.aux;
%  end
%  
%  t_emcs_mtn_se = data_se.t_aux;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      LIS  MTN            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%%%%%% Import data for Group 6: LIS MTN files
% 
%  cd(path_lis_mtn);
%  SUBJlist_LIS_MTN = dir('LIS*.mat');
% 
%  for i = 1:length(SUBJlist_LIS_MTN)
%     SUBJname_LIS_MTN = SUBJlist_LIS_MTN(i).name;
%     data=load(SUBJname_LIS_MTN);
%     LIS_mtn_aux(i,:,:) = data.aux;
%  end
%  t_lis_mtn = data.time;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% 
%  cd(path_lis_mtn_se);
%  SUBJlist_LIS_MTN_SE = dir('LIS*.mat');
% 
%  for i = 1:length(SUBJlist_LIS_MTN_SE)
%     SUBJname_LIS_MTN_SE = SUBJlist_LIS_MTN_SE(i).name;
%     data_se=load(SUBJname_LIS_MTN_SE);
%     LIS_mtn_SE_aux(i,:) = data_se.aux;
%  end
%  t_lis_mtn = data_se.t_aux;
%  
 
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MCS  AWD            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
%%%%%% Import data for Group 7: MCS AWD files

 cd(path_mcs_awd);
  SUBJlist_MCS_AWD = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_AWD)
    SUBJname_MCS_AWD = SUBJlist_MCS_AWD(i).name;
    data=load(SUBJname_MCS_AWD);
    MCS_awd_aux(i,:,:) = data.aux;
 end
 t_mcs_awd = data.time;
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
cd(path_mcs_awd_se);
  SUBJlist_MCS_AWD_SE = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_AWD_SE)
    SUBJname_MCS_AWD_SE = SUBJlist_MCS_AWD_SE(i).name;
    data_se=load(SUBJname_MCS_AWD_SE);
    MCS_awd_SE_aux(i,:) = data_se.aux;
 end
 t_mcs_awd_se = data_se.t_aux;
 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MCS  MTN            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 %%%%%% Import data for Group 8: MCS MTN files

 cd(path_mcs_mtn);
 
 %cd(path_mcs_p_mtn);
 SUBJlist_MCS_MTN = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_MTN)
    SUBJname_MCS_MTN = SUBJlist_MCS_MTN(i).name;
    data=load(SUBJname_MCS_MTN);
    MCS_mtn_aux(i,:,:) = data.aux;
 end
 t_mcs_mtn = data.time;
 
 % test of the code
 %figure, plot(t_mcs_mtn, mean(MCS_mtn_aux));
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
cd(path_mcs_mtn_se);
 
 %cd(path_mcs_p_mtn);
 SUBJlist_MCS_MTN_SE = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_MTN_SE)
    SUBJname_MCS_MTN_SE = SUBJlist_MCS_MTN_SE(i).name;
    data_se=load(SUBJname_MCS_MTN_SE);
    MCS_mtn_SE_aux(i,:) = data_se.aux';
 end
 t_mcs_mtn_se = data_se.t_aux;
 
 
 
% %  temp_t = 1:1440;
% %  % test of the code
% %  figure, plot(t_mcs_mtn, mean(MCS_mtn_aux));
% %  
% %  figure, plot(temp_t, mean(MCS_mtn_SE_aux));
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      UWS  AWD            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
%%%%%% Import data for Group 9: UWS AWD files

 cd(path_uws_awd);
 SUBJlist_UWS_AWD = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_AWD)
    SUBJname_UWS_AWD = SUBJlist_UWS_AWD(i).name;
    data=load(SUBJname_UWS_AWD);
    UWS_awd_aux(i,:,:) = data.aux;
 end
 t_uws_awd = data.time;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
cd(path_uws_awd_se);
 
 %cd(path_mcs_p_mtn);
 SUBJlist_UWS_AWD_SE = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_AWD_SE)
    SUBJname_UWS_AWD_SE = SUBJlist_UWS_AWD_SE(i).name;
    data_se=load(SUBJname_UWS_AWD_SE);
    UWS_awd_SE_aux(i,:) = data_se.aux';
 end
 t_uws_awd_se = data_se.t_aux;
 
 
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      UWS  MTN            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      MSA                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
 
 %%%%%% Import data for Group 10: UWS MTN files

 cd(path_uws_mtn);
 SUBJlist_UWS_MTN = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_MTN)
    SUBJname_UWS_MTN = SUBJlist_UWS_MTN(i).name;
    data=load(SUBJname_UWS_MTN);
    UWS_mtn_aux(i,:,:) = data.aux;
 end
 t_uws_mtn = data.time;
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%      SE                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
cd(path_uws_mtn_se);
 
 %cd(path_mcs_p_mtn);
 SUBJlist_UWS_MTN_SE = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_MTN_SE)
    SUBJname_UWS_MTN_SE = SUBJlist_UWS_MTN_SE(i).name;
    data_se=load(SUBJname_UWS_MTN_SE);
    UWS_mtn_SE_aux(i,:) = data_se.aux';
 end
 t_uws_mtn_se = data_se.t_aux;
 
 
 
%% 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%
 %%% Grouping the data of AWD and MTN files (MSA)
 %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 MSA = true;
 
% t_control = t_control_mtn;
 
 t_control = t_mcs_awd;  % inserted on 02/07/2018 since I am not using Control data just MCS and UWS
 
 cd(path_code);
    
    Controls = [ Control_mtn_aux;
                 Control_awd_aux];
         
%     LIS = [ LIS_mtn_aux;
%             LIS_awd_aux];         
         
    EMCS = [ EMCS_mtn_aux;
             EMCS_awd_aux];

    MCS = [ MCS_mtn_aux;
            MCS_awd_aux];        

    UWS = [ UWS_mtn_aux;
            UWS_awd_aux];     
        
        
        
 plot_statistics_groups_paper1(path_code,  t_control, Controls,EMCS, MCS, UWS, MSA)    
        
    %% 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%
 %%% Grouping the data of AWD and MTN files (SE)
 %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 cd(path_code);
 
 MSA = false;
 
 %t_control = 1:1400;  % for 1 day of analysis
 %t_control = 1:120;  % for 120 min of analysis
 t_control = 1:(1440*4-40);  % for 4 days of analysis
 
    
    Controls_SE = [ Control_mtn_SE_aux;
                 Control_awd_SE_aux];
         
%     LIS_SE = [ LIS_mtn_SE_aux;
%             LIS_awd_SE_aux];         
         
    EMCS_SE = [ EMCS_mtn_SE_aux;
             EMCS_awd_SE_aux];

    MCS_SE = [ MCS_mtn_SE_aux;
            MCS_awd_SE_aux];        

    UWS_SE = [ UWS_mtn_SE_aux;
            UWS_awd_SE_aux];      
        
     
     % Using the same length for all the groups from 1:1400
        
%      Controls_SE_t = Controls_SE(:,1:1400);
%      EMCS_SE_t = EMCS_SE(:,1:1400);
%      MCS_SE_t = MCS_SE(:,1:1400);
%      UWS_SE_t =  UWS_SE(:,1:1400);


       Controls_SE_t = Controls_SE(:,t_control);
       EMCS_SE_t = EMCS_SE(:,t_control);
       MCS_SE_t = MCS_SE(:,t_control);
	   UWS_SE_t =  UWS_SE(:,t_control);

        
%     figure,plot(t_control_mtn, Control_mtn_aux);
%     figure, plot(t_control_mtn, Controls');
%     
%     figure,plot(t_control_mtn, LIS);
%     figure,plot(t_control_mtn, EMCS);
%     figure,plot(t_control_mtn, MCS);
%     figure,plot(t_control_mtn, UWS);
%     title( 'Plot of all UWS patients','FontSize',14,'FontWeight','bold','Color','k')
%     ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
%     xlabel('time (min)');
    
    
     plot_statistics_groups_paper1(path_code,  t_control, Controls_SE_t,EMCS_SE_t, MCS_SE_t, UWS_SE_t, MSA)


    %% Controls
    
    figure,plot(t_control_mtn, mean(Control_awd_aux), 'b', t_control_mtn, mean(Control_mtn_aux), 'r', t_control_mtn, mean(Controls), 'k' );
    title( 'Plot of all Controls (blue (awd files) , red (mtn files)  and black all together)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    [pks_control_awd, indx_pks_controls_awd] = findpeaks(mean(Control_awd_aux));
    
    [pks_control_mtn,indx_pks_controls_mtn] = findpeaks(mean(Control_mtn_aux));
    
    [pks_controls,indx_pks_controls] = findpeaks(mean(Controls));
    
    
    control_mtn_periods_at_max_SA = t_control_mtn(indx_pks_controls_mtn)
    
    control_awd_periods_at_max_SA = t_control_mtn(indx_pks_controls_awd)
    
    controls_periods_at_max_SA = t_control_mtn(indx_pks_controls)
    
    
    
    %% Control at subject level
     cd(path_code); 
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%    CONTROL: AWD  Data                            %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fid=fopen('CONTROL_awd_120min.csv','w');
    fid2 = fopen('CONTROL_AWD_mean_std_cv_120min.csv','w');
        
     
    [m_Control_awd, n_Control_awd] = size(Control_awd_aux);  % MSA
    [m_Control_SE_awd, n_Control_SE_awd] = size(Control_awd_SE_aux);  % SE
    
    number_of_pks_Controls_awd = [];
    
    

    for i=1:m_Control_awd
        [pks_Controls_awd, indx_pks_Controls_awd] = findpeaks((Control_awd_aux(i,:)));
        number_of_pks_Controls_awd = [number_of_pks_Controls_awd; length(pks_Controls_awd)];
        
        pks_MSA_Control_AWD{i} = t_control_mtn(indx_pks_Controls_awd);
        value_pks_MSA_CONTROL_AWD{i} = pks_Controls_awd;
        
        controls_awd_selected_pks_values{i}.pks = t_control_mtn(indx_pks_Controls_awd);
        controls_awd_selected_pks_values{i}.values = pks_Controls_awd;
        
        
        % This is the corresponding SE for the respective peaks found
        % previously:
        controls_awd_selected_pks_values{i}.SE = Control_awd_SE_aux(i,floor(t_emcs_mtn(indx_pks_Controls_awd)));  % I use floor, you can try with ceil :)
        
        controls_awd_selected_pks_values{i}.std_SE = std(Control_awd_SE_aux(i,:));
        controls_awd_selected_pks_values{i}.mean_SE = mean(Control_awd_SE_aux(i,:));
         
        %%% cv = std/mean
        %%% (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
        controls_awd_selected_pks_values{i}.cv_SE =  (controls_awd_selected_pks_values{i}.std_SE)/(controls_awd_selected_pks_values{i}.mean_SE); 
         
        fprintf(fid, '%s,',controls_awd_selected_pks_values{i}.SE);
        fprintf(fid, '\n ');
         
        fprintf(fid2, '%s, %s,', controls_awd_selected_pks_values{i}.mean_SE, controls_awd_selected_pks_values{i}.std_SE );
        fprintf(fid2, '%s, ', controls_awd_selected_pks_values{i}.cv_SE );
        fprintf(fid2, '\n ');
        
               
    end
    
    fclose(fid);
    fclose(fid2);
    
    
    
    indx_m_CONTROL_awd = zeros(m_Control_awd,3);
    MSA_at_indx_m_Control_awd = zeros(m_Control_awd,3);
    SE_at_indx_m_Control_awd = zeros(m_Control_SE_awd,3);
    
    
    
    for i=1:m_Control_awd
        temp = pks_MSA_Control_AWD{i};
        idx_temp = (pks_MSA_Control_AWD{i} > 20 & pks_MSA_Control_AWD{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_awd_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_awd(i,1) = temp(temp_idx)
            MSA_at_indx_m_Control_awd(i,1) = controls_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_Control_awd(i,1) = controls_awd_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        
        idx_temp = (pks_MSA_Control_AWD{i} >= 240 & pks_MSA_Control_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_awd_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_awd(i,2) = temp(temp_idx)
            MSA_at_indx_m_Control_awd(i,2) = controls_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_Control_awd(i,2) = controls_awd_selected_pks_values{i}.SE(temp_idx);  % SE
            
        end
        idx_temp = (pks_MSA_Control_AWD{i} >= 720 & pks_MSA_Control_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_awd_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_awd(i,3) = temp(temp_idx)
            MSA_at_indx_m_Control_awd(i,3) = controls_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_Control_awd(i,3) = controls_awd_selected_pks_values{i}.SE(temp_idx);  % SE
        end
    end
    
    
    fid3=fopen('Controls_awd_120min_resume.csv','w');
    
    for i=1:m_Control_awd
      
         fprintf(fid3, '%s,',controls_awd_selected_pks_values{i}.pks);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s,',controls_awd_selected_pks_values{i}.values);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, ', controls_awd_selected_pks_values{i}.SE );
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, %s,', controls_awd_selected_pks_values{i}.mean_SE, controls_awd_selected_pks_values{i}.std_SE );
         fprintf(fid3, '%s, ', controls_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid3, '\n');
         
    end
    
    fclose(fid3);
    
    
    
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%    CONTROL: MTN  Data                            %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    
    fid=fopen('CONTROL_MTN_120min.csv','w');
    fid2 = fopen('CONTROL_MTN_mean_std_cv_120min.csv','w');
        
     
    [m_Control_mtn, n_Control_mtn] = size(Control_mtn_aux);  % MSA
    [m_Control_SE_mtn, n_Control_SE_mtn] = size(Control_mtn_SE_aux);  % SE
    
    number_of_pks_Controls_mtn = [];
    
    
 
    for i=1:m_Control_mtn
        [pks_Controls_mtn, indx_pks_Controls_mtn] = findpeaks((Control_mtn_aux(i,:)));
         number_of_pks_Controls_mtn = [number_of_pks_Controls_mtn; length(indx_pks_Controls_mtn)];
               
         pks_MSA_Control_MTN{i} = t_control_mtn(indx_pks_Controls_mtn);
         value_pks_MSA_CONTROL_MTN{i} = pks_Controls_mtn;
         controls_mtn_selected_pks_values{i}.pks = t_control_mtn(indx_pks_Controls_mtn);
         controls_mtn_selected_pks_values{i}.values = pks_Controls_mtn;
         
         % This is the corresponding SE for the respective peaks found
         % previously:
         controls_mtn_selected_pks_values{i}.SE = Control_mtn_SE_aux(i,floor(t_emcs_mtn(indx_pks_Controls_mtn)));  % I use floor, you can try with ceil :)
       
         controls_mtn_selected_pks_values{i}.std_SE = std(Control_mtn_SE_aux(i,:));
         controls_mtn_selected_pks_values{i}.mean_SE = mean(Control_mtn_SE_aux(i,:));
         
          % cv = std/mean
          % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         controls_mtn_selected_pks_values{i}.cv_SE =  (controls_mtn_selected_pks_values{i}.std_SE)/(controls_mtn_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid, '%s,',controls_mtn_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         fprintf(fid2, '%s, %s,', controls_mtn_selected_pks_values{i}.mean_SE, controls_mtn_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', controls_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
         
         
         
    end
    
    fclose(fid);
    fclose(fid2);
    
    indx_m_CONTROL_mtn = zeros(m_Control_mtn,3);
    MSA_at_indx_m_CONTROL_mtn = zeros(m_Control_mtn,3);
    SE_at_indx_m_CONTROL_mtn = zeros(m_Control_mtn,3);
    
    
    for i=1:m_Control_mtn
        temp = pks_MSA_Control_MTN{i};
        idx_temp = (pks_MSA_Control_MTN{i} > 20 & pks_MSA_Control_MTN{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_mtn(i,1) = temp(temp_idx)
            MSA_at_indx_m_CONTROL_mtn(i,1) = controls_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_CONTROL_mtn(i,1) = controls_mtn_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        
        idx_temp = (pks_MSA_Control_MTN{i} >= 240 & pks_MSA_Control_MTN{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_mtn(i,2) = temp(temp_idx)
            MSA_at_indx_m_CONTROL_mtn(i,2) = controls_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_CONTROL_mtn(i,2) = controls_mtn_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        idx_temp = (pks_MSA_Control_MTN{i} >= 720 & pks_MSA_Control_MTN{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_mtn(i,3) = temp(temp_idx)
            MSA_at_indx_m_CONTROL_mtn(i,3) = controls_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_CONTROL_mtn(i,3) = controls_mtn_selected_pks_values{i}.SE(temp_idx);  % SE
        end
    end
  
    
    
     
    fid3=fopen('Controls_mtn_120min_resume.csv','w');
    
    for i=1:m_Control_mtn
      
         fprintf(fid3, '%s,',controls_mtn_selected_pks_values{i}.pks);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s,',controls_mtn_selected_pks_values{i}.values);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, ', controls_mtn_selected_pks_values{i}.SE );
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, %s,', controls_mtn_selected_pks_values{i}.mean_SE, controls_mtn_selected_pks_values{i}.std_SE );
         fprintf(fid3, '%s, ', controls_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid3, '\n');
         
    end
    
    fclose(fid3);
    
    
    
    
    
    
    
    %% LIS
    
    figure,plot(t_control_mtn, mean(LIS_awd_aux),'b', t_control_mtn, mean(LIS_mtn_aux), 'r', t_control_mtn, mean(LIS), 'k');
    title( 'Plot of all LIS patients (blue (awd files) , red (mtn files)  and black all together)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    
    data_lis = mean(LIS_awd_aux);
    
    [pks_lis_awd, indx_pks_lis_awd] = findpeaks(mean(LIS_awd_aux));
    
    [pks_lis_awd, indx_pks_lis_awd] = findpeaks(data_lis);
        
    [pks_lis_mtn,indx_pks_lis_mtn] = findpeaks(mean(LIS_mtn_aux));
    
    [pks_lis,indx_pks_lis] = findpeaks(mean(LIS));
    
    
    lis_mtn_periods_at_max_SA = t_control_mtn(indx_pks_lis_mtn)
    
    lis_awd_periods_at_max_SA = t_lis_mtn(indx_pks_lis_awd)
    
    lis_periods_at_max_SA = t_lis_mtn(indx_pks_lis)
    
    
   %% LIS at subject level
        
    [m_LIS_awd, n_LIS_awd] = size(LIS_awd_aux);

    for i=1:m_LIS_awd
        [pks_LIS_awd, indx_pks_LIS_awd] = findpeaks((LIS_awd_aux(i,:)));
         pks_MSA_LIS_AWD{i} = t_lis_mtn(indx_pks_LIS_awd);
         value_pks_MSA_LIS_AWD{i} = pks_LIS_awd;
         lis_awd_selected_pks_values{i}.pks = t_lis_mtn(indx_pks_LIS_awd);
         lis_awd_selected_pks_values{i}.values = pks_LIS_awd;
         
    end
    
    [m_LIS_mtn, n_LIS_mtn] = size(LIS_mtn_aux);

    for i=1:m_LIS_mtn
        [pks_LIS_mtn, indx_pks_LIS_mtn] = findpeaks((LIS_mtn_aux(i,:)));
         pks_MSA_LIS_MTN{i} = t_lis_mtn(indx_pks_LIS_mtn);
         value_pks_MSA_LIS_AWD{i} = pks_LIS_awd;
         lis_awd_selected_pks_values{i}.pks = t_lis_mtn(indx_pks_LIS_awd);
         lis_awd_selected_pks_values{i}.values = pks_LIS_awd;
    end
    
    
    
    
    
    
    %% EMCS
    
    figure,plot(t_control_mtn, mean(EMCS_awd_aux),'b', t_control_mtn, mean(EMCS_mtn_aux), 'r', t_control_mtn, mean(EMCS), 'k');
    title( 'Plot of all EMCS patients (blue (awd files) , red (mtn files)  and black all together)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    [pks_emcs_awd, indx_pks_emcs_awd] = findpeaks(mean(EMCS_awd_aux));
    
    [pks_emcs_mtn,indx_pks_emcs_mtn] = findpeaks(mean(EMCS_mtn_aux));
    
    [pks_emcs,indx_pks_emcs] = findpeaks(mean(EMCS));
    
    
    emcs_mtn_periods_at_max_SA = t_control_mtn(indx_pks_emcs_mtn)
    
    emcs_awd_periods_at_max_SA = t_emcs_mtn(indx_pks_emcs_awd)
    
    emcs_periods_at_max_SA = t_emcs_mtn(indx_pks_emcs)
    
    
    
    %% EMCS at subject level
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%    EMCS: AWD  Data                               %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fid=fopen('EMCS_awd_120min.csv','w');
    fid2 = fopen('EMCS_AWD_mean_std_cv_120min.csv','w');
    
    [m_EMCS_awd, n_EMCS_awd] = size(EMCS_awd_aux);  % MSA
    [m_EMCS_SE_awd, n_EMCS_SE_awd] = size(EMCS_awd_SE_aux);  % SE
    
    number_of_pks_EMCS_awd = [];
    
    for i=1:m_EMCS_awd
        [pks_emcs_awd, indx_pks_emcs_awd] = findpeaks((EMCS_awd_aux(i,:)));
        number_of_pks_EMCS_awd = [number_of_pks_EMCS_awd; length(indx_pks_emcs_awd)];
      
         pks_MSA_EMCS_AWD{i} = t_emcs_mtn(indx_pks_emcs_awd);  % pks in minutes
         value_pks_MSA_EMCS_AWD{i} = pks_emcs_awd;  % value of the corresponding pks in MSA
         emcs_awd_selected_pks_values{i}.pks = t_emcs_mtn(indx_pks_emcs_awd);
         emcs_awd_selected_pks_values{i}.values = pks_emcs_awd;
         % This is the corresponding SE for the respective peaks found
         % previously:
         emcs_awd_selected_pks_values{i}.SE = EMCS_awd_SE_aux(i,floor(t_emcs_mtn(indx_pks_emcs_awd)));  % I use floor, you can try with ceil :)
       
         emcs_awd_selected_pks_values{i}.std_SE = std(EMCS_awd_SE_aux(i,:));
         emcs_awd_selected_pks_values{i}.mean_SE = mean(EMCS_awd_SE_aux(i,:));
         
          % cv = std/mean
          % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         emcs_awd_selected_pks_values{i}.cv_SE =  (emcs_awd_selected_pks_values{i}.std_SE)/(emcs_awd_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid, '%s,',emcs_awd_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         fprintf(fid2, '%s, %s,', emcs_awd_selected_pks_values{i}.mean_SE, emcs_awd_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', emcs_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
         
    end
    
    fclose(fid);
    fclose(fid2);
    
    
    indx_m_EMCS_awd = zeros(m_EMCS_awd,3);
    MSA_at_indx_m_EMCS_awd = zeros(m_EMCS_awd,3);
    SE_at_indx_m_EMCS_awd = zeros(m_EMCS_SE_awd,3);
    
    for i=1:m_EMCS_awd
        temp = pks_MSA_EMCS_AWD{i};
        idx_temp = (pks_MSA_EMCS_AWD{i} > 20 & pks_MSA_EMCS_AWD{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_EMCS_awd(i,1) = temp(temp_idx);
            MSA_at_indx_m_EMCS_awd(i,1) = emcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_EMCS_awd(i,1) = emcs_awd_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        
        idx_temp = (pks_MSA_EMCS_AWD{i} >= 240 & pks_MSA_EMCS_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_EMCS_awd(i,2) = temp(temp_idx);
            MSA_at_indx_m_EMCS_awd(i,2) = emcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_EMCS_awd(i,2) = emcs_awd_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        
        idx_temp = (pks_MSA_EMCS_AWD{i} >= 720 & pks_MSA_EMCS_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_EMCS_awd(i,3) = temp(temp_idx);
            MSA_at_indx_m_EMCS_awd(i,3) = emcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_EMCS_awd(i,3) = emcs_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
    end
    
    
    fid3=fopen('EMCS_awd_120min_resume.csv','w');
    
    for i=1:m_EMCS_awd
      
         fprintf(fid3, '%s,',emcs_awd_selected_pks_values{i}.pks);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s,',emcs_awd_selected_pks_values{i}.values);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, ', emcs_awd_selected_pks_values{i}.SE );
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, %s,', emcs_awd_selected_pks_values{i}.mean_SE, emcs_awd_selected_pks_values{i}.std_SE );
         fprintf(fid3, '%s, ', emcs_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid3, '\n');
         
    end
    
    fclose(fid3);
    
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%   EMCS:  MTN  Data                               %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    

     fid=fopen('EMCS_mtn_120min.csv','w');
     fid2 = fopen('EMCS_MTN_mean_std_cv_120min.csv','w');
    
    [m_EMCS_mtn, n_EMCS_mtn] = size(EMCS_mtn_aux);  % MSA
    [m_EMCS_SE_mtn, n_EMCS_SE_mtn] = size(EMCS_mtn_SE_aux);  % SE
    
    number_of_pks_EMCS_mtn = [];

    for i=1:m_EMCS_mtn
        i
        [pks_emcs_mtn, indx_pks_emcs_mtn] = findpeaks((EMCS_mtn_aux(i,:)));
        number_of_pks_EMCS_mtn = [number_of_pks_EMCS_mtn; length(indx_pks_emcs_mtn)];
        
         pks_MSA_EMCS_MTN{i} = t_emcs_mtn(indx_pks_emcs_mtn);
         value_pks_MSA_EMCS_MTN{i} = pks_emcs_mtn;
         emcs_mtn_selected_pks_values{i}.pks = t_emcs_mtn(indx_pks_emcs_mtn);
         emcs_mtn_selected_pks_values{i}.values = pks_emcs_mtn;
         
         % This is the corresponding SE for the respective peaks found
         % previously:
         emcs_mtn_selected_pks_values{i}.SE = EMCS_mtn_SE_aux(i,floor(t_emcs_mtn(indx_pks_emcs_mtn))); % I use floor, you can try with ceil :)
         fprintf(fid, '%s, ',emcs_mtn_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         
         emcs_mtn_selected_pks_values{i}.std_SE = std(EMCS_mtn_SE_aux(i,:));
         emcs_mtn_selected_pks_values{i}.mean_SE = mean(EMCS_mtn_SE_aux(i,:));
         
          % cv = std/mean
          % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         emcs_mtn_selected_pks_values{i}.cv_SE =  (emcs_mtn_selected_pks_values{i}.std_SE)/(emcs_mtn_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid2, '%s, %s,', emcs_mtn_selected_pks_values{i}.mean_SE, emcs_mtn_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', emcs_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
         
         
         
    end
    
    fclose(fid);
    fclose(fid2);
     
   indx_m_EMCS_mtn = zeros(m_EMCS_mtn,3);
   MSA_at_indx_m_EMCS_mtn = zeros(m_EMCS_mtn,3);
   SE_at_indx_m_EMCS_mtn = zeros(m_EMCS_SE_mtn,3);
    
    for i=1:m_EMCS_mtn
        temp = pks_MSA_EMCS_MTN{i};
        idx_temp = (pks_MSA_EMCS_MTN{i} > 20 & pks_MSA_EMCS_MTN{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_mtn(i,1) = temp(temp_idx)
            MSA_at_indx_m_EMCS_mtn(i,1) = emcs_mtn_selected_pks_values{i}.values(temp_idx)
            SE_at_indx_m_EMCS_mtn(i,1) = emcs_mtn_selected_pks_values{i}.SE(temp_idx) % SE
        end
        idx_temp = (pks_MSA_EMCS_MTN{i} >= 240 & pks_MSA_EMCS_MTN{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_mtn(i,2) = temp(temp_idx)
            MSA_at_indx_m_EMCS_mtn(i,2) = emcs_mtn_selected_pks_values{i}.values(temp_idx)
            SE_at_indx_m_EMCS_mtn(i,2) = emcs_mtn_selected_pks_values{i}.SE(temp_idx)  % SE
        end
        idx_temp = (pks_MSA_EMCS_MTN{i} >= 720 & pks_MSA_EMCS_MTN{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_mtn(i,3) = temp(temp_idx)
            MSA_at_indx_m_EMCS_mtn(i,3) = emcs_mtn_selected_pks_values{i}.values(temp_idx)
            SE_at_indx_m_EMCS_mtn(i,3) = emcs_mtn_selected_pks_values{i}.SE(temp_idx)  % SE
        end
    end
   
    
    fid3=fopen('EMCS_MTN_120min_resume.csv','w');
    
    for i=1:m_EMCS_awd
      
         fprintf(fid3, '%s,',emcs_mtn_selected_pks_values{i}.pks);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s,',emcs_mtn_selected_pks_values{i}.values);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, ', emcs_mtn_selected_pks_values{i}.SE );
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, %s,', emcs_mtn_selected_pks_values{i}.mean_SE, emcs_awd_selected_pks_values{i}.std_SE );
         fprintf(fid3, '%s, ', emcs_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid3, '\n');
         
    end
    
    fclose(fid3);
    
    
    

    
    %%  
    %%% MCS
%     
%     figure, plot(t_control_mtn, mean(MCS_mtn_aux))

    
    figure,plot(t_control_mtn, mean(MCS_awd_aux),'b', t_control_mtn, mean(MCS_mtn_aux), 'r', t_control_mtn, mean(MCS), 'k');
    title( 'Plot of all MCS patients (blue (awd files), red (mtn files) and black all together)','FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    [pks_mcs_awd, indx_pks_mcs_awd] = findpeaks(mean(MCS_awd_aux));
    
    [pks_mcs_mtn,indx_pks_mcs_mtn] = findpeaks(mean(MCS_mtn_aux));
    
    [pks_mcs,indx_pks_mcs] = findpeaks(mean(MCS));
    
    
    mcs_mtn_periods_at_max_SA = t_mcs_mtn(indx_pks_mcs_mtn)
    
    mcs_awd_periods_at_max_SA = t_mcs_mtn(indx_pks_mcs_awd)
    
    mcs_periods_at_max_SA = t_mcs_mtn(indx_pks_mcs)  
    

    %% MCS at subject level
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%   MCS:  AWD  Data                                %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    cd(path_code);
     
%     fid=fopen('MCS_awd_120min.csv','w');
%     fid2 = fopen('MCS_AWD_mean_std_cv_120min.csv','w');
    
    fid=fopen('MCS_awd_4days_int_cruze.csv','w');  % Pks value on the SE
    fid2 = fopen('MCS_AWD_mean_std_cv_4days_int_Cruze.csv','w');
    
    [m_MCS_awd, n_MCS_awd] = size(MCS_awd_aux);  % MSA
    [m_MCS_SE_awd, n_MCS_SE_awd] = size(MCS_mtn_SE_aux);  % SE
    
    number_of_pks_MCS_awd = [];
    figure,
    plot(MCS_awd_SE_aux(2,:))
    figure,
    plot(MCS_awd_aux(2,:))
    i =2
    for i=1:m_MCS_awd
        [pks_mcs_awd, indx_pks_mcs_awd] = findpeaks((MCS_awd_aux(i,:)));
        number_of_pks_MCS_awd = [number_of_pks_MCS_awd; length(indx_pks_mcs_awd)];
        
        pks_MSA_MCS_AWD{i} = t_mcs_mtn(indx_pks_mcs_awd);
        value_pks_MSA_MCS_AWD{i} = pks_mcs_awd;
        mcs_awd_selected_pks_values{i}.pks = t_mcs_mtn(indx_pks_mcs_awd);
        mcs_awd_selected_pks_values{i}.values = pks_mcs_awd;
        
        % This is the corresponding SE for the respective peaks found
        % previously:
        mcs_awd_selected_pks_values{i}.SE = MCS_awd_SE_aux(i,floor(t_mcs_mtn(indx_pks_mcs_awd)));  % I use floor, you can try with ceil :)
        fprintf(fid, '%s, ',mcs_awd_selected_pks_values{i}.SE);
        fprintf(fid, '\n ');
        
         
        mcs_awd_selected_pks_values{i}.std_SE = std(MCS_awd_SE_aux(i,:));
        mcs_awd_selected_pks_values{i}.mean_SE = mean(MCS_awd_SE_aux(i,:));
         
         % cv = std/mean
         % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
        mcs_awd_selected_pks_values{i}.cv_SE =  (mcs_awd_selected_pks_values{i}.std_SE)/(mcs_awd_selected_pks_values{i}.mean_SE); 
         
        fprintf(fid2, '%s, %s,', mcs_awd_selected_pks_values{i}.mean_SE, mcs_awd_selected_pks_values{i}.std_SE );
        fprintf(fid2, '%s, ', mcs_awd_selected_pks_values{i}.cv_SE );
        fprintf(fid2, '\n ');
        
        
    end
    fclose(fid);
    fclose(fid2);
   
%     Modified for 4 days    
%     indx_m_MCS_awd = zeros(m_MCS_awd,3); 
%     MSA_at_indx_m_MCS_awd = zeros(m_MCS_awd,3);
%     SE_at_indx_m_MCS_awd = zeros(m_MCS_SE_awd,3);

    indx_m_MCS_awd = zeros(m_MCS_awd,5); 
    pks_at_indx_m_MCS_awd = zeros(m_MCS_awd,5); 
    MSA_at_indx_m_MCS_awd = zeros(m_MCS_awd,5);
    SE_at_indx_m_MCS_awd = zeros(m_MCS_awd,5);


    for i=1:m_MCS_awd
        temp = pks_MSA_MCS_AWD{i};
        idx_temp = (pks_MSA_MCS_AWD{i} > 20 & pks_MSA_MCS_AWD{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_awd(i,1) = temp(temp_idx);
            pks_at_indx_m_MCS_awd(i,1) = mcs_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_awd(i,1) = mcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_awd(i,1) = mcs_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_MCS_AWD{i} >= 240 & pks_MSA_MCS_AWD{i} < 1140);%720
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_awd(i,2) = temp(temp_idx);
            pks_at_indx_m_MCS_awd(i,2) = mcs_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_awd(i,2) = mcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_awd(i,2) = mcs_awd_selected_pks_values{i}.SE(temp_idx);% SE
        end
        % from this part I modified the code to adapt for 4 days
        idx_temp = (pks_MSA_MCS_AWD{i} >= 1140 & pks_MSA_MCS_AWD{i} < 1680); % it was 1400, then 1512, them 1578, then 1680// change first interval to 1140 because of the first interval according with Cruze's paper
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_awd(i,3) = temp(temp_idx);
            pks_at_indx_m_MCS_awd(i,3) = mcs_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_awd(i,3) = mcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_awd(i,3) = mcs_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        idx_temp = (pks_MSA_MCS_AWD{i} >= 1680 & pks_MSA_MCS_AWD{i} < 2880); % it was 1578 and 1680
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_awd(i,4) = temp(temp_idx);
            pks_at_indx_m_MCS_awd(i,4) = mcs_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_awd(i,4) = mcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_awd(i,4) = mcs_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        idx_temp = (pks_MSA_MCS_AWD{i} >= 2880 & pks_MSA_MCS_AWD{i} < 5760); % it was 1400
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_awd(i,5) = temp(temp_idx);
            pks_at_indx_m_MCS_awd(i,5) = mcs_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_awd(i,5) = mcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_awd(i,5) = mcs_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        % end of the modified part for 4 days
    end
    
       
%     fid3=fopen('MCS_AWD_120min_resume.csv','w');
%  fid3=fopen('MCS_AWD_4days_resume.csv','w');

 fid31=fopen('MCS_AWD_4days_resume_pks.csv','w');
 fid32=fopen('MCS_AWD_4days_resume_MSA.csv','w');
 fid33=fopen('MCS_AWD_4days_resume_SE.csv','w');
 fid34=fopen('MCS_AWD_4days_resume_mean_std_cv.csv','w');
    
%     for i=1:m_MCS_awd
%       
%          fprintf(fid3, '%s,',mcs_awd_selected_pks_values{i}.pks);
%          fprintf(fid3, '\t,');
%          fprintf(fid3, '%s,',mcs_awd_selected_pks_values{i}.values);
%          fprintf(fid3, '\t,');
%          fprintf(fid3, '%s, ', mcs_awd_selected_pks_values{i}.SE );
%          fprintf(fid3, '\t,');
%          fprintf(fid3, '%s, %s,', mcs_awd_selected_pks_values{i}.mean_SE, mcs_awd_selected_pks_values{i}.std_SE );
%          fprintf(fid3, '%s, ', mcs_awd_selected_pks_values{i}.cv_SE );
%          fprintf(fid3, '\n');
%          
%     end
%     
%     fclose(fid3);
    
     for i=1:m_MCS_awd
      
         fprintf(fid31, '%s,',mcs_awd_selected_pks_values{i}.pks);
         fprintf(fid31, '\n,');
         fprintf(fid32, '%s,',mcs_awd_selected_pks_values{i}.values);
         fprintf(fid32, '\n,');
         fprintf(fid33, '%s, ', mcs_awd_selected_pks_values{i}.SE );
         fprintf(fid33, '\n,');
         fprintf(fid34, '%s, %s,', mcs_awd_selected_pks_values{i}.mean_SE, mcs_awd_selected_pks_values{i}.std_SE );
         fprintf(fid34, '%s, ', mcs_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid34, '\n');
         
    end
    
    fclose(fid31);
    fclose(fid32);
    fclose(fid33);
    fclose(fid34);

    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%   MCS:  MTN  Data                                %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     fid=fopen('MCS_mtn_120min.csv','w');
%     fid2 = fopen('MCS_MTN_mean_std_cv_120min.csv','w');
    fid=fopen('MCS_mtn_4days.csv_Int_Cruze','w');
    fid2 = fopen('MCS_MTN_mean_std_cv_4days_Int_Cruze.csv','w');

    
    [m_MCS_mtn, n_MCS_mtn] = size(MCS_mtn_aux); % MSA
    [m_MCS_SE_mtn, n_MCS_SE_mtn] = size(MCS_mtn_SE_aux);  % SE
    
    
    number_of_pks_MCS_mtn = [];

    for i=1:m_MCS_mtn
        [pks_mcs_mtn, indx_pks_mcs_mtn] = findpeaks((MCS_mtn_aux(i,:)));
        number_of_pks_MCS_mtn = [number_of_pks_MCS_mtn; length(indx_pks_mcs_mtn)];
        
         pks_MSA_MCS_MTN{i} = t_mcs_mtn(indx_pks_mcs_mtn);
         value_pks_MSA_MCS_MTN{i} = pks_mcs_mtn;
         mcs_mtn_selected_pks_values{i}.pks = t_mcs_mtn(indx_pks_mcs_mtn);
         mcs_mtn_selected_pks_values{i}.values = pks_mcs_mtn;
         
        % This is the corresponding SE for the respective peaks found
        % previously:
         mcs_mtn_selected_pks_values{i}.SE = MCS_mtn_SE_aux(i,floor(t_mcs_mtn(indx_pks_mcs_mtn)));  % I use floor, you can try with ceil :)
         fprintf(fid, '%s, ',mcs_mtn_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         mcs_mtn_selected_pks_values{i}.std_SE = std(MCS_mtn_SE_aux(i,:));
         mcs_mtn_selected_pks_values{i}.mean_SE = mean(MCS_mtn_SE_aux(i,:));
         
         % cv = std/mean
         % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         mcs_mtn_selected_pks_values{i}.cv_SE =  (mcs_mtn_selected_pks_values{i}.std_SE)/(mcs_mtn_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid2, '%s, %s,', mcs_mtn_selected_pks_values{i}.mean_SE, mcs_mtn_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', mcs_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
        
         
        
         
    end
    
    fclose(fid);
    fclose(fid2);
    
    indx_m_MCS_mtn = zeros(m_MCS_mtn,5);
    MSA_at_indx_m_MCS_mtn = zeros(m_MCS_mtn,5);
    SE_at_indx_m_MCS_mtn = zeros(m_MCS_mtn,5);
    pks_at_indx_m_MCS_mtn = zeros(m_MCS_mtn,5); 
    
    
    
    for i=1:m_MCS_mtn
        temp = pks_MSA_MCS_MTN{i};
        idx_temp = (pks_MSA_MCS_MTN{i} > 20 & pks_MSA_MCS_MTN{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_mtn(i,1) = temp(temp_idx);
            pks_at_indx_m_MCS_mtn(i,1) = mcs_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_mtn(i,1) = mcs_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_mtn(i,1) = mcs_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_MCS_MTN{i} >= 240 & pks_MSA_MCS_MTN{i} < 1140); %720
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_mtn(i,2) = temp(temp_idx);
            pks_at_indx_m_MCS_mtn(i,2) = mcs_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_mtn(i,2) = mcs_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_mtn(i,2) = mcs_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_MCS_MTN{i} >= 1140 & pks_MSA_MCS_MTN{i} < 1680); %720, 1578
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_mtn(i,3) = temp(temp_idx);
            pks_at_indx_m_MCS_mtn(i,3) = mcs_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_mtn(i,3) = mcs_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_mtn(i,3) = mcs_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
         idx_temp = (pks_MSA_MCS_MTN{i} >= 1680 & pks_MSA_MCS_MTN{i} < 2880); % it was 1578
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_mtn(i,4) = temp(temp_idx);
            pks_at_indx_m_MCS_mtn(i,4) = mcs_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_mtn(i,4) = mcs_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_mtn(i,4) = mcs_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        idx_temp = (pks_MSA_MCS_MTN{i} >= 2880 & pks_MSA_MCS_MTN{i} < 5760); % it was 1400
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_MCS_mtn(i,5) = temp(temp_idx);
            pks_at_indx_m_MCS_mtn(i,5) = mcs_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_MCS_mtn(i,5) = mcs_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_MCS_mtn(i,5) = mcs_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        
    end
   
    
    %%%%%%%%%%%%
    
 fid41=fopen('MCS_MTN_4days_resume_pks.csv','w');
 fid42=fopen('MCS_MTN_4days_resume_MSA.csv','w');
 fid43=fopen('MCS_MTN_4days_resume_SE.csv','w');
 fid44=fopen('MCS_MTN_4days_resume_mean_std_cv.csv','w');
    

     for i=1:m_MCS_mtn
      
         fprintf(fid41, '%s,',mcs_mtn_selected_pks_values{i}.pks);
         fprintf(fid41, '\n,');
         fprintf(fid42, '%s,',mcs_mtn_selected_pks_values{i}.values);
         fprintf(fid42, '\n,');
         fprintf(fid43, '%s, ', mcs_mtn_selected_pks_values{i}.SE );
         fprintf(fid43, '\n,');
         fprintf(fid44, '%s, %s,', mcs_mtn_selected_pks_values{i}.mean_SE, mcs_mtn_selected_pks_values{i}.std_SE );
         fprintf(fid44, '%s, ', mcs_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid44, '\n');
         
    end
    
    fclose(fid41);
    fclose(fid42);
    fclose(fid43);
    fclose(fid44);
    
    
    
    
    
    
    
    
    %%%%%%%%%%%%
    
%     fid3=fopen('MCS_MTN_120min_resume.csv','w');
% 
%    fid3=fopen('MCS_MTN_4days_resume.csv','w');
%     
%     for i=1:m_MCS_mtn
%       
%          fprintf(fid3, '%s,',mcs_mtn_selected_pks_values{i}.pks);
%          fprintf(fid3, '\t,');
%          fprintf(fid3, '%s,',mcs_mtn_selected_pks_values{i}.values);
%          fprintf(fid3, '\t,');
%          fprintf(fid3, '%s, ', mcs_mtn_selected_pks_values{i}.SE );
%          fprintf(fid3, '\t,');
%          fprintf(fid3, '%s, %s,', mcs_mtn_selected_pks_values{i}.mean_SE, mcs_mtn_selected_pks_values{i}.std_SE );
%          fprintf(fid3, '%s, ', mcs_mtn_selected_pks_values{i}.cv_SE );
%          fprintf(fid3, '\n');         
%     end
%     
%     
%     fclose(fid3);       
    
    
    %%     
    %%% UWS
    
    figure,plot(t_control_mtn, mean(UWS_awd_aux),'b', t_control_mtn, mean(UWS_mtn_aux), 'r', t_control_mtn, mean(UWS), 'k');
    title( 'Plot of all UWS patients (blue (awd files), red (mtn files) and black all together)','FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    [pks_uws_awd, indx_pks_uws_awd] = findpeaks(mean(UWS_awd_aux));
    
    [pks_uws_mtn,indx_pks_uws_mtn] = findpeaks(mean(UWS_mtn_aux));
    
    [pks_uws,indx_pks_uws] = findpeaks(mean(UWS));
    
    
    uws_mtn_periods_at_max_SA = t_uws_mtn(indx_pks_uws_mtn)
    
    uws_awd_periods_at_max_SA = t_uws_mtn(indx_pks_uws_awd)
    
    uws_periods_at_max_SA = t_uws_mtn(indx_pks_uws)  
    
    %% UWS at subject level
    
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%   UWS:  AWD  Data                                %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
     
%     fid=fopen('UWS_awd_120min.csv','w');
%     fid2 = fopen('UWS_AWD_mean_std_cv_120min.csv','w');


    fid=fopen('UWS_awd_4days_Int_Cruze.csv','w');
    fid2 = fopen('UWS_AWD_mean_std_4days_Int_Cruze.csv','w');
    
    [m_UWS_awd, n_UWS_awd] = size(UWS_awd_aux);  % MSA
    [m_UWS_SE_awd, n_UWS_SE_awd] = size(UWS_awd_SE_aux);  % SE
    
    
    number_of_pks_UWS_awd  = [];
    
  
    
           
    for i=1:m_UWS_awd
        [pks_UWS_awd, indx_pks_UWS_awd] = findpeaks((UWS_awd_aux(i,:)));
        number_of_pks_UWS_awd = [number_of_pks_UWS_awd; length(indx_pks_UWS_awd)];
        
         pks_MSA_UWS_AWD{i} = t_uws_mtn(indx_pks_UWS_awd);
         value_pks_MSA_UWS_AWD{i} = pks_UWS_awd;
         uws_awd_selected_pks_values{i}.pks = t_uws_mtn(indx_pks_UWS_awd);
         uws_awd_selected_pks_values{i}.values = pks_UWS_awd;
         
         % This is the corresponding SE for the respective peaks found
         % previously:
         uws_awd_selected_pks_values{i}.SE = UWS_awd_SE_aux(i,floor(t_uws_mtn(indx_pks_UWS_awd)));  % I use floor, you can try with ceil :)
         fprintf(fid, '%s, ',uws_awd_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         uws_awd_selected_pks_values{i}.std_SE = std(UWS_awd_SE_aux(i,:));
         uws_awd_selected_pks_values{i}.mean_SE = mean(UWS_awd_SE_aux(i,:));
         
         % cv = std/mean
         % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         uws_awd_selected_pks_values{i}.cv_SE =  (uws_awd_selected_pks_values{i}.std_SE)/(uws_awd_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid2, '%s, %s,', uws_awd_selected_pks_values{i}.mean_SE, uws_awd_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', uws_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
    
        
    end
    
    fclose(fid);
    fclose(fid2);
    
    %Debug%
%     i = 10
%     plot( t_control_mtn, UWS_awd_aux(i,:))
    
    
    
    indx_m_UWS_awd = zeros(m_UWS_awd,5);
    MSA_at_indx_m_UWS_awd = zeros(m_UWS_awd,5);
    SE_at_indx_m_UWS_awd = zeros(m_UWS_SE_awd,5);
    pks_at_indx_m_UWS_awd = zeros(m_UWS_SE_awd,5);
    
    for i=1:m_UWS_awd
        temp = pks_MSA_UWS_AWD{i};
        idx_temp = (pks_MSA_UWS_AWD{i} > 20 & pks_MSA_UWS_AWD{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,1) = temp(temp_idx);
            pks_at_indx_m_UWS_awd(i,1) = uws_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_awd(i,1) = uws_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_awd(i,1) = uws_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_UWS_AWD{i} >= 240 & pks_MSA_UWS_AWD{i} < 1140);  % it was 720, 1140
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,2) = temp(temp_idx);
            pks_at_indx_m_UWS_awd(i,2) = uws_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_awd(i,2) = uws_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_awd(i,2) = uws_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_UWS_AWD{i} >= 1140 & pks_MSA_UWS_AWD{i} < 1680); % It was 720, 1440, 1512 and 1578
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,3) = temp(temp_idx);
            pks_at_indx_m_UWS_awd(i,3) = uws_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_awd(i,3) = uws_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_awd(i,3) = uws_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
         idx_temp = (pks_MSA_UWS_AWD{i} >= 1680 & pks_MSA_UWS_AWD{i} < 2880);  % It was 1440, 1512 and 1578
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,4) = temp(temp_idx);
            pks_at_indx_m_UWS_awd(i,4) = uws_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_awd(i,4) = uws_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_awd(i,4) = uws_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_UWS_AWD{i} >= 2880 & pks_MSA_UWS_AWD{i} < 5760);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,5) = temp(temp_idx);
            pks_at_indx_m_UWS_awd(i,5) = uws_awd_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_awd(i,5) = uws_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_awd(i,5) = uws_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        
    end
    
    
%     fid3=fopen('UWS_AWD_120min_resume_pks.csv','w');
%     fid4=fopen('UWS_AWD_120min_resume_MSA.csv','w');
%     fid5=fopen('UWS_AWD_120min_resume_SE.csv','w');
    fid3=fopen('UWS_AWD_4days_resume_pks.csv','w');
    fid4=fopen('UWS_AWD_4days_resume_MSA.csv','w');
    fid5=fopen('UWS_AWD_4days_resume_SE.csv','w');
    
    for i=1:m_UWS_awd
      
         fprintf(fid3, '%s,',uws_awd_selected_pks_values{i}.pks);
         fprintf(fid3, '\n,');
         fprintf(fid4, '%s,',uws_awd_selected_pks_values{i}.values);
         fprintf(fid4, '\n,');
         fprintf(fid5, '%s, ', uws_awd_selected_pks_values{i}.SE );
         fprintf(fid5, '\n,');
         
    end
    
    
    fclose(fid3);   
    fclose(fid4); 
    fclose(fid5); 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%   UWS:  MTN  Data                                %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
%      fid=fopen('UWS_mtn_120min.csv','w');
%      fid2 = fopen('UWS_MTN_mean_std_cv_120min.csv','w');

     fid=fopen('UWS_mtn_4days_Int_Cruze.csv','w');
     fid2 = fopen('UWS_MTN_mean_std_cv_4days_Int_Cruze.csv','w');

    
    [m_UWS_mtn, n_UWS_mtn] = size(UWS_mtn_aux); % MSA
    [m_UWS_SE_mtn, n_UWS_SE_mtn] = size(UWS_mtn_SE_aux);  % SE  
    
    number_of_pks_UWS_mtn = [];

    for i=1:m_UWS_mtn
        [pks_UWS_mtn, indx_pks_UWS_mtn] = findpeaks((UWS_mtn_aux(i,:)));
         pks_MSA_UWS_MTN{i} = t_uws_mtn(indx_pks_UWS_mtn);
         number_of_pks_UWS_mtn = [number_of_pks_UWS_mtn; length(indx_pks_UWS_mtn)];
         
         value_pks_MSA_UWS_MTN{i} = pks_UWS_mtn;
         uws_mtn_selected_pks_values{i}.pks = t_uws_mtn(indx_pks_UWS_mtn);
         uws_mtn_selected_pks_values{i}.values = pks_UWS_mtn;
         
       % This is the corresponding SE for the respective peaks found
       % previously:
       
         uws_mtn_selected_pks_values{i}.SE = UWS_mtn_SE_aux(i,floor(t_uws_mtn(indx_pks_UWS_mtn)));  % I use floor, you can try with ceil :)
         fprintf(fid, '%s, ',uws_mtn_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         uws_mtn_selected_pks_values{i}.std_SE = std(MCS_mtn_SE_aux(i,:));
         uws_mtn_selected_pks_values{i}.mean_SE = mean(MCS_mtn_SE_aux(i,:));
         
         % cv = std/mean
         % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         uws_mtn_selected_pks_values{i}.cv_SE =  (uws_mtn_selected_pks_values{i}.std_SE)/(uws_mtn_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid2, '%s, %s,', uws_mtn_selected_pks_values{i}.mean_SE, uws_mtn_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', uws_mtn_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
         
         
    end
    
    
    fclose(fid);
    fclose(fid2);
    
    
    
%     i = 8
%     plot( t_control_mtn, UWS_mtn_aux(i,:))
    
    
    
   indx_m_UWS_mtn = zeros(m_UWS_mtn,5);
   MSA_at_indx_m_UWS_mtn = zeros(m_UWS_mtn,5);
   SE_at_indx_m_UWS_mtn = zeros(m_UWS_mtn,5);
   pks_at_indx_m_UWS_mtn = zeros(m_UWS_mtn,5);
   
   
    for i=1:m_UWS_mtn
        temp = pks_MSA_UWS_MTN{i};
        idx_temp = (pks_MSA_UWS_MTN{i} > 20 & pks_MSA_UWS_MTN{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_mtn(i,1) = temp(temp_idx);
            pks_at_indx_m_UWS_mtn(i,1) = uws_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_mtn(i,1) = uws_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_mtn(i,1) = uws_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_UWS_MTN{i} >= 240 & pks_MSA_UWS_MTN{i} < 1140); % 720
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_mtn(i,2) = temp(temp_idx);
            pks_at_indx_m_UWS_mtn(i,2) = uws_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_mtn(i,2) = uws_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_mtn(i,2) = uws_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_UWS_MTN{i} >= 1140 & pks_MSA_UWS_MTN{i} < 1680);  % It was 1440, 1512 and 1578, then 1680 first interval %720
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_mtn(i,3) = temp(temp_idx);
            pks_at_indx_m_UWS_mtn(i,3) = uws_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_mtn(i,3) = uws_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_mtn(i,3) = uws_mtn_selected_pks_values{i}.SE(temp_idx); % SE
            
        end
         idx_temp = (pks_MSA_UWS_MTN{i} >= 1680 & pks_MSA_UWS_MTN{i} < 2880);   % It was 1440, 1512 and 1578. first interval 1680
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,4) = temp(temp_idx);
            pks_at_indx_m_UWS_mtn(i,4) = uws_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_mtn(i,4) = uws_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_mtn(i,4) = uws_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        idx_temp = (pks_MSA_UWS_MTN{i} >= 2880 & pks_MSA_UWS_MTN{i} < 5760);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp);
            indx_m_UWS_awd(i,5) = temp(temp_idx);
            pks_at_indx_m_UWS_mtn(i,5) = uws_mtn_selected_pks_values{i}.pks(temp_idx);
            MSA_at_indx_m_UWS_mtn(i,5) = uws_mtn_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_UWS_mtn(i,5) = uws_mtn_selected_pks_values{i}.SE(temp_idx); % SE
        end
        
        
    end
    
    
%     fid3=fopen('UWS_MTN_120min_resume_pks.csv','w');
%     fid4=fopen('UWS_MTN_120min_resume_MSA.csv','w');
%     fid5=fopen('UWS_MTN_120min_resume_SE.csv','w');
%     


    fid3=fopen('UWS_MTN_4days_resume_pks.csv','w');
    fid4=fopen('UWS_MTN_4days_resume_MSA.csv','w');
    fid5=fopen('UWS_MTN_4days_resume_SE.csv','w');
    


    
    for i=1:m_UWS_mtn
      
         fprintf(fid3, '%s,',uws_mtn_selected_pks_values{i}.pks);
         fprintf(fid3, '\n,');
         fprintf(fid4, '%s,',uws_mtn_selected_pks_values{i}.values);
         fprintf(fid4, '\n,');
         fprintf(fid5, '%s, ', uws_mtn_selected_pks_values{i}.SE );
         fprintf(fid5, '\n,');
         
    end
    
    
    fclose(fid3);   
    fclose(fid4); 
    fclose(fid5); 
    
%%  Creating the structure for the statistical analysis

%group_table.manufacturer(1:length(number_of_pks_EMCS_awd)) = zeros(length(number_of_pks_EMCS_awd),1)
% group_table.manufacturer = zeros(length(number_of_pks_EMCS_awd),1)
% group_table.manufacturer(1:length(number_of_pks_MCS_awd)) = zeros(length(number_of_pks_MCS_awd),1)

group_table_manufacturer_EMCS= []; % 0: AWD  1:MTN
group_table_manufacturer_MCS= []; % 0: AWD  1:MTN
group_table_manufacturer_UWS= []; % 0: AWD  1:MTN
%group_table_csr =[]; % 0: LIS  1: EMCS, 2: MCS , 3: UWS
group_table_emcs = [];
group_table_mcs = [];
group_table_uws = [];
%group_table_number_pks = [];

group_table_number_pks_EMCS = [];
group_table_number_pks_MCS = [];
group_table_number_pks_UWS = [];

group_table_pk1_EMCS = [];
group_table_pk1_MCS = [];
group_table_pk1_UWS = [];




group_table = [];
    % EMCS
    group_table_manufacturer_EMCS = [group_table_manufacturer_EMCS; zeros(m_EMCS_awd,1)];
    group_table_manufacturer_EMCS = [group_table_manufacturer_EMCS; ones(m_EMCS_mtn,1)];
    group_table_number_pks_EMCS = [group_table_number_pks_EMCS; number_of_pks_EMCS_awd];
    group_table_number_pks_EMCS = [group_table_number_pks_EMCS; number_of_pks_EMCS_mtn];
    group_table_pk1_EMCS = [ group_table_pk1_EMCS; indx_m_EMCS_awd]
    group_table_pk1_EMCS = [ group_table_pk1_EMCS; indx_m_EMCS_mtn]
    
    
    
    
    
    group_table_emcs = [group_table_emcs; ones(m_EMCS_awd,1)];
    group_table_emcs = [group_table_emcs; ones(m_EMCS_mtn,1)];
    
    %UWS
    group_table_manufacturer_UWS = [group_table_manufacturer_UWS; zeros(m_UWS_awd,1)];
    group_table_manufacturer_UWS = [group_table_manufacturer_UWS; ones(m_UWS_mtn,1)];
    group_table_number_pks_UWS = [group_table_number_pks_UWS; number_of_pks_UWS_awd];
    group_table_number_pks_UWS = [group_table_number_pks_UWS; number_of_pks_UWS_mtn];
    group_table_pk1_UWS = [ group_table_pk1_UWS; indx_m_UWS_awd]
    group_table_pk1_UWS = [ group_table_pk1_UWS; indx_m_UWS_mtn]
    
    group_table_uws = [group_table_uws; 3.*ones(m_UWS_awd,1)];
    group_table_uws = [group_table_uws; 3.*ones(m_UWS_mtn,1)];
    
    
    %MCS
    group_table_manufacturer_MCS = [group_table_manufacturer_MCS; zeros(m_MCS_awd,1)];
    group_table_manufacturer_MCS = [group_table_manufacturer_MCS; ones(m_MCS_mtn,1)];
    group_table_number_pks_MCS = [group_table_number_pks_MCS; number_of_pks_MCS_awd];
    group_table_number_pks_MCS = [group_table_number_pks_MCS; number_of_pks_MCS_mtn];
    group_table_pk1_MCS = [ group_table_pk1_MCS; indx_m_MCS_awd]
    group_table_pk1_MCS = [ group_table_pk1_MCS; indx_m_MCS_mtn]
    
    group_table_mcs = [group_table_mcs; 2.*ones(m_MCS_awd,1)];
    group_table_mcs = [group_table_mcs; 2.*ones(m_MCS_mtn,1)];
    
    
    group_table_temp = [group_table_manufacturer_EMCS group_table_emcs group_table_number_pks_EMCS group_table_pk1_EMCS];
    group_table  = [group_table; group_table_temp];
    
    group_table_temp = [];
    group_table_temp = [group_table_manufacturer_UWS group_table_uws group_table_number_pks_UWS group_table_pk1_UWS];
    group_table  = [group_table; group_table_temp];
    
    
    group_table_temp = [];
    group_table_temp = [group_table_manufacturer_MCS group_table_mcs group_table_number_pks_MCS group_table_pk1_MCS];
    group_table  = [group_table; group_table_temp];
    
    
    
    
    
    

    

%%      Computing the area under the curve and the statistics for it
%
%
%       AUC: Area Under the Curve or tpz
%
%
% 
%%%%%%%%%%%%

indx_Controls = [ indx_m_CONTROL_awd;
                 indx_m_CONTROL_mtn];
         
indx_EMCS = [ indx_m_EMCS_awd;
              indx_m_EMCS_mtn];

indx_MCS = [ indx_m_MCS_awd;
             indx_m_MCS_mtn];        

indx_UWS = [ indx_m_UWS_awd;
             indx_m_UWS_mtn];  

[m_indx_Controls, n_indx_Controls] = size(indx_Controls)
[m_indx_EMCS, n_indx_EMCS] = size(indx_EMCS)
[m_indx_MCS, n_indx_MCS] = size(indx_MCS)
[m_indx_UWS, n_indx_UWS] = size(indx_UWS)


for i=1:m_indx_Controls
    tpz_Control(i,:) = trapz(indx_Controls(i,:))/length(indx_Controls(i,:));
end

for i=1:m_indx_EMCS
    tpz_EMCS(i,:) = trapz(indx_EMCS(i,:))/length(indx_EMCS(i,:));
end

for i=1:m_indx_MCS
    tpz_MCS(i,:) = trapz(indx_MCS(i,:))/length(indx_MCS(i,:));
end


for i=1:m_indx_UWS
    tpz_UWS(i,:) = trapz(indx_UWS(i,:))/length(indx_UWS(i,:));
end




[h_indx_emcs_uws,p_indx_emcs_uws]=ttest2(tpz_EMCS,tpz_UWS, 0.05,'left')
[h__inx_mcs_uws,p_indx_mcsVSuws]=ttest2(tpz_MCS,tpz_UWS, 0.05,'left')
   
    
   
    
    %% Plot of all 
    figure,
    hh = plot(t_control_mtn, mean(Controls), t_lis_mtn, mean(LIS),t_emcs_mtn, mean(EMCS),  t_mcs_mtn, mean(MCS), t_uws_mtn, mean(UWS) );
    legend(hh, 'Control', 'LIS','EMCS','MCS', 'UWS')
    title( 'Plot of Control, EMCS, LIS, MCS, and UWS','FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
     

    % Plot of all with the error bar or confidence interval
    figure
    y1_CC = mean(Controls);
    z1_CC = std(Controls)/sqrt (length(Controls));
    errorbar(t_control_mtn,y1_CC,z1_CC, 'b'); grid on;
    hold on
    y2_CC = mean (LIS);
    z2_CC = std (LIS)/sqrt (length(LIS));
    errorbar (t_lis_mtn, y2_CC,z2_CC, 'r'); grid on; 
    hold on;
    y3_CC = mean (EMCS);
    z3_CC = std (EMCS)/sqrt (length(EMCS));
    errorbar (t_lis_mtn, y3_CC,z3_CC, 'm'); grid on; 
    y4_CC = mean (MCS);
    z4_CC = std (MCS)/sqrt (length(MCS));
    errorbar (t_mcs_mtn, y4_CC,z4_CC, 'k'); grid on; 
    y5_CC = mean (UWS);
    z5_CC = std (UWS)/sqrt (length(UWS));
    errorbar (t_uws_mtn, y5_CC,z5_CC, 'c'); grid on; 
    title( 'Plot of Control (blue), LIS (red), EMCS(magenta), MCS(black), UWS(cyan)')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
  %% 
 %%%%%%%%%%%%%%%%%%%%%%%%5
 % Plot of the EMCS, MCS, and UWS
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
  figure,
    hh = plot(t_emcs_mtn, mean(EMCS),  t_mcs_mtn, mean(MCS), t_uws_mtn, mean(UWS) );
    legend(hh, 'EMCS','MCS', 'UWS')
    title( 'Plot of EMCS, MCS, and UWS','FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
     

    % Plot of all with the error bar or confidence interval
    figure
    y3_CC = mean (EMCS);
    z3_CC = std (EMCS)/sqrt (length(EMCS));
    errorbar (t_emcs_mtn, y3_CC,z3_CC, 'm'); grid on; 
    hold on;
    y4_CC = mean (MCS);
    z4_CC = std (MCS)/sqrt (length(MCS));
    errorbar (t_mcs_mtn, y4_CC,z4_CC, 'k'); grid on; 
    hold on;
    y5_CC = mean (UWS);
    z5_CC = std (UWS)/sqrt (length(UWS));
    errorbar (t_uws_mtn, y5_CC,z5_CC, 'c'); grid on; 
    title( 'Plot of EMCS(magenta), MCS(black), UWS(cyan)')
    ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
 
 
    
    

end
 
  cd(path_code);

end
