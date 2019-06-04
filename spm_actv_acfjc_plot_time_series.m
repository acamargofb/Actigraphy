function spm_actv_acfjc_plot_time_series
close all, clear all, clc;

% ndays_4 = true;
% ndays_5 = false;
% ndays_6 = false;
% ndays_7 = false;
ndays_all = true;
ndays = [];
if(ndays_all)
    ndays = [ndays 4 5 6 7]
end
   


home = '/home/aldo/Documents/Projects/Avtivemeter/Data';
dir_mcsp = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/acti_files_csv/4days/';
type_file = ('*.csv');
files = dir(strcat(dir_mcsp,type_file));

cd(dir_mcsp)


resolution = 1; % resolution of the epocs is one minute

% for i = 1:length(files)
%   for j = 1:length(ndays)
%     ndays_analysis = ndays(j);
%     spm_actv_acfjc_export_acti_csvfile(files(i).name, ndays_analysis, dir_mcsp);
%   end
% end


 %for i = 1:length(ndays)
   for j = 1:length(files)
    % ndays_analysis = ndays(i);
     %spm_actv_acfjc_export_acti_csvfile(files(j).name, ndays_analysis, dir_mcsp);
     fileID = fopen(files(j).name);
     A = fread(fileID);
     B = readtable(files(j).name);
     
     data_csv{j} = csvread(fileID);
     data_csv= csvread('/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/result_plot_circ_5days.csv');
     
     
   end
 %end

 
cd(home);

end







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