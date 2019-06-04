function Actigraphy_Stats_v2_6_single_level_(segment)

clc
% clear all
close all

% segment = 'mtn_files'

path_code = '/home/aldo/Documents/Projects/Avtivemeter/Data';

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
    
elseif(strcmp(segment, 'comparison_msa_se'))
    
    %%%%%
    %%% Folder where the MSA data are
    %%%%%
    
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/';
    path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_whole_day/';
    path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day/';
    
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/';
    path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/';
    path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day/';     
  
    %%%%%
    %%% Folder where the SE data are
    %%%%%  
    
    path_control_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/SE/';
    path_lis_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_whole_day/SE/';
    path_emcs_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/SE/';
    path_mcs_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day/SE/';
    path_uws_awd_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day/SE/';
        
    path_control_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/SE/';
    path_lis_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/SE/';
    path_emcs_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/SE/';
    path_mcs_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day/SE/';
    path_uws_mtn_se = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day/SE/';     
    
    
    
  
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



if(strcmp(segment,'comparison') || strcmp(segment,'comparison_morning')   )
   
    
 cd(path_control_mtn);
 SUBJlist_Control_MTN = dir('*.mat');

 for i = 1:length(SUBJlist_Control_MTN)
    SUBJname_Control = SUBJlist_Control_MTN(i).name;
    data=load(SUBJname_Control);
    Control_mtn_aux(i,:,:) = data.aux;
 end
 t_control_mtn = data.time;


%%%%%% Import data for Group 2: Controls AWD files

 cd(path_control_awd);
 SUBJlist_Control_AWD = dir('*.mat');

 for i = 1:length(SUBJlist_Control_AWD)
    SUBJname_Control_AWD = SUBJlist_Control_AWD(i).name;
    data=load(SUBJname_Control_AWD);
    Control_awd_aux(i,:,:) = data.aux;
 end
 t_control_awd = data.time;


%%%%%% Import data for Group 3: EMCS AWD files

 cd(path_emcs_awd);
 SUBJlist_EMCS_AWD = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_AWD)
    SUBJname_EMCS_AWD = SUBJlist_EMCS_AWD(i).name;
    data=load(SUBJname_EMCS_AWD);
    EMCS_awd_aux(i,:,:) = data.aux;
 end
 t_emcs_awd = data.time;

%%%%%% Import data for Group 4: EMCS MTN files

 cd(path_emcs_mtn);
 SUBJlist_EMCS_MTN = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_MTN)
    SUBJname_EMCS_MTN = SUBJlist_EMCS_MTN(i).name;
    data=load(SUBJname_EMCS_MTN);
    EMCS_mtn_aux(i,:,:) = data.aux;
 end
 t_emcs_mtn = data.time;

 
 %%%%%% Import data for Group 5: LIS AWD files

 cd(path_lis_awd);
 SUBJlist_LIS_AWD = dir('*.mat');

 for i = 1:length(SUBJlist_LIS_AWD)
    SUBJname_LIS_AWD = SUBJlist_LIS_AWD(i).name;
    data=load(SUBJname_LIS_AWD);
    LIS_awd_aux(i,:,:) = data.aux;
 end
 t_lis_awd = data.time;

%%%%%% Import data for Group 6: LIS MTN files

 cd(path_lis_mtn);
 SUBJlist_LIS_MTN = dir('LIS*.mat');

 for i = 1:length(SUBJlist_LIS_MTN)
    SUBJname_LIS_MTN = SUBJlist_LIS_MTN(i).name;
    data=load(SUBJname_LIS_MTN);
    LIS_mtn_aux(i,:,:) = data.aux;
 end
 t_lis_mtn = data.time;
 
 
 %%%%%% Import data for Group 7: MCS AWD files

 cd(path_mcs_awd);
  SUBJlist_MCS_AWD = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_AWD)
    SUBJname_MCS_AWD = SUBJlist_MCS_AWD(i).name;
    data=load(SUBJname_MCS_AWD);
    MCS_awd_aux(i,:,:) = data.aux;
 end
 t_mcs_awd = data.time;
 
 
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
 
 
 %%%%%% Import data for Group 9: UWS AWD files

 cd(path_uws_awd);
 SUBJlist_UWS_AWD = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_AWD)
    SUBJname_UWS_AWD = SUBJlist_UWS_AWD(i).name;
    data=load(SUBJname_UWS_AWD);
    UWS_awd_aux(i,:,:) = data.aux;
 end
 t_uws_awd = data.time;
 
 
 %%%%%% Import data for Group 10: UWS MTN files

 cd(path_uws_mtn);
 SUBJlist_UWS_MTN = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_MTN)
    SUBJname_UWS_MTN = SUBJlist_UWS_MTN(i).name;
    data=load(SUBJname_UWS_MTN);
    UWS_mtn_aux(i,:,:) = data.aux;
 end
 t_uws_mtn = data.time;
