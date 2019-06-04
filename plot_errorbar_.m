
load('./Comparison_3Methods/data_CircMSA_errorplot.mat')
mean_values = data_CircMSA_errorplot(:,1)
stde_values = data_CircMSA_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
ylim([0 1720])
xlabel({'Circadian','(in minutes)'})
legend('MCS', 'UWS');

load('./Comparison_3Methods/data_CircLomb_errorplot.mat')
mean_values = data_CircLomb_errorplot(:,1)
stde_values = data_CircLomb_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
ylim([0 1720])
xlabel({'Circadian','(in minutes)'})
legend('MCS', 'UWS');

load('./Comparison_3Methods/data_SE_errorplot.mat')
mean_values = data_SE_errorplot(:,1)
stde_values = data_SE_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
ylim([0 5])
xlabel({'SE'})
legend('MCS', 'UWS');

load('./Comparison_3Methods/data_IS_errorplot.mat')
mean_values = data_IS_errorplot(:,1)
stde_values = data_IS_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS'} )
ylim([0 1])
xlabel({'IS'})
legend('MCS', 'UWS');

load('./Comparison_3Methods/data_IV_errorplot.mat')
mean_values = data_IV_errorplot(:,1)
stde_values = data_IV_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS'} )
ylim([0 3])
ylabel({'IV'})
legend('MCS', 'UWS');


% Ultradian:

load('./Comparison_3Methods/data_UltrMSA_errorplot.mat')
mean_values = data_UltrMSA_errorplot(:,1)
stde_values = data_UltrMSA_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
ylim([0 240])
xlabel({'Ultradian','(in minutes)'})
legend('MCS', 'UWS');


load('./Comparison_3Methods/data_UltrLomb_errorplot.mat')
mean_values = data_UltrLomb_errorplot(:,1)
stde_values = data_UltrLomb_errorplot(:,2)

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
ylim([0 240])
xlabel({'Ultradian','(in minutes)'})
legend('MCS', 'UWS');


%%%%%%  New from 26/11/18

% Circadian %

load('./Comparison_3Methods/data_Circ_Lomb_errorplot_v2.mat')
mean_values = table_Circ_Lomb(:,1)/60 % in hours
stde_values = table_Circ_Lomb(:,2)/60  % in hours

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
grid on;
ylim([19 28])
ylabel('Circadian (hours)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('Diagnosis','FontSize',14,'FontWeight','bold','Color','k')

legend({'MCS', 'UWS'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')

% Ultradian %
clear all
load('./Comparison_3Methods/data_UltrLomb_errorplot_v2.mat')

mean_values = data_UltrLomb_errorplot(:,1) % in min
stde_values = data_UltrLomb_errorplot(:,2)  % in min

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
grid on;
ylim([100 200])
ylabel('Ultradian (minutes)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('Diagnosis','FontSize',14,'FontWeight','bold','Color','k')

legend({'MCS', 'UWS'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')

% IV %

clear all
load('./Comparison_3Methods/data_IV_errorplot_v2.mat')

mean_values = data_IV(:,1) % in min
stde_values = data_IV(:,2)  % in min

errorbar_groups(mean_values, stde_values, 'bar_names',{'MCS  UWS','UWS'} )
grid on;
ylim([0.5 1.9])
ylabel('Interdaily Variability (IV)', 'FontSize',14,'FontWeight','bold','Color','k')
xlabel('Diagnosis','FontSize',14,'FontWeight','bold','Color','k')

legend({'MCS', 'UWS'},'FontWeight', 'bold', 'FontSize',12,'TextColor','black')

