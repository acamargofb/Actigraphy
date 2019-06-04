function spm_actv_acfjc_spectral_entropy_spectrum_files_v2_1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:                           %%    
%%%  Aldo Camargo                      %% 
%%%  University of Liege (Belgium)     %%
%%%     aldo.camargo@ulg.ac.be         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For the periodogram check this site
%%https://onlinecourses.science.psu.edu/stat510/?q=book/export/html/52

close all, clear all, clc

% Step 1:  Reading and loading the file

files = spm_select(Inf, '.+\.AWD$', 'Select files ',...
        [], [], '.AWD'); %Show all .AWD files in the directory datadir




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
graph_mean_day_spectral_entropy_morning  = false;
graph_mean_day_spectral_entropy_night  = false;
analysis_whole_day = true;  % for the report of all day 1440 min
analysis_morning = false;
analysis_whole_data = false;
analysis_240min_whole_day = false;
analysis_120min_  = false;  % for the report of 120 min
debug_se = false;
debug_fft = false;
save_results = false;
save_acti_rawdata = false;
get_acti_rawdata_cruse = true;
save_results_csv  = true;
get_ultradian_values = true;

% Step 2: Setting the number of days of analysis 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number of days to analysis                                     %%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nday_analysis = 5;
isub = 1;

%---------------------------------------------

% Step 2:  Loading the data into the variable acti

if(get_acti_rawdata_cruse)
   
    
    
   [tt_4, yy_4] = get_actidata_cruze(file);
    
    

else
    
   
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


% day 6 %

% day_6 = (24*60*6 -  init_data_time ) + 1;
% 
% t_6 = (day_5 + 1):resolution:day_6;
% y_6 = acti(day_5 + 1:resolution:day_6);

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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%          Computing the mean   for every day    %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(graph_mean_day_spectral_entropy)
   temp = [ y_2'; y_3'; y_4'; y_5'];
   %temp2 = [y_2'; y_3'; y_4'; y_5'; y_6'];

    y_mean = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    y_mean_day = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    y_mean_night = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    for i=1:1440 % Because the epochs are on 1 min interval and is for 24 hours
       y_mean(i) =  mean([y_2(i) y_3(i) y_4(i) y_5(i)]);
       y_mean_day(i) =  mean([y_2_day_find(i) y_3_day_find(i) y_4_day_find(i) y_5_day_find(i)]);
       y_mean_night(i) =  mean([y_2_night_find(i) y_3_night_find(i) y_4_night_find(i) y_5_night_find(i)]);
  
    end
end
whole_data = [ y_2; y_3; y_4; y_5];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    Creating the chunk of data        %%%
%%%                                      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Chunks every k min %%%

k = 120;  %%%% 120 min = 2 h % it was 240 min for whole day



number_of_chunks = 24*60/k;
number_of_chunks_day = 12*60/k;
number_of_chunks_night = 12*60/k;

L_y2 = length(y_2); % because epocs of 1 min

j = 1;
for i=1:k:L_y2
     y2_chunk{j} = y_2(i:i+k-1);
     j = j + 1;
end

L_y3 = length(y_3); % because epocs of 1 min
j = 1;
for i=1:k:L_y2
     y3_chunk{j} = y_3(i:i+k-1);
     j = j + 1;
end


L_y4 = length(y_4); % because epocs of 1 min
j = 1;
for i=1:k:L_y2
     y4_chunk{j} = y_4(i:i+k-1);
     j = j + 1;
end

% I am considering day 5 because the first day is not considered. The
% reason is that day 1 is the first day where the patient has the
% activemeter on his arm, and normally start between 12 pm and 2 pm, which
% pretty much reduces a lot the time for computation.

L_y5 = length(y_5); % because epocs of 1 min
j = 1;
for i=1:k:L_y2
     y5_chunk{j} = y_5(i:i+k-1);
     j = j + 1;
end

L_y5 = length(y_5); % because epocs of 1 min
j = 1;
for i=1:k:L_y2
     y5_chunk{j} = y_5(i:i+k-1);
     j = j + 1;
end

%save('y2chunk', 'y2_chunk', 'y3_chunk');


if(graph_mean_day_spectral_entropy)
    % this part computes the y_mean for the whole 24 hours, starting at
    % day 2
    
    L_ymean = length(y_mean); % because epocs of 1 min
    j = 1;
    for i=1:k:L_ymean
         y_mean_chunk{j} = y_mean(i:i+k-1);
        j = j + 1;
    end
    % Creating chunks for the day
    jj = 1;
    for ii=init_day*factor_day:k:end_day*factor_day - k
         yday_mean_chunk{jj} = y_mean_day(ii:ii+k-1);
        jj = jj + 1;
    end
    
    % Creating chunks for the nighht  (0:00-8:00 and 20:00-24:00)
    jjj = 1;
    for iii=1:k:L_ymean
        if((iii >= 1 && iii < init_day*factor_day) || (iii > end_day*factor_day && iii <= L_ymean))
            iii
            ynight_mean_chunk{jjj} = y_mean_night(iii:iii+k-1);
            jjj = jjj + 1;
        end
    end
    
    
    
end


end  % end of the if where the program takes same data as Cruze's paper or not

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Spectral Entropy   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

windows_i = 60;

if(analysis_morning)
Ts = 60;
Fs = 1/Ts;
%nfft = 4*Fs;
nfft = windows_i;
%T6h = 8*60;
T12h = 12*60;
%data_6h = data_whole_day(1:T6h);
%data_6h = y_mean_day(8*60:8*60+T6h);
data_12h = y_mean_day(8*60:8*60+T12h);
k = 1;
SE = [];
TM = [];

      for i = 1 : 1 : T12h
        if i+windows_i-1 <= T12h
          
            aux = data_12h(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],nfft,length(aux),0);
            
            SE = [SE Y];
            TM = [TM i];
        end
     end   
     
   %plot(TM, SE), ylim([.7 1]);
