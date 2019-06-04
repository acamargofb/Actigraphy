function spm_actv_acfjc_export_acti_csvfile(file, ndays, workdir)

 [pathstr_ses,name_ses,ext_ses] = fileparts(file);
 pathrstr_ses2 = strcat(workdir,pathstr_ses);

 resolution = 1; % resolution of the epocs is one minute


% Step 2: Setting the number of days of analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number of days to analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nday_analysis = ndays;
nday_surrogate_analysis = ndays; % according with the paper

save_results_csv = true;



%---------------------------------------------

% Step 3:  Loading the data into the variable acti
disp([' Reading file : ' num2str(file)]);
eval(['logfile = readcoglog(file);']);% uses 'readcoglog' to transfrom raw data in a usable format
acti = [];
for hh = 8:size(logfile,1)%the 8 first lines are not data movement data
    acti(hh,1) = str2num(strvcat(cellstr(logfile{hh}(1))));%to chane cell array into number
end

start_date =strvcat(cellstr(logfile{2}(1)));
start_hour =strvcat(cellstr(logfile{3}(1)));

temp_start_hour = strsplit(start_hour,':');

int_start_hour = str2num(strvcat(temp_start_hour(1)));
int_start_min = str2num(strvcat(temp_start_hour(2)));
factor = 1440/resolution;
nbj = floor(size(acti,1)/factor); %to count the total number of full days (24h) of recording
disp([num2str(nbj) ' x 24h registers']);

[n_days_recorded, nnn] = size(acti);


factor_conv_time = resolution/(60*24);
n_days_recorded = n_days_recorded*factor_conv_time;

if(n_days_recorded < ndays)
     fprintf(1,'\n The number of days recorded  %d is less than %d days ...  Sorry...  :( ...  \n',n_days_recorded, ndays )
     return;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                                  %%
%%% Step 4: Removing the first 2 hours of data of the first day      %%
%%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nhours2delete = 2; % 3 h for patient 23 and 32 of Damian's paper
tf_delete = nhours2delete*60/resolution;
acti = acti(tf_delete+1+8:end); % DC: remove values instead of zeroing and get rid of first 8 rows as is from the header

if(length(acti) < nday_surrogate_analysis*60*24)
     fprintf('ndays > n_day_recorded after removing 2 hours....(exit function) \n');
    return;
else
    acti = acti(1:nday_surrogate_analysis*60*24); % DC: select only ndays of data
end


% DC: fix time variables as now have nhours2delete missing
int_start_hour = int_start_hour + nhours2delete;
if int_start_hour > 24 % 24 hour clock so if it goes through midnight we roll back to counting from zero
    int_start_hour = int_start_hour - 24;
end

init_data_time = int_start_hour*60 + int_start_min; % DC: how many minutes into the day do we start
init_data_time_prop = init_data_time / (24*60); % DC: at what proportion of one day do we start

if( ndays + init_data_time_prop > n_days_recorded)
   fprintf('ndays > n_day_recorded ....(exit function) \n');
   return; 
    
end

t = init_data_time_prop:1/factor:(init_data_time_prop + nday_analysis)-1/factor;

tt_4 = t*factor;% factor is 1440 min because resolution is 1 min
yy_4 = acti;



%datestring = strcat(start_date, {' '}, start_hour, {':00'})
datestring = strcat(start_date, {' '}, int2str(int_start_hour), {':00'});
formatIn = 'dd-mmm-yyyy HH:MM';%
datastart_int = datenum(datestring,formatIn);

% datastart_record = datastart_int;
formatOut = 'yyyy-mm-dd HH:MM:SS AM';

fprintf('Working with file: %s \n', name_ses);

if(save_results_csv)
       
        s1  = name_ses;
        s1_scv = 'acti.csv';
        s2 = strcat(pathrstr_ses2, '/acti_files_csv/');
        if(ndays == 4 && n_days_recorded >= 4 )
            s3 = strcat(s2, '4days/');
        elseif(ndays == 5 && n_days_recorded >= 5 )
            s3 = strcat(s2, '5days/');
        elseif(ndays == 6 && n_days_recorded >= 6 )
            s3 = strcat(s2, '6days/');
        elseif(ndays == 7 && n_days_recorded >= 7 )
            s3 = strcat(s2, '7days/');
        else
            fprintf('number of days not accepted \n');
            return;
        end
        
        s2_csv = strcat(s1,s1_scv);
        s_csv = strcat(s3, s2_csv);
        
        temp1 = datastart_int;
        fprintf('Saving file: %s \n', s_csv);
        fid = fopen(s_csv, 'w') 
        for ii = 1: length(yy_4)
            temp = datestr(addtodate(temp1, 1, 'minute'),formatOut);
            fprintf(fid, '%s, %f  \n', temp, yy_4(ii));
            temp1 = datenum(temp);
        end
        fclose(fid);
end

  
end  
    