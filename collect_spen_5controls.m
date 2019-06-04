

close all;
clear all;
clc;

k = 30;   % average of 30 min 


path_code = '/home/aldo/Documents/Projects/Avtivemeter/Data';
% 
% if(strcmp(segment,'morning'))
%     path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/';
%     path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/LIS/';
%     path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/';
%     path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/';
%     path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/';
%     path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS*/';
%     path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/';
%     path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/';
%     path_uws_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS*/';
%     path_uws_non_TBI = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/NonTBI/';
%     path_uws_TBI = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/TBI/';

%elseif(strcmp(segment,'mtn_files'))
    path_control = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/healthy_control/';
    path_emcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/EMCS/';
    path_mcs_p = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS+/';
    path_mcs_m = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS-/';
    path_mcs_ast = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS_ast/';
    path_mcs = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/MCS/';
    path_uws = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/UWS/';
    path_lis = '/home/aldo/Documents/Projects/Avtivemeter/Files/MTN_Files/LIS/';

   
cd(path_control);
SUBJlist_Control_MTN = dir('*_raw_.mat');

 for i = 1:length(SUBJlist_Control_MTN)
    SUBJname_Control_MTN = SUBJlist_Control_MTN(i).name;
    data=load(SUBJname_Control_MTN);
    Control_mtn_aux{i} = data.temp;
 end

    

