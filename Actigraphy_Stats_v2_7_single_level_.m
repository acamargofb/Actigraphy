function Actigraphy_Stats_v2_7_single_level_(segment)

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
    
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_120min/SE/';
    path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_120min/SE/';
    path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_120min/SE/';
    path_mcs_p_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_120min/SE/';
    path_mcs_m_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_120min/SE/';
    path_mcs_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_120min/SE/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_120min/SE/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_120min/SE/';
    path_uws_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_120min/SE/';
    
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_120min/SE/';
    path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_120min/SE/';
    path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_120min/SE/';
    path_mcs_p_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_120min/SE/';
    path_mcs_m_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_120min/SE/';
    path_mcs_ast_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_120min/SE/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_120min/SE/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_120min/SE/';     
    
    max_indx = 120;
 
  
elseif(strcmp(segment, 'comparison'))
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/SE_whole_day/SE/';
    path_lis_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/SE_whole_day/SE/';
    path_emcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/SE_whole_day/SE/';
    path_mcs_p_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/SE_whole_day/SE/';
    path_mcs_m_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/SE_whole_day/SE/';
    path_mcs_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS_ast/SE_whole_day/SE/';
    path_mcs_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/SE_whole_day/SE/';
    path_uws_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/SE_whole_day/SE/';
    path_uws_ast_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS_ast/SE_whole_day/SE/';
    
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/SE_whole_day/SE/';
    path_lis_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/SE_whole_day/SE/';
    path_emcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/SE_whole_day/SE/';
    path_mcs_p_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/SE_whole_day/SE/';
    path_mcs_m_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/SE_whole_day/SE/';
    path_mcs_ast_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/SE_whole_day/SE/';
    path_mcs_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/SE_whole_day/SE/';
    path_uws_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/SE_whole_day/SE/';     
    
    max_indx = 1400;
 
  
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


   
    
 cd(path_control_mtn);
 SUBJlist_Control_MTN = dir('*.mat');

 for i = 1:length(SUBJlist_Control_MTN)
    SUBJname_Control = SUBJlist_Control_MTN(i).name;
    data=load(SUBJname_Control);
    Control_mtn_SE(i,:) = data.aux;
 end
 t_control_mtn = data.t_aux;


%%%%%% Import data for Group 2: Controls AWD files

 cd(path_control_awd);
 SUBJlist_Control_AWD = dir('*.mat');

 for i = 1:length(SUBJlist_Control_AWD)
    SUBJname_Control_AWD = SUBJlist_Control_AWD(i).name;
    data=load(SUBJname_Control_AWD);
    Control_awd_SE(i,:) = data.aux;
 end
 t_control_awd = data.t_aux;


%%%%%% Import data for Group 3: EMCS AWD files

 cd(path_emcs_awd);
 SUBJlist_EMCS_AWD = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_AWD)
    SUBJname_EMCS_AWD = SUBJlist_EMCS_AWD(i).name;
    data=load(SUBJname_EMCS_AWD);
    EMCS_awd_SE(i,:) = data.aux;
 end
 t_emcs_awd = data.t_aux;

%%%%%% Import data for Group 4: EMCS MTN files

 cd(path_emcs_mtn);
 SUBJlist_EMCS_MTN = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_MTN)
    SUBJname_EMCS_MTN = SUBJlist_EMCS_MTN(i).name;
    data=load(SUBJname_EMCS_MTN);
    EMCS_mtn_SE(i,:) = data.aux;
 end
 t_emcs_mtn = data.t_aux;

 
 %%%%%% Import data for Group 5: LIS AWD files

 cd(path_lis_awd);
 SUBJlist_LIS_AWD = dir('*.mat');

 for i = 1:length(SUBJlist_LIS_AWD)
    SUBJname_LIS_AWD = SUBJlist_LIS_AWD(i).name;
    data=load(SUBJname_LIS_AWD);
    LIS_awd_SE(i,:) = data.aux;
 end
 t_lis_awd = data.t_aux;

