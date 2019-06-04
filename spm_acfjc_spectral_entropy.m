function spm_acfjc_spectral_entropy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:                           %%    
%%%  Aldo Camargo                      %% 
%%%  University of Liege (Belgium)     %%
%%%                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paper:  "Actigraphy assessments of circardian sleep-wake
%% cycles in the Vegetative and Minimally Conscious States"
%%

close all, clear all, clc

% Step 1:  Reading and loading the file

file = spm_select(Inf, '.+\.AWD$', 'Select files ',...
        [], [], '.AWD'); %Show all .AWD files in the directory datadir



resolution = 1; % resolution of the epocs is one minute

% Step 1.1:  Setting init values for the computation

graph_mean_day_spectral_entropy = true;

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

 fprintf(1,'\n Computing the Messor, Amplitude and Acrophase of the %g days: ...  \n', nday_analysis);
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

[M_tt,Amp_tt,phi_tt,p_value_tt] = cosinor(t_tt,y_tt,w,alpha,false);


 disp('-------------------------------------------');
 fprintf(1,'\n Results for the first %g days  \n', nday_analysis);
 disp('-------------------------------------------');
 

 fprintf(1,'Messor:      = %g    \n', M_tt);
 fprintf(1,'Amplitude:   = %g    \n', Amp_tt);
 fprintf(1,'Acrophase (degrees):   = %g  \n', (factor_angle)*phi_tt);
 fprintf(1,'p-value:     = %g   \n', p_value_tt);
 disp('-------------------------------------------');
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


if (int_start_hour > init_day)
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
    y1_night = acti(day_1_morning + 1:resolution:day_1);
%     figure,
    t1_night = day_1_morning+1:resolution:day_1;
%     subplot(2,1,2); plot(t1_night, y1_night);
end
    
y1_morning_mean = (sum(y1_morning))/(length(t1_morning));
y1_night_mean = (sum(y1_night))/(length(t1_night));


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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%          Computing the mean   for every day    %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(graph_mean_day_spectral_entropy)
   temp = [ y_2'; y_3'; y_4'; y_5'];

    y_mean = zeros(1,1440); % Because the epochs are on 1 min interval and is for 24 hours
    for i=1:1440 % Because the epochs are on 1 min interval and is for 24 hours
       y_mean(i) =  mean([y_2(i) y_3(i) y_4(i) y_5(i)]);
  
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%    Creating the chunk of data        %%%
%%%                                      %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Chunks every k min %%%

k = 120;  %%%% 120 min = 2 h

% for day 2


% y2_total = y2_morning + y2_night;
% t2_total = t2_morning + t2_night;

% figure,
% subplot(2,2,1), plot(t2_total, y2_total);
% subplot(2,2,2), plot(t2_morning, y2_morning);
% subplot(2,2,3), plot(t2_night, y2_night);
% subplot(2,2,4), plot(t_2, y_2);

number_of_chunks = 24*60/k;

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
% acticmeter on his arm, and normally start between 12 pm and 2 pm, which
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

save('y2chunk', 'y2_chunk', 'y3_chunk');


if(graph_mean_day_spectral_entropy)
    L_ymean = length(y_mean); % because epocs of 1 min
    j = 1;
    for i=1:k:L_ymean
         y_mean_chunk{j} = y_mean(i:i+k-1);
        j = j + 1;
    end
    
end





%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Spectral Entropy   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%for dd = 2:5  % from day 2 to 5
windows_i = 60



