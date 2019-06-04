function spm_acfjc_activ_surrogate_analysis_v5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:                           %%    
%%%  Aldo Camargo                      %% 
%%%  University of Liege (Belgium)     %%
%%%                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paper:  "Actigraphy assessments of circardian sleep-wake
%% cycles in the Vegetative and Minimally Conscious States"
%%

close all, clear all

% Step 1:  Reading and loading the file

file = spm_select(Inf, '.+\.AWD$', 'Select files ',...
        [], [], '.AWD'); %Show all .AWD files in the directory datadir



resolution = 1; % resolution of the epocs is one minute



% Step 2: Setting the number of days of analysis 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Number of days to analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nday_analysis = 4;

nday_surrogate_analysis = 4; % according with the paper
isub = 1;

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
    
    
    

  
    
    init_data_time = int_start_hour*60 + int_start_min;
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%                                                                  %% 
%%% Step 4: Removing the first 2 hours of data of the first day      %%
%%%                                                                  %%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
 tf_delete = 2*60/resolution;
 acti_days{1}(1:tf_delete) = 0;  
 acti(1:tf_delete) = 0;
  
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%%%                                                                  %% 
%%% Step 4-b: Setting to zero every new day      %%
%%%                                                                  %%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
[t_0, day_2, day_3, day_4, day_5] = activemeter_get_4days(acti, init_data_time);

