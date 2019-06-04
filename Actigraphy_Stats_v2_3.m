function Actigraphy_Stats_v2_3(segment)

%clc
%clear all
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

elseif(strcmp(segment,'comparison'))
    path_control_mtn = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/';
    path_control_awd = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/';
    
    path_awd_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/';
    path_awd_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/';
    path_awd_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/';
    path_awd_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/';
  
    path_mtn_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/';
    path_mtn_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/';
    path_mtn_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/';
    path_mtn_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/';
    
  
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
%%%%%% Import data for Group 1: Controls MTN files

if(strcmp(segment,'comparison'))
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

 cd(path_awd_emcs);
 SUBJlist_EMCS_AWD = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_AWD)
    SUBJname_EMCS_AWD = SUBJlist_EMCS_AWD(i).name;
    data=load(SUBJname_EMCS_AWD);
    EMCS_awd_aux(i,:,:) = data.aux;
 end
 t_emcs_awd = data.time;

%%%%%% Import data for Group 4: EMCS MTN files

 cd(path_mtn_emcs);
 SUBJlist_EMCS_MTN = dir('EMCS*.mat');

 for i = 1:length(SUBJlist_EMCS_MTN)
    SUBJname_EMCS_MTN = SUBJlist_EMCS_MTN(i).name;
    data=load(SUBJname_EMCS_MTN);
    EMCS_mtn_aux(i,:,:) = data.aux;
 end
 t_emcs_mtn = data.time;

 
 %%%%%% Import data for Group 5: LIS AWD files

 cd(path_awd_lis);
 SUBJlist_LIS_AWD = dir('*.mat');

 for i = 1:length(SUBJlist_LIS_AWD)
    SUBJname_LIS_AWD = SUBJlist_LIS_AWD(i).name;
    data=load(SUBJname_LIS_AWD);
    LIS_awd_aux(i,:,:) = data.aux;
 end
 t_lis_awd = data.time;

%%%%%% Import data for Group 6: LIS MTN files

 cd(path_mtn_lis);
 SUBJlist_LIS_MTN = dir('LIS*.mat');

 for i = 1:length(SUBJlist_LIS_MTN)
    SUBJname_LIS_MTN = SUBJlist_LIS_MTN(i).name;
    data=load(SUBJname_LIS_MTN);
    LIS_mtn_aux(i,:,:) = data.aux;
 end
 t_lis_mtn = data.time;
 
 
 %%%%%% Import data for Group 7: MCS AWD files

 cd(path_awd_mcs);
 SUBJlist_MCS_AWD = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_AWD)
    SUBJname_MCS_AWD = SUBJlist_MCS_AWD(i).name;
    data=load(SUBJname_MCS_AWD);
    MCS_awd_aux(i,:,:) = data.aux;
 end
 t_mcs_awd = data.time;
 
 
 %%%%%% Import data for Group 8: MCS MTN files

 cd(path_mtn_mcs);
 SUBJlist_MCS_MTN = dir('MCS*.mat');

 for i = 1:length(SUBJlist_MCS_MTN)
    SUBJname_MCS_MTN = SUBJlist_MCS_MTN(i).name;
    data=load(SUBJname_MCS_MTN);
    MCS_mtn_aux(i,:,:) = data.aux;
 end
 t_mcs_mtn = data.time;
 
 
 %%%%%% Import data for Group 9: UWS AWD files

 cd(path_awd_uws);
 SUBJlist_UWS_AWD = dir('UWS*.mat');

 for i = 1:length(SUBJlist_UWS_AWD)
    SUBJname_UWS_AWD = SUBJlist_UWS_AWD(i).name;
    data=load(SUBJname_UWS_AWD);
    UWS_awd_aux(i,:,:) = data.aux;
 end
 t_uws_awd = data.time;
 
 
 %%%%%% Import data for Group 10: UWS MTN files

 cd(path_mtn_uws);
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
    
figure,
hh = plot(t_control_mtn, mean(Controls), t_lis_mtn, mean(LIS),t_emcs_mtn, mean(EMCS),  t_mcs_mtn, mean(MCS), t_uws_mtn, mean(UWS) );
legend(hh, 'Control', 'LIS','EMCS','MCS', 'UWS')
title( 'Plot of Control, EMCS, LIS, MCS, and UWS')
 


 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Ploting 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Controls
 figure
 y2_CC = mean(Control_mtn_aux);
 z2_CC = std(Control_mtn_aux)/sqrt (length(Control_mtn_aux));
 errorbar(t_control_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean (Control_awd_aux);
 %y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
 z3_CC = std (Control_awd_aux)/sqrt (length(Control_awd_aux));
 errorbar (t_control_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'Control mtn vs Control awd')
 ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');

 [h_Controls_aux,p_Controls_aux] = ttest2(Control_mtn_aux,Control_awd_aux,0.05)

% EMCS 
 figure
 y2_CC = mean(EMCS_mtn_aux);
 z2_CC = std(EMCS_mtn_aux)/sqrt (length(EMCS_mtn_aux));
 errorbar(t_emcs_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(EMCS_awd_aux);
 %y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
 z3_CC = std (EMCS_awd_aux)/sqrt (length(EMCS_awd_aux));
 errorbar (t_emcs_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'EMCS mtn vs EMCS awd')
 ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 
 [h_EMCS_aux,p_EMCS_aux] = ttest2(EMCS_mtn_aux,EMCS_awd_aux,0.05)
 
 
 % LIS 
 figure
 y2_CC = mean(LIS_mtn_aux);
 z2_CC = std(LIS_mtn_aux)/sqrt (length(LIS_mtn_aux));
 errorbar(t_lis_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(LIS_awd_aux);
 %y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
 z3_CC = std (LIS_awd_aux)/sqrt (length(LIS_awd_aux));
 errorbar (t_lis_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'LIS mtn vs LIS awd')
 ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 [h_LIS_aux,p_LIS_aux] = ttest2(LIS_mtn_aux,LIS_awd_aux,0.05)
 
  % MCS 
 figure
 y2_CC = mean(MCS_mtn_aux);
 z2_CC = std(MCS_mtn_aux)/sqrt (length(MCS_mtn_aux));
 errorbar(t_mcs_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(MCS_awd_aux);
 %y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
 z3_CC = std (MCS_awd_aux)/sqrt (length(MCS_awd_aux));
 errorbar (t_mcs_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'MCS mtn vs MCS awd')
 ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 
 [h_MCS_aux,p_MCS_aux] = ttest2(MCS_mtn_aux,MCS_awd_aux,0.05)
 
 % UWS 
 figure
 y2_CC = mean(UWS_mtn_aux);
 z2_CC = std(UWS_mtn_aux)/sqrt (length(UWS_mtn_aux));
 errorbar(t_uws_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(UWS_awd_aux);
 %y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
 z3_CC = std (UWS_awd_aux)/sqrt (length(UWS_awd_aux));
 errorbar (t_uws_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'UWS mtn vs UWS awd')
 ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 
% Statistical difference between Control and EMCS

 [h_UWS_aux,p_UWS_aux] = ttest2(UWS_mtn_aux,UWS_awd_aux,0.05)
 
 cd(path_code);
 
else
 fprintf(1,'\n I do not recognize that segment sorry or not implemented yet :( \n' )
end

end