%% 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%
 %%% Grouping the data of AWD and MTN files
 %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 cd(path_code);
    
    Controls = [ Control_mtn_aux;
                 Control_awd_aux];
         
    LIS = [ LIS_mtn_aux;
            LIS_awd_aux];         
         
    EMCS = [ EMCS_mtn_aux;
             EMCS_awd_aux];

    MCS = [ MCS_mtn_aux;
            MCS_awd_aux];        

    UWS = [ UWS_mtn_aux;
            UWS_awd_aux];         
        
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
        
    [m_Control_awd, n_Control_awd] = size(Control_awd_aux);

    for i=1:m_Control_awd
        [pks_Controls_awd, indx_pks_Controls_awd] = findpeaks((Control_awd_aux(i,:)));
         pks_MSA_Control_AWD{i} = t_control_mtn(indx_pks_Controls_awd);
         value_pks_MSA_CONTROL_AWD{i} = pks_Controls_awd;
         controls_awd_selected_pks_values{i}.pks = t_control_mtn(indx_pks_Controls_awd);
         controls_awd_selected_pks_values{i}.values = pks_Controls_awd;
    end
    
    indx_m_CONTROL_awd = zeros(m_Control_awd,3);
    for i=1:m_Control_awd
        temp = pks_MSA_Control_AWD{i};
        idx_temp = (pks_MSA_Control_AWD{i} > 20 & pks_MSA_Control_AWD{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_awd_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_awd(i,1) = temp(temp_idx)
        end
        
        idx_temp = (pks_MSA_Control_AWD{i} >= 240 & pks_MSA_Control_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_awd_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_awd(i,2) = temp(temp_idx)
        end
        idx_temp = (pks_MSA_Control_AWD{i} >= 720 & pks_MSA_Control_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_awd_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_awd(i,3) = temp(temp_idx)
        end
    end
    
    
    
    [m_Control_mtn, n_Control_mtn] = size(Control_mtn_aux);

    for i=1:m_Control_mtn
        [pks_Controls_mtn, indx_pks_Controls_mtn] = findpeaks((Control_mtn_aux(i,:)));
         pks_MSA_Control_MTN{i} = t_control_mtn(indx_pks_Controls_mtn);
         value_pks_MSA_CONTROL_MTN{i} = pks_Controls_mtn;
         controls_mtn_selected_pks_values{i}.pks = t_control_mtn(indx_pks_Controls_mtn);
         controls_mtn_selected_pks_values{i}.values = pks_Controls_mtn;
    end
    
    
    indx_m_CONTROL_mtn = zeros(m_Control_mtn,3);
    
    for i=1:m_Control_mtn
        temp = pks_MSA_Control_MTN{i};
        idx_temp = (pks_MSA_Control_MTN{i} > 20 & pks_MSA_Control_MTN{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_mtn(i,1) = temp(temp_idx)
        end
        
        idx_temp = (pks_MSA_Control_MTN{i} >= 240 & pks_MSA_Control_MTN{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_mtn(i,2) = temp(temp_idx)
        end
        idx_temp = (pks_MSA_Control_MTN{i} >= 720 & pks_MSA_Control_MTN{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(controls_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(controls_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_CONTROL_mtn(i,3) = temp(temp_idx)
        end
    end
  
        
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
        
    [m_EMCS_awd, n_EMCS_awd] = size(EMCS_awd_aux);
    
    number_of_pks_EMCS_awd = [];
    
    for i=1:m_EMCS_awd
        [pks_emcs_awd, indx_pks_emcs_awd] = findpeaks((EMCS_awd_aux(i,:)));
        number_of_pks_EMCS_awd = [number_of_pks_EMCS_awd; length(indx_pks_emcs_awd)];
      
         pks_MSA_EMCS_AWD{i} = t_emcs_mtn(indx_pks_emcs_awd);
         value_pks_MSA_EMCS_AWD{i} = pks_emcs_awd;
         emcs_awd_selected_pks_values{i}.pks = t_emcs_mtn(indx_pks_emcs_awd);
         emcs_awd_selected_pks_values{i}.values = pks_emcs_awd;
    end
    
    indx_m_EMCS_awd = zeros(m_EMCS_awd,3);
    MSA_at_indx_m_EMCS_awd = zeros(m_EMCS_awd,3);
    for i=1:m_EMCS_awd
        temp = pks_MSA_EMCS_AWD{i};
        idx_temp = (pks_MSA_EMCS_AWD{i} > 20 & pks_MSA_EMCS_AWD{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_awd(i,1) = temp(temp_idx)
            MSA_at_indx_m_EMCS_awd(i,1) = emcs_awd_selected_pks_values{i}.values(temp_idx)
        end
        
        idx_temp = (pks_MSA_EMCS_AWD{i} >= 240 & pks_MSA_EMCS_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_awd(i,2) = temp(temp_idx)
            MSA_at_indx_m_EMCS_awd(i,2) = emcs_awd_selected_pks_values{i}.values(temp_idx)
        end
        
        idx_temp = (pks_MSA_EMCS_AWD{i} >= 720 & pks_MSA_EMCS_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_awd(i,3) = temp(temp_idx)
            MSA_at_indx_m_EMCS_awd(i,3) = emcs_awd_selected_pks_values{i}.values(temp_idx)
        end
    end
    
    
    [m_EMCS_mtn, n_EMCS_mtn] = size(EMCS_mtn_aux);
    
    number_of_pks_EMCS_mtn = [];

    for i=1:m_EMCS_mtn
        [pks_emcs_mtn, indx_pks_emcs_mtn] = findpeaks((EMCS_mtn_aux(i,:)));
        number_of_pks_EMCS_mtn = [number_of_pks_EMCS_mtn; length(indx_pks_emcs_mtn)];
        
         pks_MSA_EMCS_MTN{i} = t_emcs_mtn(indx_pks_emcs_mtn);
         value_pks_MSA_EMCS_MTN{i} = pks_emcs_mtn;
         emcs_mtn_selected_pks_values{i}.pks = t_emcs_mtn(indx_pks_emcs_awd);
         emcs_mtn_selected_pks_values{i}.values = pks_emcs_mtn;
    end
%      plot(EMCS_mtn_aux')
     
   indx_m_EMCS_mtn = zeros(m_EMCS_mtn,3);
   MSA_at_indx_m_EMCS_mtn = zeros(m_EMCS_mtn,3);
    
    for i=1:m_EMCS_mtn
        temp = pks_MSA_EMCS_MTN{i};
        idx_temp = (pks_MSA_EMCS_MTN{i} > 20 & pks_MSA_EMCS_MTN{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_mtn(i,1) = temp(temp_idx)
            MSA_at_indx_m_EMCS_mtn(i,1) = emcs_mtn_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_EMCS_MTN{i} >= 240 & pks_MSA_EMCS_MTN{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_mtn(i,2) = temp(temp_idx)
            MSA_at_indx_m_EMCS_mtn(i,2) = emcs_mtn_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_EMCS_MTN{i} >= 720 & pks_MSA_EMCS_MTN{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(emcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_EMCS_mtn(i,3) = temp(temp_idx)
            MSA_at_indx_m_EMCS_mtn(i,3) = emcs_mtn_selected_pks_values{i}.values(temp_idx)
        end
    end
   
    
    
    %%  
    %%% MCS
    
    figure, plot(t_control_mtn, mean(MCS_mtn_aux))
    
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
    
    [m_MCS_awd, n_MCS_awd] = size(MCS_awd_aux);
    
    
    number_of_pks_MCS_awd = [];
    
    for i=1:m_MCS_awd
        [pks_mcs_awd, indx_pks_mcs_awd] = findpeaks((MCS_awd_aux(i,:)));
        number_of_pks_MCS_awd = [number_of_pks_MCS_awd; length(indx_pks_mcs_awd)];
        
        pks_MSA_MCS_AWD{i} = t_mcs_mtn(indx_pks_mcs_awd);
        value_pks_MSA_MCS_AWD{i} = pks_mcs_awd;
        mcs_awd_selected_pks_values{i}.pks = t_mcs_mtn(indx_pks_emcs_awd);
        mcs_awd_selected_pks_values{i}.values = pks_mcs_awd;
    end
    
    indx_m_MCS_awd = zeros(m_MCS_awd,3);
    MSA_at_indx_m_MCS_awd = zeros(m_MCS_awd,3);
    
    for i=1:m_MCS_awd
        temp = pks_MSA_MCS_AWD{i};
        idx_temp = (pks_MSA_MCS_AWD{i} > 20 & pks_MSA_MCS_AWD{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp)
            indx_m_MCS_awd(i,1) = temp(temp_idx)
            MSA_at_indx_m_MCS_awd(i,1) = mcs_awd_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_MCS_AWD{i} >= 240 & pks_MSA_MCS_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp)
            indx_m_MCS_awd(i,2) = temp(temp_idx)
            MSA_at_indx_m_MCS_awd(i,2) = mcs_awd_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_MCS_AWD{i} >= 720 & pks_MSA_MCS_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(mcs_awd_selected_pks_values{i}.values == max_temp)
            indx_m_MCS_awd(i,3) = temp(temp_idx)
            MSA_at_indx_m_MCS_awd(i,3) = mcs_awd_selected_pks_values{i}.values(temp_idx)
        end
   end
    
    
    
    
    
    [m_MCS_mtn, n_MCS_mtn] = size(MCS_mtn_aux);
    
    number_of_pks_MCS_mtn = [];

    for i=1:m_MCS_mtn
        [pks_mcs_mtn, indx_pks_mcs_mtn] = findpeaks((MCS_mtn_aux(i,:)));
        number_of_pks_MCS_mtn = [number_of_pks_MCS_mtn; length(indx_pks_mcs_mtn)];
        
         pks_MSA_MCS_MTN{i} = t_mcs_mtn(indx_pks_mcs_mtn);
         value_pks_MSA_MCS_MTN{i} = pks_mcs_mtn;
         mcs_mtn_selected_pks_values{i}.pks = t_mcs_mtn(indx_pks_mcs_mtn);
         mcs_mtn_selected_pks_values{i}.values = pks_mcs_mtn;
    end
    
    indx_m_MCS_mtn = zeros(m_MCS_mtn,3);
    MSA_at_indx_m_MCS_mtn = zeros(m_MCS_mtn,3);
    
    for i=1:m_MCS_mtn
        temp = pks_MSA_MCS_MTN{i};
        idx_temp = (pks_MSA_MCS_MTN{i} > 20 & pks_MSA_MCS_MTN{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_MCS_mtn(i,1) = temp(temp_idx)
            MSA_at_indx_m_MCS_mtn(i,1) = mcs_mtn_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_MCS_MTN{i} >= 240 & pks_MSA_MCS_MTN{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_MCS_mtn(i,2) = temp(temp_idx)
            MSA_at_indx_m_MCS_mtn(i,2) = mcs_mtn_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_MCS_MTN{i} >= 720 & pks_MSA_MCS_MTN{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(mcs_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(mcs_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_MCS_mtn(i,3) = temp(temp_idx)
            MSA_at_indx_m_MCS_mtn(i,3) = mcs_mtn_selected_pks_values{i}.values(temp_idx)
        end
   end
    
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
    
    [m_UWS_awd, n_UWS_awd] = size(UWS_awd_aux);
    
    number_of_pks_UWS_awd  = [];
           
    for i=1:m_UWS_awd
        [pks_UWS_awd, indx_pks_UWS_awd] = findpeaks((UWS_awd_aux(i,:)));
        number_of_pks_UWS_awd = [number_of_pks_UWS_awd; length(indx_pks_UWS_awd)];
        
         pks_MSA_UWS_AWD{i} = t_uws_mtn(indx_pks_UWS_awd);
         value_pks_MSA_UWS_AWD{i} = pks_UWS_awd;
         uws_awd_selected_pks_values{i}.pks = t_uws_mtn(indx_pks_UWS_awd);
         uws_awd_selected_pks_values{i}.values = pks_UWS_awd;
    end
    
    indx_m_UWS_awd = zeros(m_UWS_awd,3);
    MSA_at_indx_m_UWS_awd = zeros(m_UWS_awd,3);
    
    
    for i=1:m_UWS_awd
        temp = pks_MSA_UWS_AWD{i};
        idx_temp = (pks_MSA_UWS_AWD{i} > 20 & pks_MSA_UWS_AWD{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp)
            indx_m_UWS_awd(i,1) = temp(temp_idx)
            MSA_at_indx_m_UWS_awd(i,1) = uws_awd_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_UWS_AWD{i} >= 240 & pks_MSA_UWS_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp)
            indx_m_UWS_awd(i,2) = temp(temp_idx)
            MSA_at_indx_m_UWS_awd(i,2) = uws_awd_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_UWS_AWD{i} >= 720 & pks_MSA_UWS_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_awd_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(uws_awd_selected_pks_values{i}.values == max_temp)
            indx_m_UWS_awd(i,3) = temp(temp_idx)
            MSA_at_indx_m_UWS_awd(i,3) = uws_awd_selected_pks_values{i}.values(temp_idx)
        end
    end
    
    
    
        
    
    [m_UWS_mtn, n_UWS_mtn] = size(UWS_mtn_aux);
    
    number_of_pks_UWS_mtn = [];

    for i=1:m_UWS_mtn
        [pks_UWS_mtn, indx_pks_UWS_mtn] = findpeaks((UWS_mtn_aux(i,:)));
         pks_MSA_UWS_MTN{i} = t_uws_mtn(indx_pks_UWS_mtn);
         number_of_pks_UWS_mtn = [number_of_pks_UWS_mtn; length(indx_pks_UWS_mtn)];
         
         value_pks_MSA_UWS_MTN{i} = pks_UWS_mtn;
         uws_mtn_selected_pks_values{i}.pks = t_uws_mtn(indx_pks_UWS_mtn);
         uws_mtn_selected_pks_values{i}.values = pks_UWS_mtn;
    end
    
   indx_m_UWS_mtn = zeros(m_UWS_mtn,3);
   MSA_at_indx_m_UWS_mtn = zeros(m_UWS_mtn,3);
   
   
    for i=1:m_UWS_mtn
        temp = pks_MSA_UWS_MTN{i};
        idx_temp = (pks_MSA_UWS_MTN{i} > 20 & pks_MSA_UWS_MTN{i} < 240);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_UWS_mtn(i,1) = temp(temp_idx)
            MSA_at_indx_m_UWS_mtn(i,1) = uws_mtn_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_UWS_MTN{i} >= 240 & pks_MSA_UWS_MTN{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_UWS_mtn(i,2) = temp(temp_idx)
            MSA_at_indx_m_UWS_mtn(i,2) = uws_mtn_selected_pks_values{i}.values(temp_idx)
        end
        idx_temp = (pks_MSA_UWS_MTN{i} >= 720 & pks_MSA_UWS_MTN{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(uws_mtn_selected_pks_values{i}.values(idx_temp))
            temp_idx = find(uws_mtn_selected_pks_values{i}.values == max_temp)
            indx_m_UWS_mtn(i,3) = temp(temp_idx)
            MSA_at_indx_m_UWS_mtn(i,3) = uws_mtn_selected_pks_values{i}.values(temp_idx)
        end
    end
    
    
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
   
 
    
    

end
 
  cd(path_code);

end
