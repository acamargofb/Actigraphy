function spm_acfjc_sleep_awake(Algorithm)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:                           %%    
%%%  Aldo Camargo                      %% 
%%%  University of Liege (Belgium)     %%
%%%      aldo.camargo@ulg.ac.be        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paper:  "Actigraphy assessments of circardian sleep-wake
%% cycles in the Vegetative and Minimally Conscious States"
%%

%close all, clear all


%Algorithm = 'sadeh';



% Step 1:  Reading and loading the file

file = spm_select(Inf, '.+\.AWD$', 'Select files ',...
        [], [], '.AWD'); %Show all .AWD files in the directory datadir



resolution = 1; % resolution of the epocs is one minute





% Step 2: Setting the number of days of analysis 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number of days to analysis                                     %%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nday_analysis = 4;
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
    
    temp_start_date = strsplit(start_date, '-');
    
    int_start_day = str2num(strvcat(temp_start_date(1)));
    int_start_year = str2num(strvcat(temp_start_date(3)));
    
    temp_switch = temp_start_date{2};
    
    
    switch(temp_switch)
        case 'Jan'
            int_start_month = 1;
        case 'Feb'
            int_start_month = 2;
        case 'Mar'
            int_start_month = 3;
        case 'Apr'
            int_start_month = 4;
        case 'May'
            int_start_month = 5;
        case 'Jun'
            int_start_month = 6;
        case 'Jul'
            int_start_month = 7;
        case 'Aug'
            int_start_month = 8;
        case 'Sep'
            int_start_month = 9;
        case 'Oct'
            int_start_month = 10;
        case 'Nov'
            int_start_month = 11;
        case 'Dec'
            int_start_month = 12;
        otherwise
            int_start_month = 1;        
    end
    
    
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

% [M_tt,Amp_tt,phi_tt,p_value_tt] = cosinor(t_tt,y_tt,w,alpha,false);
% 
% 
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
% %  

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

if(strcmp(Algorithm,'Sadeh'))
%if(Algorithm == 'Sadeh')
    fprintf(1,'\n Using Algorithm Sadeh ... \n');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Using Sadeh Algorithm  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[mu_act_1, std_act_1,LogAct_1, nat_act_1, PS_SI_1] = activ_sadeh(y_1);

y1_sleep(find(PS_SI_1 < 0.5)) = 0;  %%% awake  %%%
y1_sleep(find(PS_SI_1 >= 0.5)) = 1;  %%% sleep  %%%

%check_vector = [PS_SI; y_sleep];

[mu_act_2, std_act_2,LogAct_2, nat_act_2, PS_SI_2] = activ_sadeh(y_2);

y2_sleep(find(PS_SI_2 < 0.5)) = 0;  %%% awake  %%%
y2_sleep(find(PS_SI_2 >= 0.5)) = 1;  %%% sleep  %%%

[mu_act_3, std_act_3,LogAct_3, nat_act_3, PS_SI_3] = activ_sadeh(y_3);

y3_sleep(find(PS_SI_3 < 0.5)) = 0;  %%% awake  %%%
y3_sleep(find(PS_SI_3 >= 0.5)) = 1;  %%% sleep  %%%

[mu_act_4, std_act_4,LogAct_4, nat_act_4, PS_SI_4] = activ_sadeh(y_4);

y4_sleep(find(PS_SI_4 < 0.5)) = 0;  %%% awake  %%%
y4_sleep(find(PS_SI_4 >= 0.5)) = 1;  %%% sleep  %%%

elseif(strcmp(Algorithm,'Sazonov'))
    fprintf(1,'\n Using Algorithm Sazonov ... \n');
%% Using Sazonov Algorithm

PS_eNee_1 = activ_sazonov(y_1);

y1_sleep(find(PS_eNee_1 < 0.5)) = 0;  %%% awake  %%%
y1_sleep(find(PS_eNee_1 >= 0.5)) = 1;  %%% sleep  %%%

%check_vector = [PS_SI; y_sleep];

PS_eNee_2 = activ_sazonov(y_2);

y2_sleep(find(PS_eNee_2 < 0.5)) = 0;  %%% awake  %%%
y2_sleep(find(PS_eNee_2 >= 0.5)) = 1;  %%% sleep  %%%

PS_eNee_3 = activ_sazonov(y_3);

y3_sleep(find(PS_eNee_3 < 0.5)) = 0;  %%% awake  %%%
y3_sleep(find(PS_eNee_3 >= 0.5)) = 1;  %%% sleep  %%%

PS_eNee_4 = activ_sazonov(y_4);

y4_sleep(find(PS_eNee_4 < 0.5)) = 0;  %%% awake  %%%
y4_sleep(find(PS_eNee_4 >= 0.5)) = 1;  %%% sleep  %%%

else
    fprintf(1,'\n Not recognize Algorithm... \n leaving the program  ... sorry...:( \n');
    return
