function Actigraphy_PCA_v1(segment)

%clc
%clear all
close all

% segment = 'mtn_files'
% segment = 'comparison'

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
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    PCA 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 cd(path_code);
 
 X_control_mtn = [t_control_mtn' Control_mtn_aux'];
 [COEFF_control_mtn,SCORE_control_mtn] = princomp(X_control_mtn);
 pca_Control_mtn = SCORE_control_mtn(:,2:end);

 X_control_awd = [t_control_awd' Control_awd_aux'];
 [COEFF_control_awd,SCORE_control_awd] = princomp(X_control_awd);
 pca_Control_awd = SCORE_control_awd(:,2:end);
 
% Controls
 figure
 y2_CC = mean(pca_Control_mtn');
 z2_CC = std(pca_Control_mtn')/sqrt (length(pca_Control_mtn'));
 errorbar(t_control_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean (pca_Control_awd');
 z3_CC = std (pca_Control_awd')/sqrt (length(pca_Control_awd'));
 errorbar (t_control_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'PCA Control mtn (blue) vs PCA Control awd (red)')
 ylabel('PCA of Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');

 %[h_pcaControls_aux,p_pcaControls_aux] = ttest2(pca_Control_mtn,pca_Control_awd,0.05)
 
 
 % EMCS 
 
 X_EMCS_mtn = [t_emcs_mtn' EMCS_mtn_aux'];
 [COEFF_EMCS_mtn,SCORE_EMCS_mtn] = princomp(X_EMCS_mtn);
 pca_EMCS_mtn = SCORE_EMCS_mtn(:,2:end);


 X_EMCS_awd = [t_emcs_awd' EMCS_awd_aux'];
 [COEFF_EMCS_awd,SCORE_EMCS_awd] = princomp(X_EMCS_awd);
 pca_EMCS_awd = SCORE_EMCS_awd(:,2:end);

  
 figure
 y2_CC = mean(pca_EMCS_mtn');
 z2_CC = std(pca_EMCS_mtn')/sqrt (length(pca_EMCS_mtn'));
 errorbar(t_emcs_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(pca_EMCS_awd');
 z3_CC = std (pca_EMCS_awd')/sqrt (length(pca_EMCS_awd'));
 errorbar (t_emcs_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'PCA EMCS mtn (blue) vs PCA EMCS awd (red)')
 ylabel('PCA of Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 
 %[h_pcaEMCS_aux,p_pcaEMCS_aux] = ttest2(pca_EMCS_mtn,pca_EMCS_awd,0.05)
 
 
 % LIS 
 
 X_LIS_mtn = [t_lis_mtn' LIS_mtn_aux'];
 [COEFF_LIS_mtn,SCORE_LIS_mtn] = princomp(X_LIS_mtn);
 pca_LIS_mtn = SCORE_LIS_mtn(:,2:end);


 X_LIS_awd = [t_lis_awd' LIS_awd_aux'];
 [COEFF_LIS_awd,SCORE_LIS_awd] = princomp(X_LIS_awd);
 pca_LIS_awd = SCORE_LIS_awd(:,2:end);
 
 
 figure
 y2_CC = mean(pca_LIS_mtn');
 z2_CC = std(pca_LIS_mtn')/sqrt (length(pca_LIS_mtn'));
 errorbar(t_lis_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(pca_LIS_awd');
 z3_CC = std (pca_LIS_awd')/sqrt (length(pca_LIS_awd'));
 errorbar (t_lis_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'PCA LIS mtn (blue) vs PCA LIS awd (red)')
 ylabel('PCA of Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
%[h_LIS_aux,p_LIS_aux] = ttest2(LIS_mtn_aux,LIS_awd_aux,0.05)
 
 % MCS 
 X_MCS_mtn = [t_mcs_mtn' MCS_mtn_aux'];
 [COEFF_MCS_mtn,SCORE_MCS_mtn] = princomp(X_MCS_mtn);
 pca_MCS_mtn = SCORE_MCS_mtn(:,2:end);


 X_MCS_awd = [t_mcs_awd' MCS_awd_aux'];
 [COEFF_MCS_awd,SCORE_MCS_awd] = princomp(X_MCS_awd);
 pca_MCS_awd = SCORE_MCS_awd(:,2:end);
 
 
 figure
 y2_CC = mean(pca_MCS_mtn');
 z2_CC = std(pca_MCS_mtn')/sqrt (length(pca_MCS_mtn'));
 errorbar(t_mcs_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(pca_MCS_awd');
 z3_CC = std (pca_MCS_awd')/sqrt (length(pca_MCS_awd'));
 errorbar (t_mcs_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'PCA MCS mtn (blue) vs PCA MCS awd (red)')
 ylabel('PCA of Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 
 %[h_MCS_aux,p_MCS_aux] = ttest2(MCS_mtn_aux,MCS_awd_aux,0.05)
 
 % UWS 
 X_UWS_mtn = [t_uws_mtn' UWS_mtn_aux'];
 [COEFF_UWS_mtn,SCORE_UWS_mtn] = princomp(X_UWS_mtn);
 pca_UWS_mtn = SCORE_UWS_mtn(:,2:end);


 X_UWS_awd = [t_uws_awd' UWS_awd_aux'];
 [COEFF_UWS_awd,SCORE_UWS_awd] = princomp(X_UWS_awd);
 pca_UWS_awd = SCORE_UWS_awd(:,2:end);
 
 
 figure
 y2_CC = mean(pca_UWS_mtn');
 z2_CC = std(pca_UWS_mtn')/sqrt (length(pca_UWS_mtn'));
 errorbar(t_uws_mtn,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean(pca_UWS_awd');
 z3_CC = std (pca_UWS_awd')/sqrt (length(pca_UWS_awd'));
 errorbar (t_uws_awd, y3_CC,z3_CC, 'r'); grid on; 
 title( 'PCA UWS mtn (blue) vs PCA UWS awd (red)')
 ylabel('PCA of Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
 xlabel('time (min)');
 
% [h_UWS_aux,p_UWS_aux] = ttest2(UWS_mtn_aux,UWS_awd_aux,0.05)
 
 cd(path_code);
 
 
elseif(strcmp(segment,'morning'))
    
 
else
 fprintf(1,'\n I do not recognize that segment sorry or not implemented yet :( \n' )
end

end