function spm_actv_acfjc_get_ndays_acti_csvfiles

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
dir_mcsp = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/';
type_file = ('*.AWD');
files = dir(strcat(dir_mcsp,type_file));

cd(dir_mcsp)


resolution = 1; % resolution of the epocs is one minute

% for i = 1:length(files)
%   for j = 1:length(ndays)
%     ndays_analysis = ndays(j);
%     spm_actv_acfjc_export_acti_csvfile(files(i).name, ndays_analysis, dir_mcsp);
%   end
% end

 for i = 1:length(ndays)
   for j = 1:length(files)
     ndays_analysis = ndays(i);
     spm_actv_acfjc_export_acti_csvfile(files(j).name, ndays_analysis, dir_mcsp);
   end
 end

 
cd(home);

end
  