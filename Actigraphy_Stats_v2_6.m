function Actigraphy_Stats_v2_6(segment)

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

cd(path_code);

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
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%
 %%% Grouping the data of AWD and MTN files
 %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
    
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
%     
%     figure,plot(t_control_mtn, LIS);
%     figure,plot(t_control_mtn, EMCS);
%     figure,plot(t_control_mtn, MCS);
%     figure,plot(t_control_mtn, UWS);
%     title( 'Plot of all UWS patients','FontSize',14,'FontWeight','bold','Color','k')
%     ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
%     xlabel('time (min)');
    
    
    
    %%% Controls
    
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
    
    
        
    %%% LIS
    
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
    
    
    
    %%% EMCS
    
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
