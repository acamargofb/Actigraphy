function [tt_4, yy_4] = get_actidata_cruze(file)


resolution = 1; % resolution of the epocs is one minute


% Step 2: Setting the number of days of analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number of days to analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nday_analysis = 4;
nday_surrogate_analysis = 4; % according with the paper

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
disp([num2str(nbj) ' x 24h enregistr�es']);

[n_days_recorded, nnn] = size(acti);
factor_conv_time = resolution/(60*24);
n_days_recorded = n_days_recorded*factor_conv_time;

% if(n_days_recorded < 5)
%     fprintf(1,'\n The number of days is less than 5 days ...  Sorry...  :( ...  \n',n_days_recorded )
%     return;
% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                                  %%
%%% Step 4: Removing the first 2 hours of data of the first day      %%
%%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nhours2delete = 2; % 3 h for patient 23 and 32 of Damian's paper
tf_delete = nhours2delete*60/resolution;
acti = acti(tf_delete+1+8:end); % DC: remove values instead of zeroing and get rid of first 8 rows as is from the header
acti = acti(1:nday_surrogate_analysis*60*24); % DC: select only ndays of data

% DC: fix time variables as now have nhours2delete missing
int_start_hour = int_start_hour + nhours2delete;
if int_start_hour > 24 % 24 hour clock so if it goes through midnight we roll back to counting from zero
    int_start_hour = int_start_hour - 24;
end

init_data_time = int_start_hour*60 + int_start_min; % DC: how many minutes into the day do we start
init_data_time_prop = init_data_time / (24*60); % DC: at what proportion of one day do we start
t = init_data_time_prop:1/factor:(init_data_time_prop + nday_analysis)-1/factor;

tt_4 = t*factor;% factor is 1440 min because resolution is 1 min
yy_4 = acti;