cd(path_control);
% raw_data = [];
% load healthy_control_1_raw.mat
% raw_data = [raw_data; aux'];
% load healthy_control_2
% raw_data = [raw_data; aux'];
% load healthy_control_3
% raw_data = [raw_data; aux'];
% load healthy_control_4
% raw_data = [raw_data; aux'];
% load Thelen
% raw_data = [raw_data; aux'];
% save('try','raw_data')

%  aux = EEG.icaweights*EEG.icasphere*(EEG.data);
raw_data = Control_mtn_aux{2};
raw_data_mean = mean(raw_data);
fav_mean_raw_data(:,1) = act_mov_mean(raw_data(1,:),k);
fav_mean_raw_data(:,2) = act_mov_mean(raw_data(2,:),k);
fav_mean_raw_data(:,3) = act_mov_mean(raw_data(3,:),k);
fav_mean_raw_data(:,4) = act_mov_mean(raw_data(4,:),k);

% Applying Box-cox transformation with lambda = 0.2 
% following the idea of the paper: Classification of Rest and Active 
% Periods in Actigraphy Data Using 
% PCA

lambda_raw = 0.2;
%  four because there are 4 controls
transf_raw_data(:,1) = boxcox(lambda_raw, raw_data(1,:)');
transf_raw_data(:,2) = boxcox(lambda_raw, raw_data(2,:)');
transf_raw_data(:,3) = boxcox(lambda_raw, raw_data(3,:)');
transf_raw_data(:,4) = boxcox(lambda_raw, raw_data(4,:)');


X_ica = fav_mean_raw_data';

%X_ica = transf_raw_data';  % Will depend if I want with boxcox or ave_mov

X_pca = X_ica;

[weights,sphere] = runica(X_ica,'extended',1);
ica_raw_data = weights*sphere*(X_ica);

% Perform ICA
%ica_raw_data = fastICA(X_ica,2);

% Perform PCA
[pca_raw_data] = princomp(X_pca);


X_Control_mtn  = raw_data;

[COEFF_X_pca,SCORE_X_pca, latent] = princomp(X_pca);
y_PCA = SCORE_X_pca;

figure,
scatter(y_PCA(:,1), y_PCA(:,2));

cumsum(latent)./sum(latent)

           
biplot(COEFF_X_pca(:,1:2),'Scores',SCORE_X_pca(:,1:2),'VarLabels',...
  {'X1' 'X2' 'X3' 'X4'})


M_pca_raw_data(1,:) = act_mov_mean(y_PCA(:,1),k);
M_pca_raw_data(2,:) = act_mov_mean(y_PCA(:,2),k);

 figure,
 subplot(5,1,1); plot(raw_data');
 subplot(5,1,2); plot(ica_raw_data(1,:)');
 subplot(5,1,3); plot(ica_raw_data(2,:)');
 subplot(5,1,4); plot(ica_raw_data(3,:)');
 subplot(5,1,5); plot(ica_raw_data(4,:)');
 
 figure,
 subplot(4,1,1); plot(raw_data(1,:)');
 subplot(4,1,2); plot(raw_data(2,:)');
 subplot(4,1,3); plot(raw_data(3,:)');
 subplot(4,1,4); plot(raw_data(4,:)');
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  k-means  %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%


X_k_mean = [ y_PCA(:,1), y_PCA(:,2)];

%X_k_mean = [ M_pca_raw_data(1,:)', M_pca_raw_data(2,:)'];

factor_k = 3;
opts = statset('Display','final');
[idx,C] = kmeans(X_k_mean,factor_k,'Distance','cityblock',...
    'Replicates',5,'Options',opts);


figure;
plot(X_k_mean(idx==1,1),X_k_mean(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X_k_mean(idx==2,1),X_k_mean(idx==2,2),'b.','MarkerSize',12)
hold on
plot(X_k_mean(idx==3,1),X_k_mean(idx==3,2),'b.','MarkerSize',12)
plot(C(:,1),C(:,2),C(:,3),'kx',...
     'MarkerSize',15,'LineWidth',3)
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Hilbert Transform    %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  DFT to find the periodicity   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% The input signal is the ica of the raw%% 
%%% data(1 and 2 components)              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 1/60;  %% 1 min interval
X_fft = ica_raw_data(1,:)';  % choosing the first component of the ICA
abs_X_fft = abs(fft(X_fft));
phase_X_fft = unwrap(angle(X_fft));

f = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector

figure
subplot(2,1,1)
plot(f,abs_X_fft)
title('Magnitude')
ax = gca;
ax.XTick = [10 40 70 90];

subplot(2,1,2)
plot(f,phase_X_fft*180/pi)
title('Phase')
ax = gca;
ax.XTick = [10 40 70 90];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%         DFT Power Spectrum            %% 
%%%                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_fft = raw_data(1, :);
%X_fft = y_PCA;
Ts = 60;
Fs = 1/Ts;
N = length(X_fft);
xdft = fft(X_fft);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(X_fft):Fs/2;

figure
plot(freq,10*log10(psdx))
% plot(freq, psdx);
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%          DFT of the upsampling to 1 sec          %%%%
%%%%%%%%%%                                                  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 1/60; 
X_fft_upsampling_1sec =(upsample(X_fft, 60))';

abs_X_fft = abs(X_fft_upsampling_1sec);
phase_X_fft = unwrap(angle(X_fft_upsampling_1sec));

f = (0:length(X_fft_upsampling_1sec)-1)*fs/length(X_fft_upsampling_1sec);        % Frequency vector

figure
subplot(2,1,1)
plot(f,abs_X_fft)
title('Magnitude')
ax = gca;
%ax.XTick = [10 40 70 90];

subplot(2,1,2)
plot(f,phase_X_fft*180/pi)
title('Phase')
ax = gca;
%ax.XTick = [10 40 70 90];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Doing the same for the second component of the ICA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:4
 fs = 1/60;  %% 1 min interval
 X_fft = ica_raw_data(i,:)';
 abs_X_fft = abs(X_fft);
 phase_X_fft = unwrap(angle(X_fft));

 f = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector

 figure
 subplot(2,1,1)
 plot(f,abs_X_fft)
 title('Magnitude')
 ax = gca;
 ax.XTick = [10 40 70 90];

 subplot(2,1,2)
 plot(f,phase_X_fft*180/pi)
 title('Phase')
 ax = gca;
% ax.XTick = [10 40 70 90];

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Testing the DFT manually, because the frequency is not obvious to
%%%% figure it out :)
%%%%
%%%% Test with the same example of Lecture 7 - The Discrete Fourier Transform
%%%%  http://www.robots.ox.ac.uk/~sjrob/Teaching/SP/l7.pdf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 4


index_i = 0:1:N-1;
index_j = index_i;

W = exp(-j*2*pi/N)
func = [8 4 8 0]';

for ii = 1:N
    for jj=1:N
      C(ii,jj) =  W^(index_i(ii)*index_j(jj));   
    end
end



F = C*func

% Now doing the same with the actigraphy data 

N = size(X_fft, 1);

index_i = 0:1:N-1;
index_j = index_i;

W = exp(-j*2*pi/N);
f = X_fft;

for ii = 1:N
    for jj=1:N
      C(ii,jj) =  W^(index_i(ii)*index_j(jj));   
    end
end

F = C*func;

ff = index_j;

%%%%


figure
fax_bins = [ 0:N-1];
plot(fax_bins, abs(F));

fax_Hz = fax_bins*fs/N;
plot(fax_Hz, abs(F));

figure
Xmags = abs(fftshift(F));
N_2 = ceil(N/2);
fax2_Hz = (fax_bins - N_2)*fs/N;
plot(fax2_Hz, Xmags);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                                                                       %%% 
%%%% I found that there are frequencies around 70 min, so I would like
%%%%                                                                       %%% 
%%%%                                                                       %%%     
%%%% to know how the spectral entropy works  :D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% 1.- Using the whole day

X_spectral_entropy = X_fft;

windows_i = 60
SE_mean_day = [];
TM_mean_day = [];
for i = 1 : 1: length(X_spectral_entropy)  % it was 15
    if i+windows_i-1 <= length(X_spectral_entropy)
            %aux = act(i:i+30-1);
            aux = X_spectral_entropy(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE_mean_day = [SE_mean_day Y];
            TM_mean_day = [TM_mean_day i];
    end
end
  %  plot(TM_mean, SE_mean), ylim([.7 1]),title('Plot of the mean of chunks for the days 2,3,4 and 5 ');
    crs = 'Control';
    SE = SE_mean_day;
    graph_spectral_entropy_day(SE_mean_day, crs);



%%% 2.- Using chunks of 120 min
k = 120;
L_y2 = length(X_fft); % because epocs of 1 min
j = 1;
for i=1:k:L_y2
     y_chunk{j} = X_fft(i:i+k-1);
     j = j + 1;
end

% temp_yday_mean_chunk = [];
% [ mm, nchunks_day]  = size(y_chunk);
% for iii = 1:nchunks_day
% % temp_y_mean_chunk = [y_mean_chunk{2}; y_mean_chunk{3}; y_mean_chunk{4}; y_mean_chunk{5} ];
% temp_yday_mean_chunk = [temp_yday_mean_chunk; (y_chunk{iii})' ];
% end
% mean_yday_mean_chunk = mean(temp_yday_mean_chunk);
% temp_y = mean((cell2mat(y_chunk))');
% 
% temp = [temp_y;
%         mean_yday_mean_chunk];

mean_yday_mean_chunk = mean((cell2mat(y_chunk))');

windows_i = 60
SE_mean_day = [];
TM_mean_day = [];
for i = 1 : 1: length(mean_yday_mean_chunk)  % it was 15
    if i+windows_i-1 <= length(mean_yday_mean_chunk)
            %aux = act(i:i+30-1);
            aux = mean_yday_mean_chunk(i:i+30-1);
            Y = my_spectral_entropy(aux,1/60,[.0006 .0083],windows_i,length(aux),0);
            SE_mean_day = [SE_mean_day Y];
            TM_mean_day = [TM_mean_day i];
    end
end
  %  plot(TM_mean, SE_mean), ylim([.7 1]),title('Plot of the mean of chunks for the days 2,3,4 and 5 ');
    
crs = 'Control';
SE = SE_mean_day;
graph_spectral_entropy(SE_mean_day, crs);

% Now I will se what happens if I use the mean of a chunks of 120 mins
fs = 1/60;  %% 1 min interval
X_fft2 = ica_raw_data(1,:)';
abs_X_fft = abs(X_fft);
phase_X_fft = unwrap(angle(X_fft));

f = (0:length(X_fft)-1)*fs/length(X_fft);        % Frequency vector

subplot(2,1,1)
plot(f,abs_X_fft)
title('Magnitude')
ax = gca;
ax.XTick = [10 40 70 90];




