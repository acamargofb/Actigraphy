function plot_statistics_MCS_UWS_mtn(path_code,path_mcs, path_uws)
% 
%   cd(path_control);
%   SUBJlist_Control = dir('*.mat');
% 
%  for i = 1:length(SUBJlist_Control)
%     SUBJname_Control = SUBJlist_Control(i).name;
% %     path1=([path SUBJname]);
% %     cd(path1);
%     data=load(SUBJname_Control);
%     Control_aux(i,:,:) = data.aux;
%  end
%  t_control = data.time;
% figure
% plot(t_control, Control_aux');


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


cd(path_code);


end