function plot_statistics_paper1(path_code, path_control,path_emcs, path_mcs, ...
  path_uws, MSA, time_analysis)

  cd(path_control);
  SUBJlist_Control = dir('*.mat');

 for i = 1:length(SUBJlist_Control)
    SUBJname_Control = SUBJlist_Control(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_Control);
    if(MSA)
        Control_aux(i,:,:) = data.aux;
    else
        if(time_analysis == 1440)  
            Control_aux(i,:,:) = data.aux(1:1400);
        end
         Control_aux(i,:,:) = data.aux;
    end
    
 end
 
 if(MSA) 
     t_control = data.time;
 else
     if(time_analysis == 1440)  
        t_control = data.t_aux(1):data.t_aux(2)-40;  % to avoid effects of boundary
     end
        t_control = data.t_aux(1):data.t_aux(2);
 end
 
% figure
% plot(t_control, Control_aux');


%%%%%% Import data for Group 2: EMCSs

 cd(path_emcs);
 SUBJlist_EMCS = dir('EMC*.mat');

 for i = 1:length(SUBJlist_EMCS)
    SUBJname_EMCS = SUBJlist_EMCS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_EMCS);
    
    if(MSA)
        EMCS_aux(i,:,:) = data.aux;
    else
        if(time_analysis == 1440)  
          EMCS_aux(i,:,:)= data.aux(1:1400);
        end
          EMCS_aux(i,:,:)= data.aux;
    end
 end
 
 if(MSA) 
     t_emcs = data.time;
 else 
     if(time_analysis == 1440)  
         t_emcs = data.t_aux(1):data.t_aux(2)-40; % to avoid effects of boundary
     end
         t_emcs = data.t_aux(1):data.t_aux(2);
 end
 
 
% figure
% plot(t_emc,EMCS_aux');


%%%%%% Import data for the MCS Group


 cd(path_mcs);
 SUBJlist_MCS = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS)
    SUBJname_MCS = SUBJlist_MCS(i).name;
    data=load(SUBJname_MCS);
  
    
    if(MSA)
        MCS_aux(i,:,:) = data.aux;
    else
        MCS_aux(i,:,:)= data.aux(1:1400);
    end

 end

 if(MSA) 
     t_mcs = data.time;
 else 
     t_mcs = data.t_aux(1):data.t_aux(2)-40;
 end
 
 
% figure
% plot(t_mcs,MCS_aux');


%%%%%% import data for group 5: UWS


 cd(path_uws);
 SUBJlist_UWS = dir('UWS_*.mat');

 for i = 1:length(SUBJlist_UWS)
    SUBJname_UWS = SUBJlist_UWS(i).name;
%     path1=([path SUBJname]);
%     cd(path1);
    data=load(SUBJname_UWS);
   
    
    if(MSA)
        UWS_aux(i,:,:) = data.aux;
    else
        UWS_aux(i,:,:)= data.aux(1:1400);
    end

 end
 
 if(MSA) 
     t_uws = data.time;
 else 
     t_uws = data.t_aux(1):data.t_aux(2) - 40;
 end
 
 
% figure
% plot(t_uws,UWS_aux');

  %%%%%% import data for group 5-b: UWS*

   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%    Ploting 
%
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Control vs EMCS
  mean_SE_Controls = mean(Controls_,2);
    std_SE_Controls = std(Controls_,[], 2);

figure
if(time_analysis == 1440)
    y2_CC = mean(Control_aux);
    z2_CC = std(Control_aux)/sqrt (length(Control_aux));
    y3_CC = mean (EMCS_aux);
    z3_CC = std (EMCS_aux)/sqrt (length(EMCS_aux));
else
    y2_CC = mean(Control_aux,2);
    std_SE_Controls = std(Control_aux,[], 2);
    z2_CC = std_SE_Controls/sqrt (length(y2_CC));
    y3_CC = mean (EMCS_aux,2);
    std_SE_EMCS = std(EMCS_aux,[], 2);
    z3_CC = std_SE_EMCS/sqrt (length(y3_CC));
end

errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on

%y3_CC(isnan(y3_CC)) = nanmedian(y3_CC);

errorbar (t_emcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs EMCS (red)')

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end



[h_EMCS_aux,p_EMCS_aux] = ttest2(Control_aux,EMCS_aux,0.05);


% Control vs MCS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (MCS_aux);
z3_CC = std (MCS_aux)/sqrt (length(MCS_aux));
errorbar (t_mcs, y3_CC,z3_CC, 'r'); grid on; 
title( 'Control (blue) vs MCS (red)' )

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end






[h_MCS_aux,p_MCS_aux] = ttest2(Control_aux,MCS_aux,0.05);




% Control vs UWS


figure
y2_CC = mean(Control_aux);
z2_CC = std(Control_aux)/sqrt (length(Control_aux));
errorbar(t_control,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 
title('Control (blue) vs UWS (red)')

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end


[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05);


% MCS vs UWS

figure
y2_CC = mean(MCS_aux);
z2_CC = std(MCS_aux)/sqrt (length(MCS_aux));
errorbar(t_mcs,y2_CC,z2_CC, 'b'); grid on;
hold on
y3_CC = mean (UWS_aux);
z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 

title('MCS (blue) vs UWS (red)')

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end



[h_UWS_aux,p_UWS_aux] = ttest2(Control_aux,UWS_aux,0.05)




cd(path_code);



end