end
% fprintf(1,'Start date:   = %s    \n', start_date);
% fprintf(1,'Start hour:   = %s    \n', start_hour);
% 
% y=[1 2 3 4 5 6]
% x=['a','b','c','d','e','f']
% plot(y)
% set(gca,'xticklabel',x.')


% t_1_string = vector_mins2hm(t_1 + init_data_time - 1);

%start_date_yyyy_hh_mm = 
t_1_hhmm_int = vector_mins2hm_int(t_1 + init_data_time  - 1);
t_2_hhmm_int = vector_mins2hm_int(t_2 - day_1);
t_3_hhmm_int = vector_mins2hm_int(t_3 - day_2);
t_4_hhmm_int = vector_mins2hm_int(t_4 - day_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%  Ploting part            %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N1_epochs = day_1; % number of epocs on day1
Act_year = repmat(int_start_year,1,N1_epochs);
Act_month = repmat(int_start_month,1,N1_epochs);
day_1_ = repmat(int_start_day,1,N1_epochs);
hours_1 = (t_1_hhmm_int(:,1))';
mins_1 = (t_1_hhmm_int(:,2))';
seconds = zeros(1, N1_epochs);

sdate_1 = datenum(Act_year,Act_month,day_1_,hours_1,mins_1,seconds);

figure,
subplot(2,1,1);  plot(sdate_1, y_1); datetick('x', 'HHPM'); title('Day 1'); ylim([0 2000]); 
%subplot(2,2,3);  plot(t_1, y_1); axis([0 day_1 0 2000]); title('Day 1');
%subplot(2,2,4); plot(t_1, y1_sleep); axis([0 day_1 0 2]); title('Sleep and Awake plot for the day 1');
%subplot(2,2,2);  plot(sdate_1, y1_sleep);   fill(sdate_1, y1_sleep, 'k'); datetick('x', 'HHPM'); title('Sleep and Awake plot for the day 1'); ylim([0 2]);
subplot(2,1,2);  plot(sdate_1, y1_sleep); datetick('x', 'HHPM'); title('Sleep and Awake plot for the day 1'); ylim([0 2]);

N2_epochs = day_2 - day_1; % number of epocs on day1
Act_year_2 = repmat(int_start_year,1,N2_epochs);
Act_month_2 = repmat(int_start_month,1,N2_epochs);
day_2_ = repmat(int_start_day + 1 ,1,N2_epochs);
hours_2 = (t_2_hhmm_int(:,1))';
mins_2 = (t_2_hhmm_int(:,2))';
seconds_2 = zeros(1, N2_epochs);

sdate_2 = datenum(Act_year_2,Act_month_2,day_2_,hours_2,mins_2,seconds_2);



figure,
subplot(2,1,1);  plot(sdate_2, y_2); datetick('x', 'HHPM'); title('Day 2'); ylim([0 2000]); 
%subplot(2,2,4);  plot(sdate_2, y2_sleep);   fill(sdate_2, y2_sleep, 'r'); datetick('x', 'HHPM'); title('Sleep and Awake plot for the day 2'); ylim([0 2]);
subplot(2,1,2);  plot(sdate_2, y2_sleep);   datetick('x', 'HHPM'); title('Sleep and Awake plot for the day 2'); ylim([0 2]);


figure,
N3_epochs = day_3 - day_2; % number of epocs on day1
Act_year_3 = repmat(int_start_year,1,N3_epochs);
Act_month_3 = repmat(int_start_month,1,N3_epochs);
day_3_ = repmat(int_start_day + 1 ,1,N3_epochs);
hours_3 = (t_3_hhmm_int(:,1))';
mins_3 = (t_3_hhmm_int(:,2))';
seconds_3 = zeros(1, N3_epochs);

sdate_3 = datenum(Act_year_3,Act_month_3,day_3_,hours_3,mins_3,seconds_3);


% subplot(2,2,1);  plot(t_3, y_3); axis([day_2 day_3 0 2000]); title('Day 3');
% subplot(2,2,2);  plot(t_3, y3_sleep); axis([day_2 day_3 0 2]); title('Sleep and Awake plot for the day 3');


subplot(2,1,1);  plot(sdate_3, y_3); datetick('x', 'HHPM'); title('Day 3'); ylim([0 2000]); 
subplot(2,1,2);  plot(sdate_3, y3_sleep);   datetick('x', 'HHPM'); title('Sleep and Awake plot for the day 3'); ylim([0 2]);





N4_epochs = day_4 - day_3; % number of epocs on day1
Act_year_4 = repmat(int_start_year,1,N4_epochs);
Act_month_4 = repmat(int_start_month,1,N4_epochs);
day_4_ = repmat(int_start_day + 1 ,1,N4_epochs);
hours_4 = (t_4_hhmm_int(:,1))';
mins_4 = (t_4_hhmm_int(:,2))';
seconds_4 = zeros(1, N4_epochs);

sdate_4 = datenum(Act_year_4,Act_month_4,day_4_,hours_4,mins_4,seconds_4);


% subplot(2,2,3);  plot(t_4, y_4); axis([day_3 day_4 0 2000]); title('Day 4');
% subplot(2,2,4);  plot(t_4, y4_sleep); axis([day_3 day_4 0 2]); title('Sleep and Awake plot for the day 4');

figure,
subplot(2,1,1);  plot(sdate_4, y_4); datetick('x', 'HHPM'); title('Day 4'); ylim([0 2000]); 
subplot(2,1,2);  plot(sdate_4, y4_sleep);   datetick('x', 'HHPM'); title('Sleep and Awake plot for the day 4'); ylim([0 2]);



end