%%%%%% Import data for Group 6: LIS MTN files

 cd(path_lis_mtn);
 SUBJlist_LIS_MTN = dir('LIS*.mat');

 for i = 1:length(SUBJlist_LIS_MTN)
    SUBJname_LIS_MTN = SUBJlist_LIS_MTN(i).name;
    data=load(SUBJname_LIS_MTN);
    LIS_mtn_SE(i,:) = data.aux;
 end
 t_lis_mtn = data.t_aux;
 
 
 %%%%%% Import data for Group 7: MCS AWD files

 cd(path_mcs_awd);
  SUBJlist_MCS_AWD = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_AWD)
    SUBJname_MCS_AWD = SUBJlist_MCS_AWD(i).name;
    data=load(SUBJname_MCS_AWD);
    MCS_awd_SE(i,:) = data.aux;
 end
 t_mcs_awd = data.t_aux;
 
 
 %%%%%% Import data for Group 8: MCS MTN files

 cd(path_mcs_mtn);
 
 %cd(path_mcs_p_mtn);
 SUBJlist_MCS_MTN = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_MTN)
    SUBJname_MCS_MTN = SUBJlist_MCS_MTN(i).name;
    data=load(SUBJname_MCS_MTN);
    MCS_mtn_SE(i,:) = data.aux;
 end
 t_mcs_mtn = data.t_aux;
 
 % test of the code
 %figure, plot(t_mcs_mtn, mean(MCS_mtn_aux));
 
 
 %%%%%% Import data for Group 9: UWS AWD files

 cd(path_uws_awd);
 SUBJlist_UWS_AWD = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_AWD)
    SUBJname_UWS_AWD = SUBJlist_UWS_AWD(i).name;
    data=load(SUBJname_UWS_AWD);
    UWS_awd_SE(i,:) = data.aux;
 end
 t_uws_awd = data.t_aux;
 
 
 %%%%%% Import data for Group 10: UWS MTN files

 cd(path_uws_mtn);
 SUBJlist_UWS_MTN = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_MTN)
    SUBJname_UWS_MTN = SUBJlist_UWS_MTN(i).name;
    data=load(SUBJname_UWS_MTN);
    UWS_mtn_SE(i,:) = data.aux;
 end
 t_uws_mtn = data.t_aux;
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%
 %%% Grouping the data of AWD and MTN files
 %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
    Controls = [ Control_mtn_SE;
                 Control_awd_SE];
         
    LIS = [ LIS_mtn_SE;
            LIS_awd_SE];         
         
    EMCS = [ EMCS_mtn_SE;
             EMCS_awd_SE];

    MCS = [ MCS_mtn_SE;
            MCS_awd_SE];        

    UWS = [ UWS_mtn_SE;
            UWS_awd_SE];         
        
