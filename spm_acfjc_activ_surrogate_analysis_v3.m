function spm_acfjc_activ_surrogate_analysis_v3

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
    
 
    
    factor = 1440/resolution;
    nbj = floor(size(acti,1)/factor); %to count the total number of full days (24h) of recording
    disp([num2str(nbj) ' x 24h enregistr�es']);

    timestart = strvcat(cellstr(logfile{3}(1)));% heure du d�but de l'enregistrement
    heure= str2num(timestart(1:2));
    min = str2num(timestart(4:5));
    
    
 

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
 



% Step 5 :  Doing the Surrogate Analysis according with the paper


  Messor_vector = [];
  Amplitude_vector = [];
  acrophase_vector = [];
  p_values = [];

  w = 2*pi;
  alpha = .05; %  5%
  
  disp('---------------');

  
total_time_in_min_analysis = nday_surrogate_analysis*60*24;

 % The first two hours are rejected to avoid data inconsistency
 % also to the surrogate analysis we start since the 6 first hours (after
 % the deletion of the 2 hours of inconsistency:

deleted_time = 2*60; % 2 hours
 
init_time = 6*60;  % 6 hours  % this is not considering the deleted time

ii = init_time:10:total_time_in_min_analysis;

 fprintf(1,'\n Calculando el Surrogate Analysis .....  \n');
 
 y_ = acti(1:total_time_in_min_analysis);
 y = y_(tf_delete:total_time_in_min_analysis);
 tp = tf_delete:total_time_in_min_analysis;
 t1 = tp/max(tp);

 [M_,Amp_,phi_,p_value_] = cosinor(t1',y,w,alpha,false);
 
  
for index_t = 1:size(ii,2)
   % this is the paper: "Actigraphy assessments of circardian sleep-wake
   % cycles in the Vegetative and Minimally Conscious States" :
   % I mean the following if-statement
   if( ii(index_t) <= 19*60 || ii(index_t) >= 28*60) 
     t = deleted_time:ii(index_t);
     t = t';
     y = acti(t);
     t = t./max(t);
%     plot(t,y);
      if( max(y) ==  0 )
         M_i = 0;
         Amp_i = 0;
         phi_i= 0;
         p_value = 0; 
         continue; 
      else
        fprintf(1,'Results of Cosinor for the time = %g (in minutes) \n\n',ii(index_t));

        [M_i,Amp_i,phi_i,p_value] = cosinor(t,y,w,alpha,false); %false: it won't show the graphs
      end
      
     Messor_vector = [Messor_vector;M_i];
     Amplitude_vector = [Amplitude_vector; Amp_i];
     acrophase_vector = [acrophase_vector; phi_i];
     p_values = [p_values; p_value];
    
     fprintf(1,'End of Results of Cosinor for the time = %g \n\n',ii(index_t));
    
     disp('---------------');
   end
    
end

 fprintf( 'nday_analysis = %g    \n',  nday_analysis);

 fprintf(1,'\n Mean and STD Values:  \n');
 disp('-------------------------------------------');
 
 factor_angle = 180/pi; % to convert radians to degrees
 

 fprintf(1,'Messor:     mean = %g   .....   std = %g \n\n', mean(Messor_vector), std(Messor_vector));
 fprintf(1,'Amplitude:  mean = %g   .....   std = %g \n\n', mean(Amplitude_vector), std(Amplitude_vector));
 fprintf(1,'Acrophase (degrees):  mean = %g   .....   std = %g \n\n', (factor_angle)*mean(acrophase_vector), (factor_angle)*std(acrophase_vector));
 fprintf(1,'p-value:    mean = %g   .....   std = %g \n\n', mean(p_values), std(p_values));
 
 p95_p_values = prctile(p_values, 95);
%  [p,h] = corrcoef (Amplitude_vector, Messor_vector)
 


%%%

% Step 6: Computing the Mesor, ampitudem and Acrophase of the first 4 days

 fprintf(1,'\n Computing the Messor, Amplitude and Acrophase of the %g days: ...  \n', nday_analysis);
% 

nday_analysis

size_tt = 24*60*nday_analysis/resolution;

y_tt = acti(1:resolution:size_tt);
t_tt = 1:resolution:size_tt;
t_tt = t_tt';
t_tt = t_tt./max(t_tt);
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

% Step 7:  Determining if the p-value of the 4 days is significant

 if(p_value_tt <p95_p_values )
     fprintf(1,'The p-value is significant \n');
 else   
     fprintf(1,'The p-value is NOT significant \n');      
 end

 disp('-----------DONE :) ---------------');
 disp('-------------------------------------------');