%    figure,
%    plot(TM, SE); 
       crs = 'UWS';
%     SE = SE;

    [SA, waveerp, freqs]=graph_spectral_entropy_days(SE, crs, 12); % 12 hours of the morning (8:00 a.m  to 8:00 p.m.)
    
    if(save_results)
        s1 = name_ses;
        s2 = '_morning_.mat';
        s = strcat(s1,s2);
              
        pathstr_ses = strcat(pathstr_ses, '/');
    
        path_copy = strcat(pathstr_ses, s)
    
        copyfile('save_aux.mat', path_copy )
    
   % save('SE_data', 'SE', 'TM');  % To use it in the statistics
        copyfile('SE_data.mat', path_copy )
    end
    %delete save_aux.mat
    %delete SE_data.mat
    
    
elseif(analysis_whole_day)  % This is changed on 18 of April 2018
    Ts = 60;
    Fs = 1/Ts;
 
    nfft = windows_i;
   
    %mean_data_whole_day = mean(temp); % temp has stacked the data of 5 days
    if(get_acti_rawdata_cruse)
%         D = load('/home/aldo/Documents/Projects/Avtivemeter/Data/code_cruze_paper/Re actimetry/data_acti_4days.mat');
%         data_whole_day = D.yy_4;
%         t_whole_day = D.tt_4;
        data_whole_day = yy_4;
        t_whole_day = tt_4;
    else
        data_whole_day = whole_data;
    end
    
    
    %% Plot the raw data
    if(debug_fft)
    plot(data_whole_day);
    mean_ = mean(data_whole_day)
    mean_nonzeros = mean(nonzeros(data_whole_day))
    
    % std
    nn = length(data_whole_day)
    s1 = (sum((data_whole_day - mean_).^2)^(1/2))/nn
    
    nn_nonzeros = length(nonzeros(data_whole_day))
    s2 = (sum((nonzeros(data_whole_day) - mean_nonzeros).^2)^(1/2))/nn_nonzeros
   
    
    
    
    %% FFT: fft of the input data (whole_data : 4 days (day2 to day5)
    

    T = Ts;
    L = length(data_whole_day);
    
    Yfft = fft(data_whole_day);
    
    P2 = abs(Yfft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    
    f = Fs*(0:(L/2))/L;
    plot(f,P1) 
    title('Single-Sided Amplitude Spectrum of S(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
    
    
    Pyy = Yfft.*conj(Yfft);
    n = ceil(log2(L));
    f = Fs*(0:(2^(n-1) - 1))/2^n;
    figure
    plot(f,Pyy(1:2^(n-1)))
    
    
    Yfft_n = fft(data_whole_day, 2^n);
    Pyy_n = Yfft.*conj(Yfft);
    f_n = f;
    figure
    plot(f_n,Pyy_n(1:2^(n-1)))
    
    %% Now let see the histogram
    figure
    
    xx =  0:1:max(data_whole_day);
    
    hist(data_whole_day, xx);
    
%     figure
%     hist(data_whole_day);
     
      figure
      hist(nonzeros(data_whole_day));
    
    %% Now taking out data that is beyond the histogram distribution
    % 
    
%     
%     max_value = 400
%     
%     inx_change = find(data_whole_day >= max_value);
%     % now replace those values with the mean value (nonzero mean value)
%     
%     data_whole_day(inx_change) = mean_nonzeros;
    
    
    %checking that everything is fine;
    figure;
    hist(nonzeros(data_whole_day));
    
  end  
    
    %%
    
    

    k = 1;
    SE = [];
    TM = [];

   
      for i = 1 : 1 : length(data_whole_day)
        if i+windows_i-1 <= length(data_whole_day)
            
            aux = data_whole_day(i:i+30-1);
            
%             X = aux
%             F = 1/60
%             limits = [.0006 .0083]
%             nfft = nfft
%             window = length(aux)
%             overlap = 0
%   Y = my_spectral_entropy(X,F,limits,nfft,window,overlap)

                 
             if nansum(aux) > 3            
                Y = my_spectral_entropy(aux,1/60,[.0006 .0083],nfft,length(aux),0);            
             else
                Y = 0; 
             end

            
            %Y = my_spectral_entropy(aux,1/60,[.0006 .0083],nfft,length(aux),0);
            
            SE = [SE Y];
            TM = [TM i];
        end
     end   
     
%    figure, plot(TM, SE), ylim([.7 1]);
%    figure,
%    plot(TM, SE); 
       crs = 'MCS';
%     SE = SE;
   
    %graph_spectral_entropy_days(SE, crs, 24);  % 24 hours of the morning (8:00 a.m  to 8:00 p.m.)
    if(debug_fft)
     t = 1:length(SE);
    
     figure
     plot(t, SE, t, data_whole_day(t)./max(data_whole_day(t)));
    end
    
    if(save_acti_rawdata)
        tt_4 = 1:length(data_whole_day);
        yy_4 =  data_whole_day;
        plot(tt_4, yy_4);
        save('/home/aldo/Documents/Projects/Avtivemeter/Data/code_cruze_paper/Re actimetry/data_acti_4days.mat', 'tt_4', 'yy_4')
    end
    
    %function graph_spectral_entropy_days(SE, crs, hh)
    hh = 24*4;
    
    [MSA, waveerp, time_MSA] = graph_spectral_entropy_days(SE, crs, 24*4);  
    
%      figure
%      plot(time_MSA,MSA(1:end));
     
     [pks_msa, indx_pks_msa] = findpeaks(MSA);
     time_pks_MSA = time_MSA(indx_pks_msa);
     Magnitude_pks_MSA = MSA(indx_pks_msa);
     
     if(get_ultradian_values) %ultradian
          times_indx = find(time_pks_MSA >= 20 & time_pks_MSA <= 240);
     else  % Circadian
          times_indx = find(time_pks_MSA >= 1140 & time_pks_MSA <= 1680);
     end
     
     times_pks = time_pks_MSA(times_indx);
     pks_MSA = Magnitude_pks_MSA(times_indx);
     
     
     fprintf('times_pks = %.3f\n',times_pks);
     fprintf('pks_MSA = %.3f\n',pks_MSA);
     
     
     figure
     plot(1:length(SE), SE);
     
     pks_SE = SE(round(times_pks));
     
     
     % First check
     
     if(pks_SE == 0)
         temp_t = round(times_pks);
         pks_SE = max(SE(temp_t:temp_t+30));
     end
     
     % Second check
      if(pks_SE == 0)
         temp_t = round(times_pks);
         pks_SE = max(SE(temp_t-30:temp_t));
     end
     
     fprintf('pks_SE = %.3f\n',pks_SE);
     
     
     if(save_results_csv)
       
%         s1 = 'results_resumen_';
%         s1_scv = '.csv';
%         s2_csv = strcat(s1,s1_scv);
        s_csv = strcat(pathstr_ses, '/results_resumen_ultradian.csv');
        fid = fopen(s_csv, 'a') 
        fprintf(fid, '\n%s \t %f \t %f \t %f',name_ses, times_pks, pks_MSA, pks_SE );
        fclose(fid);
        
    end
     
     
     
     
        
     

 
    if(save_results)
        s1 = name_ses;
        s2 = '_whole_day_.mat';
    
        s2_SE = '_SE_whole_day_.mat';
    
        s = strcat(s1,s2);
        s_SE = strcat(s1,s2_SE);
    
        pathstr_ses_ = strcat(pathstr_ses, '/SE_whole_day_v2/');
    
        pathstr_ses_SE = strcat(pathstr_ses, '/SE_whole_day_v2/SE/');
    
    %pathstr_ses_ = strcat(pathstr_ses, '/');
    
    %pathstr_ses_SE = strcat(pathstr_ses, '/SE_whole_day/SE_data.mat');
    
        path_copy = strcat(pathstr_ses_, s)
        path_copy_SE = strcat(pathstr_ses_SE, s_SE)
    
   % save('SE_data', 'SE', 'TM');  % To use it in the statistics
        copyfile('SE_data.mat', path_copy_SE )
    
        copyfile('save_aux.mat', path_copy )
    
        delete save_aux.mat
        delete SE_data.mat
    end
    
    
elseif( analysis_240min_whole_day )
    Ts = 60;
    Fs = 1/Ts;
 
    nfft = windows_i;
   
    
    data_used = whole_data; %temp


    SE = [];
    TM = [];

   
      for i = 1 : 1 : length(data_used)
        if i+windows_i-1 <= length(data_used)
          
            aux = data_used(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],nfft,length(aux),0);
            
            SE = [SE Y];
            TM = [TM i];
        end
     end   
     
   %plot(TM, SE), ylim([.7 1]);
%    figure,
%    plot(TM, SE); 
       crs = 'UWS';
%     SE = SE;
   
    [SA, waveerp, freqs] = graph_spectral_entropy_days(SE, crs, 24);  % 24 hours of the morning (8:00 a.m  to 8:00 p.m.)
    
    if(save_results)
        s1 = name_ses;
        s2 = '_240min_wholeday_.mat';
        s = strcat(s1,s2);
        pathstr_ses = strcat(pathstr_ses, '/SE_240min_whole_day/');
    
        path_copy = strcat(pathstr_ses, s)
    
        copyfile('save_aux.mat', path_copy )
    
        delete save_aux.mat
    end
    
elseif( analysis_120min_ )
    Ts = 60;
    Fs = 1/Ts;
 
    nfft = windows_i;
   
    
    %data_used = whole_data;
    
     data_used = mean(temp);


    SE = [];
    TM = [];

   
      for i = 1 : 1 : length(data_used)
        if i+windows_i-1 <= length(data_used)
          
            aux = data_used(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],nfft,length(aux),0);
            
            SE = [SE Y];
            TM = [TM i];
        end
     end   
     
   %plot(TM, SE), ylim([.7 1]);
%    figure,
%    plot(TM, SE); 
       crs = 'UWS';
%     SE = SE;
   
    [SA, waveerp, freqs]=graph_spectral_entropy_days(SE, crs, 2);  % 2hours
    
    s1 = name_ses;
    
    s2 = '_120min_.mat';
    
    s2_SE = '_SE_120min_.mat';
    
    s = strcat(s1,s2);
    s_SE = strcat(s1,s2_SE);
    
    pathstr_ses_ = strcat(pathstr_ses, '/SE_120min/');
    
    pathstr_ses_SE = strcat(pathstr_ses, '/SE_120min/SE/');
    
    
    
    path_copy = strcat(pathstr_ses_, s)
    path_copy_SE = strcat(pathstr_ses_SE, s_SE)
    
   
    copyfile('SE_data.mat', path_copy_SE )
    
    copyfile('save_aux.mat', path_copy )
    
    delete save_aux.mat
    delete SE_data.mat
else
      disp('-------------------------------------------');
      fprintf(1,'\n Opcion no valida      \n');
      disp('-------------------------------------------');

end

%     
% n = length(data_whole_day);
% nn = ceil(n/2 + 1);
% x = data_whole_day;
% FF = abs(fft(x)/sqrt(n)).^2
% P = (4/n)*FF(1:nn)% # Only need the first (n/2)+1 values of the FFT result.
% f = (1:nn)/n% # this creates harmonic frequencies from 0 to .5 in steps of 1/128.
% plot(f, log10(P))%, type="l") # This plots the periodogram; type = “l” creates a line plot.  Note: l is lowercase L, not number 1.



%plot(tm, se)
%%%% SUBSTITUTE WITH YOUR WORKING DIRECTORY %%%%% 
%save('SE_6hours','se','tm')







end


end





