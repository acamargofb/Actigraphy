function spm_actv_acfjc_get_ndays_acti_

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:                           %%    
%%%  Aldo Camargo                      %% 
%%%  University of Liege (Belgium)     %%
%%%     aldo.camargo@ulg.ac.be         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  This program save in a file results_resume_ndays.csv the number of days
%  of all the AWD files


close all, clear all, clc
home = '/home/aldo/Documents/Projects/Avtivemeter/Data';
dir_mcsp = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/';
type_file = ('*.AWD');
files = dir(strcat(dir_mcsp,type_file));

cd(dir_mcsp)


resolution = 1; % resolution of the epocs is one minute

s_csv = strcat(dir_mcsp, '/results_resumen_ndays.csv');


for k = 1:length(files)
    fid = fopen(s_csv, 'a'); 
     fprintf('Processing = %s \n',files(k).name);
     disp([' Reading file : ' num2str(files(k).name)]);
     eval(['logfile = readcoglog(files(k).name);']);% uses 'readcoglog' to transfrom raw data in a usable format
     acti = [];
        for hh = 8:size(logfile,1)%the 8 first lines are not data movement data
         acti(hh,1) = str2num(strvcat(cellstr(logfile{hh}(1))));%to chane cell array into number
        end
     [n_days_recorded, nnn] = size(acti);
      factor_conv_time = resolution/(60*24);
      n_days_recorded = n_days_recorded*factor_conv_time
      
      fprintf(fid, '\n%s, %f',files(k).name, n_days_recorded );
      fclose(fid);
    
end

cd(home);      
 
end

