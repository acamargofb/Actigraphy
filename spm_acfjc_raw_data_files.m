function spm_acfjc_raw_data_files

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:                           %%    
%%%  Aldo Camargo                      %% 
%%%  University of Liege (Belgium)     %%
%%%     aldo.camargo@ulg.ac.be         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%

close all, clear all, clc

% Step 1:  Reading and loading the file

files = spm_select(Inf, '.+\.AWD$', 'Select files ',...
        [], [], '.AWD'); %Show all .AWD files in the directory datadir

%files =  ´/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/hetsen nathalie2.AWD´ ;

[nfiles, mfiles] = size(files);

%ifile = 2
for ifile = 1:nfiles
 ifile
 close all;
file = files(ifile,:)

[pathstr_ses,name_ses,ext_ses] = fileparts(file);

resolution = 1; % resolution of the epocs is one minute

% Step 1.1:  Setting init values for the computation

graph_mean_day_spectral_entropy = true;
graph_mean_day_spectral_entropy_morning  = true;
graph_mean_day_spectral_entropy_night  = false;

% Step 2: Setting the number of days of analysis 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number of days to analysis                                     %%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nday_analysis = 5;
isub = 1;

%---------------------------------------------

% Step 2:  Loading the data into the variable acti
   
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

    timestart = strvcat(cellstr(logfile{3}(1)));% heure du d�but de l'enregistrement
    heure= str2num(timestart(1:2));
    min = str2num(timestart(4:5));
    
    [n_days_recorded, nnn] = size(acti);
    factor_conv_time = resolution/(60*24);
    n_days_recorded = n_days_recorded*factor_conv_time
    
    if(n_days_recorded < 5)
        fprintf(1,'\n The number of days is less than 5 days ...  Sorry...  :( ...  \n',n_days_recorded )
        return;
    end
    

    
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                                  %% 
%%% Step 3: Removing the first 2 hours of data of the first day      %%
%%%                                                                  %%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
 tf_delete = 2*60/resolution;
 acti_days{1}(1:tf_delete) = 0;  
 acti(1:tf_delete) = 0;
  

%%%

% Step 4: Computing the Mesor, ampitudem and Acrophase of the first 4 days

 %fprintf(1,'\n Computing the Messor, Amplitude and Acrophase of the %g days: ...  \n', nday_analysis);
% 

nday_analysis

size_tt = 24*60*nday_analysis/resolution;

y_tt = acti(1:resolution:size_tt);
t_tt = 1:resolution:size_tt;
t_tt = t_tt';
t_tt = t_tt./max(t_tt);
w = 2*pi;
alpha = .05; %  5%

factor_angle = 180/pi; % to convert radians to degrees

%[M_tt,Amp_tt,phi_tt,p_value_tt] = cosinor(t_tt,y_tt,w,alpha,false);


%  disp('-------------------------------------------');
%  fprintf(1,'\n Results for the first %g days  \n', nday_analysis);
%  disp('-------------------------------------------');
%  
% 
%  fprintf(1,'Messor:      = %g    \n', M_tt);
%  fprintf(1,'Amplitude:   = %g    \n', Amp_tt);
%  fprintf(1,'Acrophase (degrees):   = %g  \n', (factor_angle)*phi_tt);
%  fprintf(1,'p-value:     = %g   \n', p_value_tt);
%  disp('-------------------------------------------');
%  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%%% Step 4: Graphics of the data (first 4 days)      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

init_data_time = int_start_hour*60 + int_start_min;

day_t4 = 24*60*4;

tt_4 = 1:resolution:day_t4;
yy_4 = acti(1:resolution:day_t4);

% figure,
% subplot(1,2,1); plot(tt_4, yy_4);  title('Day 1 to Day 4');


% day 1%
% considering that all the values start on different hours and mins

day_1 = (24*60*1 -  init_data_time ) + 1;

t_1 = 1:resolution:day_1;
y_1 = acti(1:resolution:day_1);
y_1_median = medfilt1(y_1);


%figure,
%subplot(3,2,2); plot(t_1, y_1);  title('Day 1');

% Finding morning and night information
init_day = 8;
end_day =  20;


if (int_start_hour > init_day && int_start_hour < end_day )
    day_1_morning = end_day*60 - init_data_time;
    day_1_night = day_1 - day_1_morning;
else
    day_1_morning = 0;
    day_1_night = day_1 - day_1_morning;
end


