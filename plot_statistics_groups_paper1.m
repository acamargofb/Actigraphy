function plot_statistics_groups_paper1(path_code, t_control, control,emcs, mcs, uws, MSA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Ploting 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Control vs EMCS

Control_aux = control;
EMCS_aux = emcs;
MCS_aux = mcs;
UWS_aux = uws;



figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (EMCS_aux);
%y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);
z3_CC = std (EMCS_aux)/sqrt (length(EMCS_aux));
errorbar (t_control, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs EMCS (red)')

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end



% Control vs MCS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_aux);
z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_control, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs MCS (red)' )

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end




% Control vs UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_control, y3_CC,z3_CC, 'r'); grid on; 
title('Control (blue) vs UWS (red)')

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end



% MCS vs UWS

figure
y2_CC = mean(MCS_aux);
z2_CC = std(MCS_aux)/sqrt (length(MCS_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_control, y3_CC,z3_CC, 'r'); grid on; 

title('MCS (blue) vs UWS (red)')

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end


cd(path_code);

end