%     figure,plot(t_control_mtn, Control_mtn_SE);
    
    
%     figure,plot(t_control_mtn, LIS);
%     figure,plot(t_control_mtn, EMCS);
%     figure,plot(t_control_mtn, MCS);
%     figure,plot(t_control_mtn, UWS);
%     title( 'Plot of all UWS patients','FontSize',14,'FontWeight','bold','Color','k')
%     ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
%     xlabel('time (min)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Computing the area under the curve and the statistics for it
%
%
%   Doing the same stats as Andrea's paper
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Controls_ = Controls(:,1:max_indx);
    LIS_ = LIS(:,1:max_indx);
    EMCS_ = EMCS(:,1:max_indx);
    MCS_ = MCS(:,1:max_indx);
    UWS_ = UWS(:,1:max_indx);
        
%     figure, plot(Controls_');
%     figure, plot(LIS_');
%     figure, plot(EMCS_');
%     figure, plot(MCS_');
%     figure, plot(UWS_');
    
    %%%%%%%%%%%%%%%%%%%%%    
    %%% Controls  %%%%%%%
    %%%%%%%%%%%%%%%%%%%%%
    
    mean_SE_Controls = mean(Controls_,2);
    std_SE_Controls = std(Controls_,[], 2);
    cv_SE_Controls = std_SE_Controls./mean_SE_Controls;  % coefficient of variation (CV)
    
    
    mean(mean_SE_Controls)
    mean(std_SE_Controls)
    mean(cv_SE_Controls)
%     
    %%%%%%%%%%%%%%%    
    %%% LIS  %%%%%%
    %%%%%%%%%%%%%%%
    
    mean_SE_LIS = mean(LIS_,2);
    std_SE_LIS = std(LIS_,[], 2);
    cv_SE_LIS = std_SE_LIS./mean_SE_LIS;
    
    
    mean(mean_SE_LIS)
    mean(std_SE_LIS)
    mean(cv_SE_LIS)
    
    
    [h_LIS,p_LIS] = ttest2(mean_SE_Controls,mean_SE_LIS,0.05)
    [h_LIS_std,p_LIS_std] = ttest2(std_SE_Controls,std_SE_LIS,0.05)
    [h_LIS_cv,p_LIS_cv] = ttest2(cv_SE_Controls,cv_SE_LIS,0.05)
    
    %t_control_mtn = t_control_mtn(1):(t_control_mtn(2));
    t_control_mtn = 1:max_indx;
    
    figure,
    plot(t_control_mtn, mean(Controls_), 'b', t_control_mtn, mean(LIS_), 'g')
    
    title( 'Plot of Controls (blue) vs LIS (green)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
        
    
    %%% EMCS
        
    mean_SE_EMCS = mean(EMCS_,2);
    std_SE_EMCS = std(EMCS_, [], 2);
    cv_SE_EMCS = std_SE_EMCS./mean_SE_EMCS;
    
    
    mean(mean_SE_EMCS)
    mean(std_SE_EMCS)
    mean(cv_SE_EMCS)
    
    
    [h_EMCS,p_EMCS] = ttest2(mean_SE_Controls,mean_SE_EMCS,0.05)
    [h_EMCS_std,p_EMCS_std] = ttest2(std_SE_Controls,std_SE_EMCS,0.05)
    [h_EMCS_cv,p_EMCS_cv] = ttest2(cv_SE_Controls,cv_SE_EMCS,0.05)
    
    figure,
    plot(t_control_mtn, mean(Controls_), 'b', t_control_mtn, mean(EMCS_), 'g')
    
    title( 'Plot of Controls (blue) vs EMCS (green)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    %%% MCS
    
    mean_SE_MCS = mean(MCS_,2);
    std_SE_MCS = std(MCS_,[],2);
    cv_SE_MCS = std_SE_MCS./mean_SE_MCS;
    
    mean(mean_SE_MCS)
    mean(std_SE_MCS)
    mean(cv_SE_MCS)
    
    
    
    [h_MCS,p_MCS] = ttest2(mean_SE_Controls,mean_SE_MCS,0.05)
    [h_MCS_std,p_MCS_std] = ttest2(std_SE_Controls,std_SE_MCS,0.05)
    [h_MCS_cv,p_MCS_cv] = ttest2(cv_SE_Controls,cv_SE_MCS,0.05)
        
        
    figure,
    plot(t_control_mtn, mean(Controls_), 'b', t_control_mtn, mean(MCS_), 'g')
    
    title( 'Plot of Controls (blue) vs MCS (green)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    
    %%% UWS
    
    mean_SE_UWS = mean(UWS_,2);
    std_SE_UWS = std(UWS_,[],2);
    cv_SE_UWS = std_SE_UWS./mean_SE_UWS;
    
    
    mean(mean_SE_UWS)
    mean(std_SE_UWS)
    mean(cv_SE_UWS)
    
    [h_UWS,p_UWS] = ttest2(mean_SE_Controls,mean_SE_UWS,0.05)
    [h_UWS_std,p_UWS_std] = ttest2(std_SE_Controls,std_SE_UWS,0.05)
    [h_UWS_cv,p_UWS_cv] = ttest2(cv_SE_Controls,cv_SE_UWS,0.05)
    
    figure,
    plot(t_control_mtn, mean(Controls_), 'b', t_control_mtn, mean(UWS_), 'g')
    
    
    title( 'Plot of Controls (blue) vs UWS (green)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
    
    
    % Other comparisons
    
    %[h_UWS_MCS,p_UWS_MCS] = ttest2(mean_SE_UWS,mean_SE_MCS,0.05)
    [h_MCS_UWS_mean,p_MCS_UWS_mean] = ttest2(mean_SE_MCS,mean_SE_UWS,0.05)
    [h_MCS_UWS_std,p_MCS_UWS_std] = ttest2(std_SE_MCS,std_SE_UWS,0.05)
    [h_MCS_UWS_cv,p_MCS_UWS_cv] = ttest2(cv_SE_MCS,cv_SE_UWS,0.05)
    
    
    figure,
    plot(t_control_mtn, mean(MCS_), 'b', t_control_mtn, mean(UWS_), 'g')
    
    title( 'Plot of MCS (blue) vs UWS (green)' ,'FontSize',14,'FontWeight','bold','Color','k')
    ylabel('Spectral Amplitude (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');




    
%% Computing the area under the curve and the statistics for it
%
%
% AUC: Area Under the Curve or tpz
%
%
% 
%%%%%%%%%%%%

% Controls = mean(Controls);
% LIS = nanmean(LIS);
% EMCS = nanmean(EMCS);
% MCS = nanmean(MCS);
% UWS = nanmean(UWS);

[m_controls, n_controls] = size(Controls_)
[m_LIS, n_LIS] = size(LIS_)
[m_EMCS, n_EMCS] = size(EMCS_)
[m_MCS, n_MCS] = size(MCS_)
[m_UWS, n_UWS] = size(UWS_)


for i=1:m_controls
    tpz_Control(i,:) = trapz(Controls_(i,:))/length(Controls_(i,:));
end

for i=1:m_LIS
    tpz_LIS(i,:) = trapz(LIS_(i,:))/length(LIS_(i,:));
end

for i=1:m_EMCS
    tpz_EMCS(i,:) = trapz(EMCS_(i,:))/length(EMCS_(i,:));
end

for i=1:m_MCS
    tpz_MCS(i,:) = trapz(MCS_(i,:))/length(MCS_(i,:));
end


for i=1:m_UWS
    tpz_UWS(i,:) = trapz(UWS_(i,:))/length(UWS_(i,:));
end



% tpz_Control = trapz(Controls)/length(Controls);
% tpz_LIS = trapz(LIS)/length(LIS);
% tpz_EMCS = trapz(EMCS)/length(EMCS);
% tpz_MCS = trapz(MCS)/length(MCS);
% tpz_UWS = trapz(UWS)/length(UWS);


% 
% tpz_mean_Control = mean(tpz_Control);
% tpz_mean_EMCS = nanmean(tpz_EMCS);
% tpz_mean_MCS = nanmean(tpz_MCS);
% tpz_mean_UWS =  nanmean(tpz_UWS);
% 
% 
% tpz_STD_Control = std(tpz_Control);
% tpz_STD_EMCS = nanstd(tpz_EMCS);
% tpz_STD_MCS = nanstd(tpz_MCS);
% tpz_STD_UWS =  nanstd(tpz_UWS);

[h_control_lis,p_conVSlis]=ttest2(tpz_Control,tpz_LIS, 0.05,'right')
[h_control_emcs,p_conVSemcs]=ttest2(tpz_Control,tpz_EMCS, 0.05,'right')
[h_control_mcs,p_conVSmcs]=ttest2(tpz_Control,tpz_MCS, 0.05,'right')
[h_control_uws,p_conVSuws]=ttest2(tpz_Control,tpz_UWS, 0.05,'right')
[h_lis_uws,p_lis_uws]=ttest2(tpz_LIS,tpz_UWS, 0.05,'right')
[h_emcs_uws,p_emcs_uws]=ttest2(tpz_EMCS,tpz_UWS, 0.05,'right')
[h_mcs_uws,p_mcsVSuws]=ttest2(tpz_MCS,tpz_UWS, 0.05,'right')


   


 
cd(path_code);

end