% figure,
% subplot(3,2,3); plot(t_0, day_2);  title('Day 2 ext');ylim([0 2000]);
% subplot(3,2,4); plot(t_0, day_3);  title('Day 3 ext');ylim([0 2000]);
% subplot(3,2,5); plot(t_0, day_4);  title('Day 4');ylim([0 2000]);
% subplot(3,2,6); plot(t_0, day_5);  title('Day 5 ext');ylim([0 2000]);
% Step 5 :  Doing the Surrogate Analysis according with the paper



  
total_time_in_min_analysis = nday_surrogate_analysis*60*24;

 % The first two hours are rejected to avoid data inconsistency
 % also to the surrogate analysis we start since the 6 first hours (after
 % the deletion of the 2 hours of inconsistency:

deleted_time = 2*60; % 2 hours
 
init_time = 6*60;  % 6 hours  % this is not considering the deleted time

ii = init_time:10:total_time_in_min_analysis;

 fprintf(1,'\n Calculando el Surrogate Analysis .....  \n');
 
%  y_ = acti(1:total_time_in_min_analysis);
%  y = y_(tf_delete:total_time_in_min_analysis);
%  tp = tf_delete:total_time_in_min_analysis;
%  t1 = tp/max(tp);
% 
%  [M_,Amp_,phi_,p_value_] = cosinor(t1',y,w,alpha,false);
%  

 w = 2*pi;
 alpha = .05; %  5%

 % this part is for testing
% tx = 0:1:24*60-1;
% txp = tx./max(tx);
% yx= day_2(1:length(tx));
% yxp = yx./max(yx);
% [Mx,Ampx,phix,p_valuex] = cosinor(txp',yxp,w,alpha,false);



  time_vector = [];
  Messor_vector = [];
  Amplitude_vector = [];
  acrophase_vector = [];
  p_values = [];


  
  disp('---------------');


% This part computes the goodness from 6 houres to 48 hours
% not considering the range from 19h to 28h (because are consdering
% circadian periods

acti_full_4days_data = [day_2; day_3; day_4; day_5];

for tt = 6*60:10:2*24*60  % for 2 complete days(48 hours) starting from 6 hours
 if (tt <= 19*60 || tt >= 28*60)
    if ( tt < 24*60)
        tx = 0:1:tt-1;
        txp = tx./max(tx);
        yx= day_2(1:length(tx));
     elseif( tt >=24*60 && tt <=4*24*60 )
        tx = 0:1:tt-1;
        txp = tx./max(tx);
        yx= acti_full_4days_data(1:length(tx));
     end
            
      if( max(yx) ==  0 )
          M_i = 0;
          Amp_i = 0;
          phi_i= 0;
          p_value = 0; 
          continue; 
       else
           yxp = yx./max(yx);
           fprintf(1,'Results of Cosinor for the time = %g (in minutes) \n\n',tt);
           [M_i,Amp_i,phi_i,p_value] =  cosinor(txp',yxp,w,alpha,false);
       end
     time_vector =  [time_vector; tt];
     Messor_vector = [Messor_vector;M_i];
     Amplitude_vector = [Amplitude_vector; Amp_i];
     acrophase_vector = [acrophase_vector; phi_i];
     p_values = [p_values; p_value];
    
     fprintf(1,'End of Results of Cosinor for the time = %g \n\n',tt);
    
     disp('---------------');

   
 end
end

verification_table = [time_vector p_values Messor_vector Amplitude_vector acrophase_vector];


save('surrogate_analysis_.mat', 'verification_table')

csvwrite('surrogate_analysis_.csv', verification_table)


%  fid=fopen('CONTROL_awd_120min.csv','w');
%  fprintf(fid, '%s,',controls_awd_selected_pks_values{i}.SE);
%         fprintf(fid, '\n ');
% fclose(fid);
%     fclose(fid2);


% 
% 
% 
% 
%  fprintf( 'nday_analysis = %g    \n',  nday_analysis);
% 
%  fprintf(1,'\n Mean and STD Values:  \n');
%  disp('-------------------------------------------');
%  
%  factor_angle = 180/pi; % to convert radians to degrees
%  
% 
%  fprintf(1,'Messor:     mean = %g   .....   std = %g \n\n', mean(Messor_vector), std(Messor_vector));
%  fprintf(1,'Amplitude:  mean = %g   .....   std = %g \n\n', mean(Amplitude_vector), std(Amplitude_vector));
%  fprintf(1,'Acrophase (degrees):  mean = %g   .....   std = %g \n\n', (factor_angle)*mean(acrophase_vector), (factor_angle)*std(acrophase_vector));
%  fprintf(1,'p-value:    mean = %g   .....   std = %g \n\n', mean(p_values), std(p_values));
%  
%  p95_p_values = prctile(p_values, 0.05);
% %  [p,h] = corrcoef (Amplitude_vector, Messor_vector)
%  
% 
% 
% %%%
% 
% % Step 6: Computing the Mesor, ampitudem and Acrophase of the first 4 days
% 
%  fprintf(1,'\n Computing the Messor, Amplitude and Acrophase of the %g days: ...  \n', nday_analysis);
% % 
% 
% nday_analysis
% 
% size_tt = 24*60*nday_analysis/resolution;
% 
% y_tt = acti(1:resolution:size_tt);
% t_tt = 1:resolution:size_tt;
% t_tt = t_tt';
% t_tt = t_tt./max(t_tt);
% [M_tt,Amp_tt,phi_tt,p_value_tt] = cosinor(t_tt,y_tt,w,alpha,false);
% 
% 
%  disp('-------------------------------------------');
% 
%  fprintf(1,'\n Results for the first %g days  \n', nday_analysis);
%  disp('-------------------------------------------');
%  
% 
%  fprintf(1,'Messor:      = %g    \n', M_tt);
%  fprintf(1,'Amplitude:   = %g    \n', Amp_tt);
%  fprintf(1,'Acrophase (degrees):   = %g  \n', (factor_angle)*phi_tt);
%  fprintf(1,'p-value:     = %g   \n', p_value_tt);
%   disp('-------------------------------------------');
% %  
% 
% % Step 7:  Determining if the p-value of the 4 days is significant
% 
%  if(p_value_tt <p95_p_values )
%      fprintf(1,'The p-value is significant \n');
%  else   
%      fprintf(1,'The p-value is NOT significant \n');      
%  end
% 
%  disp('-----------DONE :) ---------------');
%  disp('-------------------------------------------');


