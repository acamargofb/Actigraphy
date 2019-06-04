function plot_statistics_paper1_v2(path_code, path_mcs, path_uws, MSA, title_1)

  time_analysis_SE = 1440*4-40;

%%%%%% Import data for the MCS Group


 cd(path_mcs);
 SUBJlist_MCS = dir('MCS_*.mat');

 for i = 1:length(SUBJlist_MCS)
    SUBJname_MCS = SUBJlist_MCS(i).name;
    data=load(SUBJname_MCS);
  
    
    if(MSA)
        MCS_aux(i,:,:) = data.aux;
    else
        MCS_aux(i,:,:)= data.aux;
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
        UWS_aux(i,:,:)= data.aux;
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



% MCS vs UWS
if (MSA)
 figure
 y2_CC = mean(MCS_aux);
 z2_CC = std(MCS_aux)/sqrt (length(MCS_aux));
 errorbar(t_mcs,y2_CC,z2_CC, 'b'); grid on;
 hold on
 y3_CC = mean (UWS_aux);
 z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));


 errorbar (t_uws, y3_CC,z3_CC, 'r'); grid on; 

%title('MCS (blue) vs UWS (red)')

else
 figure
 y2_CC = mean(MCS_aux);
 y2_CC_temp(1,:) = y2_CC(1,1,:);

 z2_CC = std(MCS_aux)/sqrt (length(MCS_aux));
 z2_CC_temp(1,:) = z2_CC(1,1,:);


 errorbar(t_mcs,y2_CC_temp(1:end-40),z2_CC_temp(1:end-40), 'b'); grid on;
 hold on
 y3_CC = mean (UWS_aux);
 y3_CC_temp(1,:) = y3_CC(1,1,:);

 z3_CC = std (UWS_aux)/sqrt (length(UWS_aux));
 z3_CC_temp(1,:) = z3_CC(1,1,:);

 errorbar (t_uws, y3_CC_temp(1:end-40),z3_CC_temp(1:end-40), 'r'); grid on; 
    
    
end

title(title_1)

if(MSA)
    ylabel('Mean Spectral Amplitude (MSA)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
else
    ylabel('Spectral Entropy (SE)', 'FontSize',14,'FontWeight','bold','Color','k')
    xlabel('time (min)');
end



cd(path_code);



end