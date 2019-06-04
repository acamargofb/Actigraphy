clc
clear all
close all

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
title('t_control')

%%%%%% import data for group 5: UWS - NonTBI


%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/UWS/NonTBI/'
path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/NonTBI/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/UWS'

cd(path);
SUBJlist_UWS = dir('UWS_*.mat');

for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
    UWS_noTBI_aux(i,:,:) = data.aux;

end
t_uws_no_tbi = data.time;
figure
plot(t_uws_no_tbi,UWS_noTBI_aux');
title('nonTBI')
%%%%%% import data for group 5: UWS - TBI


%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/All_day/UWS/TBI/'
path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Only_morning/UWS/TBI/'

%path = '/home/aldo/Documents/Projects/Avtivemeter/Files/AWD_Files/Nights/UWS'

cd(path);
SUBJlist_UWS = dir('UWS_*.mat');

for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
    UWS_TBI_aux(i,:,:) = data.aux;

end
t_uws_tbi = data.time;
figure
plot(t_uws_tbi,UWS_TBI_aux');
title('TBI')

% Statistical difference between Control and UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_noTBI_aux);
z3_CC = std (UWS_noTBI_aux)/sqrt (length(UWS_noTBI_aux));
errorbar (t_uws_no_tbi, y3_CC,z3_CC, 'r'); grid on; 
title('Control vs UWS - non TBI')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_noTBI_aux,p_UWS_noTBI_aux] = ttest2(Control_aux,UWS_noTBI_aux,0.05,'right');
[h_UWS_noTBI_aux_left,p_UWS_noTBI_aux_left] = ttest2(Control_aux,UWS_noTBI_aux,0.05,'left');

h_UWS_noTBI_aux
p_UWS_noTBI_aux


% Statistical difference between Control and UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_TBI_aux);
z3_CC = std (UWS_TBI_aux)/sqrt (length(UWS_TBI_aux));
errorbar (t_uws_tbi, y3_CC,z3_CC, 'r'); grid on; 
title('Control vs UWS - TBI')
ylabel('Spectral Amplitude (SA)', 'FontSize',28,'FontWeight','bold','Color','k')
xlabel('time (min)');


[h_UWS_TBI_aux,p_UWS_TBI_aux] = ttest2(Control_aux,UWS_TBI_aux,0.05,'left');
[h_UWS_TBI_aux_right,p_UWS_TBI_aux_right] = ttest2(Control_aux,UWS_TBI_aux,0.05,'right');

h_UWS_TBI_aux
p_UWS_TBI_aux



% 
% p_all_aux = [p_EMCS_aux p_MCS_m_aux p_MCS_p_aux p_UWS_aux];


% [p_fdr, h_fdr] = fdr(p_UWS_TBI_aux, 0.09);
% p_fdr
% h_fdr





