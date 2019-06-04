
%save('data_software', 'Controls', 'EMCS','MCS', 'UWS'  );

close all; 
clear all;


load data_software;
%save ('LIS', 'LIS');
load LIS;
          
labels_crs = ['CONT'; ...
               'EMCS'; ...
               'MCS '; ...
               'UWS '];
           
           
           
labels_cont = ['CONT'];
labels_emcs = ['EMCS'];
labels_mcs =  ['MCS '];
labels_uws =  ['UWS '];
labels_lis =  ['LIS '];
labels_mcs_p =  ['MCS+'];
labels_mcs_m =  ['MCS-'];

mcs_m = MCS(1:12,:);
mcs_p = MCS(13:end,:);


%% RA
Lcont = repmat(labels_cont, length(Controls(:,1)),1);
Lemcs = repmat(labels_emcs, length(EMCS(:,1)),1);
Lmcs = repmat(labels_mcs, length(MCS(:,1)),1);
Luws = repmat(labels_uws, length(UWS(:,1)),1);
Llis = repmat(labels_lis, length(LIS(:,1)),1);
Lmcs_p = repmat(labels_mcs_p, length(mcs_m(:,1)),1);
Lmcs_m = repmat(labels_mcs_m, length(mcs_p(:,1)),1);


g = [Lcont; Lemcs; Llis; Lmcs; Lmcs_m; Lmcs_p; Luws];

x1 = Controls(:,1);
x2 = EMCS(:,1);
x3 = LIS(:,1)
x4 = MCS(:,1);
x5 = mcs_m(:,1);
x6 = mcs_p(:,1);
x7 = UWS(:,1);


x = [x1; x2; x3; x4; x5; x6; x7];

figure
boxplot(x, g);
title('RA Relative Amplitude');

%% L5


x1 = Controls(:,2);
x2 = EMCS(:,2);
x3 = LIS(:,2)
x4 = MCS(:,2);
x5 = mcs_m(:,2);
x6 = mcs_p(:,2);
x7 = UWS(:,2);


x = [x1; x2; x3; x4; x5; x6; x7];

figure
boxplot(x, g);
title('L5: Least active five-hour period or nocturnal activity');


%% M10

x1 = Controls(:,3);
x2 = EMCS(:,3);
x3 = LIS(:,3)
x4 = MCS(:,3);
x5 = mcs_m(:,3);
x6 = mcs_p(:,3);
x7 = UWS(:,3);


x = [x1; x2; x3; x4; x5; x6; x7];

figure
boxplot(x, g);
title('M10: Most active ten-hour period or daytime activity');


%% IV

x1 = Controls(:,4);
x2 = EMCS(:,4);
x3 = LIS(:,4)
x4 = MCS(:,4);
x5 = mcs_m(:,4);
x6 = mcs_p(:,4);
x7 = UWS(:,4);


x = [x1; x2; x3; x4; x5; x6; x7];

figure
boxplot(x, g);
title('IV: Intradaily variability');

%%  IS

x1 = Controls(:,5);
x2 = EMCS(:,5);
x3 = LIS(:,5)
x4 = MCS(:,5);
x5 = mcs_m(:,5);
x6 = mcs_p(:,5);
x7 = UWS(:,5);


x = [x1; x2; x3; x4; x5; x6; x7];

figure
boxplot(x, g);
title('IS: Intradaily stability');



