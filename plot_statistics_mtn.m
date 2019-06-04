function plot_statistics_mtn(path_code, path_control,path_emcs, path_lis, path_mcs, path_mcs_m, ...
    path_mcs_p, path_mcs_ast, path_uws)

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
title( 'Control (blue) vs MCS- (red)')
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
title( 'Control (blue) vs MCS+ (red)' )
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
title( 'Control (blue) vs MCS* (red)')
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


% Statistical difference between MCS and UWS
figure
y2_CC = mean (MCS_aux);
z2_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_mcs, y2_CC,z2_CC, 'b'); grid on; 
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('MCS (blue) vs UWS (red)')
ylabel('Spectral Amplitude (SA)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_MCS_UWS_aux,p_MCS_UWS_aux] = ttest2(MCS_aux,UWS_aux,0.05)



cd(path_code);



end