if ( day_1_morning > 0 )
    t1_morning = 1:resolution:day_1_morning;
    t1_night = day_1_morning+1:resolution:day_1;
    y1_morning = acti(1:resolution:day_1_morning);
    y1_night = acti(day_1_morning + 1:resolution:day_1);
%     figure,
%     subplot(2,1,1); plot(t1_morning, y1_morning);
%     subplot(2,1,2); plot(t1_night, y1_night);
else
    t1_morning = 0;
    y1_morning = [];
  
    y1_night = acti(day_1_morning + 1:resolution:day_1);
%     figure,
    t1_night = day_1_morning+1:resolution:day_1;
%     subplot(2,1,2); plot(t1_night, y1_night);
end

if(t1_morning > 0 )
    y1_morning_mean = (sum(y1_morning))/(length(t1_morning));
    y1_night_mean = (sum(y1_night))/(length(t1_night));
else
    y1_morning_mean = [];
    y1_night_mean  = [];
end


% day 2 %

day_2 = (24*60*2 -  init_data_time ) + 1;

t_2 = (day_1 + 1):resolution:day_2;
y_2 = acti(day_1 + 1:resolution:day_2);

%figure,
%subplot(3,2,3); plot(t_2, y_2);  title('Day 2');

% day and night
t2_morning = [];
y2_morning = [];
t2_night = [];
y2_morning = [];

count_morning_2 = 0;
y2_morning_mean = 0;

count_night_2 = 0;
y2_night_mean = 0;

for tt=(day_1 + 1):day_2
   if((tt >= day_1 + 8*60) && (tt < day_1 + 20*60))
      t2_morning(tt) = tt;
      y2_morning(tt) = acti(tt); 
      t2_night(tt) =  tt;
      y2_night(tt) = 0;
      count_morning_2 = count_morning_2 + 1;
      y2_morning_mean = y2_morning_mean + y2_morning(tt);
   else
      t2_morning(tt) = tt;
      y2_morning(tt) = 0; 
      t2_night(tt) =  tt;
      y2_night(tt) = acti(tt);
      count_night_2 = count_night_2 + 1;
      y2_night_mean = y2_night_mean + y2_night(tt);
   end
    
end

y2_morning_mean = y2_morning_mean/count_morning_2;
y2_night_mean = y2_night_mean/count_night_2;


% plotting the day and night information
% t2_morning = (day_1 + 1):resolution:(day_2 - 12*60);
% t2_night =  t2_morning:resolution:day_2;



% day 3 %

day_3 = (24*60*3 -  init_data_time ) + 1;

t_3 = (day_2 + 1):resolution:day_3;
y_3 = acti(day_2 + 1:resolution:day_3);

% figure,
%subplot(3,2,4); plot(t_3, y_3);  title('Day 3');

% day and night
t3_morning = [];
y3_morning = [];
t3_night = [];
y3_morning = [];

count_morning_3 = 0;
y3_morning_mean = 0;

count_night_3 = 0;
y3_night_mean = 0;

for tt=(day_2 + 1):day_3
   if((tt >= day_2 + 8*60) && (tt < day_2 + 20*60))
      t3_morning(tt) = tt;
      y3_morning(tt) = acti(tt); 
      t3_night(tt) =  tt;
      y3_night(tt) = 0;
      count_morning_3 = count_morning_3 + 1;
      y3_morning_mean = y3_morning_mean + y3_morning(tt);
   else
      t3_morning(tt) = tt;
      y3_morning(tt) = 0; 
      t3_night(tt) =  tt;
      y3_night(tt) = acti(tt);
      count_night_3 = count_night_3 + 1;
      y3_night_mean = y3_night_mean + y3_night(tt);
   end
    
end



y3_morning_mean = y3_morning_mean/count_morning_3;
y3_night_mean = y3_night_mean/count_night_3;

% plotting the day and night information
% 
% t2_morning = 


% day 4 %

day_4 = (24*60*4 -  init_data_time ) + 1;

t_4 = (day_3 + 1):resolution:day_4;
y_4 = acti(day_3 + 1:resolution:day_4);


% day 5 %

day_5 = (24*60*5 -  init_data_time ) + 1;

t_5 = (day_4 + 1):resolution:day_5;
y_5 = acti(day_4 + 1:resolution:day_5);
%figure,
%subplot(3,2,5); plot(t_4, y_4);  title('Day 4');

% day and night
t4_morning = [];
y4_morning = [];
t4_night = [];
y4_morning = [];

