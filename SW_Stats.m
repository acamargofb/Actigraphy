function Actigraphy_Stats(Algorithm)

clc
clear all
close all

if(Algorithm == 'morning')



%%%%%% Import data for Group 1: Controls
%path = '/home/aldo/Documents/Projects/Avtivemeter/Test/Group1/'


%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/Controls/'

path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/Controls/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/Controls/'

cd(path);
SUBJlist_Control = dir('*.mat');

for i = 1:length(SUBJlist_Control)
    SUBJname_Control = SUBJlist_Control(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_Control);
    Control_aux(i,:,:) = data.aux;
end
t_control = data.time;
figure
plot(t_control, Control_aux');


%%%%%% Import data for Group 2: EMCSs

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/EMCS/'

path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/EMCS/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/EMCS/'

cd(path);
SUBJlist_EMCS = dir('EMC*.mat');

for i = 1:length(SUBJlist_EMCS)
    SUBJname_EMCS = SUBJlist_EMCS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_EMCS);
    EMCS_aux(i,:,:) = data.aux;
end
t_emc = data.time;
figure
plot(t_emc,EMCS_aux');


%%%%%% import data for group 3: MCS-

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS-/'

path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS-/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS-'

cd(path);
SUBJlist_MCS_m = dir('MCS_m_*.mat');

for i = 1:length(SUBJlist_MCS_m)
    SUBJname_MCS_m = SUBJlist_MCS_m(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_m);
    MCS_m_aux(i,:,:) = data.aux;

end
t_mcs_m = data.time;
figure
plot(t_mcs_m,MCS_m_aux');



%%%%%% import data for group 4: MCS+

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS+/'

path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS+/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS+'


cd(path);
SUBJlist_MCS_p = dir('MCS_p_*.mat');

for i = 1:length(SUBJlist_MCS_p)
    SUBJname_MCS_p = SUBJlist_MCS_p(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_MCS_p);
    MCS_p_aux(i,:,:) = data.aux;

end

t_mcs_p = data.time;
figure
plot(t_mcs_p,MCS_p_aux');



%%%%%% import data for group 4-b: MCS+ and MCS-

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/MCS/'

path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/MCS/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/MCS/'

cd(path);
SUBJlist_MCS = dir('MCS_*.mat');

for i = 1:length(SUBJlist_MCS)
    SUBJname_MCS = SUBJlist_MCS(i).name;
    data=load(SUBJname_MCS);
    MCS_aux(i,:,:) = data.aux;

end

t_mcs = data.time;
figure
plot(t_mcs,MCS_aux');


%%%%%% import data for group 5: UWS


%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/UWS/'

path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/UWS'

cd(path);
SUBJlist_UWS = dir('UWS_*.mat');

for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
    UWS_aux(i,:,:) = data.aux;

end
t_uws = data.time;
figure
plot(t_uws,UWS_aux');


figure
subplot(2,3,1); plot(t_control,Control_aux');
subplot(2,3,2); plot(t_emc, EMCS_aux');
subplot(2,3,3); plot(t_mcs_m, MCS_m_aux');
subplot(2,3,4); plot(t_mcs_p, MCS_p_aux');
subplot(2,3,5); plot(t_uws, UWS_aux');

% Ploting lustering Coeficent(CC), Path Length,
%%%%%% Small Worldness for control and Patient EMCS

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (EMCS_aux);
z3_CC = std (EMCS_aux)/sqrt (length(EMCS_aux));
errorbar (t_emc, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs EMCS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');

% Statastical difference between Control and EMCS


    [h_EMCS_aux,p_EMCS_aux] = ttest2(Control_aux,EMCS_aux,0.05);

h_EMCS_aux
p_EMCS_aux


% Statastical difference between  Control and MCS-

figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_m_aux);
z3_CC = std (MCS_m_aux)/sqrt (length(MCS_m_aux));
errorbar (t_mcs_m, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS-')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


    [h_MCS_m_aux,p_MCS_m_aux] = ttest2(Control_aux,MCS_m_aux,0.05);

h_MCS_m_aux
p_MCS_m_aux


% Statastical difference between t Control and MCS+


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_p_aux);
z3_CC = std (MCS_p_aux)/sqrt (length(MCS_p_aux));
errorbar (t_mcs_p, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS+')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');




    [h_MCS_p_aux,p_MCS_p_aux] = ttest2(Control_aux,MCS_p_aux,0.05);

h_MCS_p_aux
p_MCS_p_aux


% Statastical difference between t Control and MCS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_aux);
z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_mcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control vs MCS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');




    [h_MCS_aux,p_MCS_aux] = ttest2(Control_aux,MCS_aux,0.05);

h_MCS_p_aux
p_MCS_p_aux




% Statastical difference between Control and UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control vs UWS')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05);

h_UWS_aux
p_UWS_aux



%%% for Multiple Comparision

p_all_aux = [p_EMCS_aux p_MCS_m_aux p_MCS_p_aux p_UWS_aux];


[p_fdr, h_fdr] = fdr(p_all_aux, 0.09);
p_fdr
h_fdr

[p_mafdr] = mafdr(p_all_aux);
p_mafdr





% Statastical difference between two group for one tailed

%    [h_CC_1tailed,p_CC_1tailed] = ttest2(Control_aux,EMCS_aux,0.05,'left');
%h_CC_1tailed
%p_CC_1tailed


%for i = 1:65
%    [h_PL1(i),p_PL1(i)] = ttest2(sparsity_PL_normalised_Control(:,i),sparsity_PL_normalised_Patient(:,i),0.05,'left');
%end

%h_PL1
%p_PL1

%[p,h]=fdr(p_CC_Normalised,0.05);
%p


end