if(graph_mean_day_spectral_entropy)
    figure,
    for k =1:6
    SE = [];
    TM = [];
         for i = 1 : 15 : length(y_mean_chunk{k})
            if i+windows_i-1 <= length(y_mean_chunk{k})
                %aux = act(i:i+30-1);
                aux = y_mean_chunk{k}(i:i+30-1);
                Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
                SE = [SE Y];
                TM = [TM i];
            end
         end
    
        subplot(3,2,k),plot(TM, SE), ylim([.7 1]);
    
    end



    figure,
    for k =7:12
        SE = [];
        TM = [];
            for i = 1 : 15 : length(y_mean_chunk{k})
                if i+windows_i-1 <= length(y_mean_chunk{k})
                    %aux = act(i:i+30-1);
                    aux = y_mean_chunk{k}(i:i+30-1);
                    Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
                    SE = [SE Y];
                    TM = [TM i];
                end
            end
    
        subplot(3,2,k-6),plot(TM, SE), ylim([.7 1]);
    
    end
     
    temp_y_mean_chunk = [];
    for ii = 1:number_of_chunks
    % temp_y_mean_chunk = [y_mean_chunk{2}; y_mean_chunk{3}; y_mean_chunk{4}; y_mean_chunk{5} ];
     temp_y_mean_chunk = [temp_y_mean_chunk; y_mean_chunk{ii} ];
    end
    mean_y_mean_chunk = mean(temp_y_mean_chunk);
    
    figure,
    SE = [];
    TM = [];
    for i = 1 : 15 : length(mean_y_mean_chunk)
        if i+windows_i-1 <= length(mean_y_mean_chunk)
            %aux = act(i:i+30-1);
            aux = mean_y_mean_chunk(i:i+30-1)
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    plot(TM, SE), ylim([.7 1]),title('Plot of the mean of chunks for the days 2,3,4 and 5 ');
    
    
    
else
  % Working for days 2, 3, 4 and 5
    % day 2%
figure,
for k =1:6
SE = [];
TM = [];
     for i = 1 : 15 : length(y2_chunk{k})
        if i+windows_i-1 <= length(y2_chunk{k})
            %aux = act(i:i+30-1);
            aux = y2_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k),plot(TM, SE), ylim([.7 1]);
    
end



figure,
for k =7:12
SE = [];
TM = [];
     for i = 1 : 15 : length(y2_chunk{k})
        if i+windows_i-1 <= length(y2_chunk{k})
            %aux = act(i:i+30-1);
            aux = y2_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k-6),plot(TM, SE), ylim([.7 1]);
    
end


%%% day 3 %%%

figure,
for k =1:6
SE = [];
TM = [];
     for i = 1 : 15 : length(y3_chunk{k})
        if i+windows_i-1 <= length(y3_chunk{k})
            %aux = act(i:i+30-1);
            aux = y3_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k),plot(TM, SE), ylim([.7 1]);
    
end



figure,
for k =7:12
SE = [];
TM = [];
     for i = 1 : 15 : length(y3_chunk{k})
        if i+windows_i-1 <= length(y3_chunk{k})
            %aux = act(i:i+30-1);
            aux = y3_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k-6),plot(TM, SE), ylim([.7 1]);
    
end


%%% day 4   %%%%%%


figure,
for k =1:6
SE = [];
TM = [];
     for i = 1 : 15 : length(y4_chunk{k})
        if i+windows_i-1 <= length(y4_chunk{k})
            %aux = act(i:i+30-1);
            aux = y4_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k),plot(TM, SE), ylim([.7 1]);
    
end



figure,
for k =7:12
SE = [];
TM = [];
     for i = 1 : 15 : length(y4_chunk{k})
        if i+windows_i-1 <= length(y4_chunk{k})
            %aux = act(i:i+30-1);
            aux = y4_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k-6),plot(TM, SE), ylim([.7 1]);
    
end



%%% day 5   %%%%%%


figure,
for k =1:6
SE = [];
TM = [];
     for i = 1 : 15 : length(y5_chunk{k})
        if i+windows_i-1 <= length(y5_chunk{k})
            %aux = act(i:i+30-1);
            aux = y5_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k),plot(TM, SE), ylim([.7 1]);
    
end



figure,
for k =7:12
SE = [];
TM = [];
     for i = 1 : 15 : length(y5_chunk{k})
        if i+windows_i-1 <= length(y5_chunk{k})
            %aux = act(i:i+30-1);
            aux = y5_chunk{k}(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE = [SE Y];
            TM = [TM i];
        end
    end
    
    subplot(3,2,k-6),plot(TM, SE), ylim([.7 1]);
    
end

end
















end