count_morning_4 = 0;
y4_morning_mean = 0;

count_night_4 = 0;
y4_night_mean = 0;

for tt4=(day_3 + 1):day_4
   if((tt4 >= day_3 + 8*60) && (tt4 < day_3 + 20*60))
      t4_morning(tt4) = tt4;
      y4_morning(tt4) = acti(tt4); 
      t4_night(tt4) =  tt4;
      y4_night(tt4) = 0;
      count_morning_4 = count_morning_4 + 1;
      y4_morning_mean = y4_morning_mean + y4_morning(tt4);
   else
      t4_morning(tt4) = tt4;
      y4_morning(tt4) = 0; 
      t4_night(tt4) =  tt4;
      y4_night(tt4) = acti(tt4);
      count_night_4 = count_night_4 + 1;
      y4_night_mean = y4_night_mean + y4_night(tt4);
      
   end
    
end


y4_morning_mean = y4_morning_mean/count_morning_4;
y4_night_mean = y4_night_mean/count_night_4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% A more practical way to get the day and night information   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We will take only information since day 2 %

% init_day
% end_day
% resolution
 factor_day = 60/resolution;
% y_2_day = y_2(init_day*factor_day:end_day*factor_day-1);
% y_3_day = y_3(init_day*factor_day:end_day*factor_day-1);
% y_4_day = y_4(init_day*factor_day:end_day*factor_day-1);
% y_5_day = y_5(init_day*factor_day:end_day*factor_day-1);
% y_5_night =[ y_5(1:init_day*factor_day-1); y_5(end_day*factor_day:1440)];

time_index = [1:1440]; % because the resolution is 1 min
indx_time_day = find((time_index >= init_day*factor_day) & (time_index < end_day*factor_day));
indx_time_night = find((time_index < init_day*factor_day) | (time_index >= end_day*factor_day));

y_2_day_find = zeros(1,1440);% because the resolution is 1 min
y_2_day_find(indx_time_day) = y_2(indx_time_day);

y_2_night_find = zeros(1,1440);
y_2_night_find(indx_time_night) = y_2(indx_time_night);


y_3_day_find = zeros(1,1440);% because the resolution is 1 min
y_3_day_find(indx_time_day) = y_3(indx_time_day);

y_3_night_find = zeros(1,1440);
y_3_night_find(indx_time_night) = y_3(indx_time_night);

y_4_day_find = zeros(1,1440);% because the resolution is 1 min
y_4_day_find(indx_time_day) = y_4(indx_time_day);

y_4_night_find = zeros(1,1440);
y_4_night_find(indx_time_night) = y_4(indx_time_night);

y_5_day_find = zeros(1,1440);% because the resolution is 1 min
y_5_day_find(indx_time_day) = y_5(indx_time_day);

y_5_night_find = zeros(1,1440);
y_5_night_find(indx_time_night) = y_5(indx_time_night);


%%%% 
% This code test if the code is correct to get the day and night
% information
%  mean(y_3_day_find)
%  mean(y_3(indx_time_day))
%  mean(y_5_day_find)
%  mean(y_5(indx_time_day))
%  mean(y_5_night_find)
%  mean(y_5(indx_time_night))
%  
% figure
% subplot(3,1,1), plot(time_index, y_5);
% subplot(3,1,2), plot(time_index, y_5_day_find);
% subplot(3,1,3), plot(time_index, y_5_night_find);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%          Computing the mean   for every day    %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if(graph_mean_day_spectral_entropy)
   temp = [ y_2'; y_3'; y_4'; y_5'];

    y_mean = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    y_mean_day = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    y_mean_night = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    for i=1:1440 % Because the epochs are on 1 min interval and is for 24 hours
       y_mean(i) =  mean([y_2(i) y_3(i) y_4(i) y_5(i)]);
       y_mean_day(i) =  mean([y_2_day_find(i) y_3_day_find(i) y_4_day_find(i) y_5_day_find(i)]);
       y_mean_night(i) =  mean([y_2_night_find(i) y_3_night_find(i) y_4_night_find(i) y_5_night_find(i)]);
  
    end
end


save('data_raw', 'temp');


s1 = name_ses;
s2 = '_raw_.mat';
s = strcat(s1,s2);
pathstr_ses = strcat(pathstr_ses, '/');
    
path_copy = strcat(pathstr_ses, s)
    
copyfile('data_raw.mat', path_copy )
    
delete data_raw.mat






end


end


