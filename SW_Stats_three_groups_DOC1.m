clc
clear all
close all


%%%%%% Absolute  and Normalised Clustering Coeficent(CC), Path Length,
%%%%%%%%%%%% Global Efficency and Local Efficency for Group1  data extraction  %%%%%%%%

path = 'D:\fMRI\CaseControl\DataSet\Dataset_UWS-CTR-MCS\CTR\GTproces\Modularity\'

cd(path);
SUBJlist_Group1 = dir('dataanalysis_CTR*');

for i = 1:length(SUBJlist_Group1)
    SUBJname = SUBJlist_Group1(i).name;
    path1=([path SUBJname]);
    cd(path1);
    data=load([SUBJname '_ABS_GT.mat'])
    Group1_CC(i,:,:)= data.GT_clust_coeff;         
    Group1_PL(i,:,:)= data.GT_path_length;
    Group1_LE(i,:,:)= data.GT_local_eff;         
    Group1_GE(i,:,:)= data.GT_global_eff;
    Group1_CorrMatrix(i,:,:) = data.GT_corr_data_abs;

    Group1_ML(i,:,:)= data.GT_modularity_Q; 
    
    data_rand=load([SUBJname '_RAND_new.mat'])
    Group1_CC_rand(i,:,:,:)= data_rand.GT_clust_coeff_rand;     
    Group1_PL_rand(i,:,:,:)= data_rand.GT_path_length_rand;  
    Group1_LE_rand(i,:,:,:)= data_rand.GT_local_eff_rand;    
    Group1_GE_rand(i,:,:,:)= data_rand.GT_global_eff_rand;
    
    Group1_ML_rand(i,:,:,:)= data_rand.GT_modularity_Q_rand;
end


Group1_CC_50=Group1_CC(:,6:50,:);                          
Group1_CC_rand_squ = squeeze(mean(Group1_CC_rand,3));        
AvgGroup1_CC=mean(mean(Group1_CC_50,3));
AvgGroup1_CC_BrainRegion=mean(Group1_CC_50,2);

sparsity_CC_Group1_50 = (mean(Group1_CC_50,3));
sparsity_CC_rand_Group1 = mean(Group1_CC_rand_squ,3);
sparsity_CC_rand_Group1_50 = sparsity_CC_rand_Group1 (:,6:50);

Group1_PL_50=Group1_PL(:,:,6:50);
AvgGroup1_PL=squeeze(mean(Group1_PL_50));

Sparsity_PL_Group1_50=squeeze(Group1_PL_50);
Sparsity_PL_Group1_rand_squ = squeeze(mean(Group1_PL_rand,3)); 
Sparsity_PL_Group1_rand_50 = Sparsity_PL_Group1_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group1); 
    for j = 1:45; 
            sparsity_CC_normalised_Group1(i,j) = sparsity_CC_Group1_50(i,j)/sparsity_CC_rand_Group1_50(i,j); 
    end
end


for i = 1:length(SUBJlist_Group1); 
    for j = 1:45; 
            sparsity_PL_normalised_Group1(i,j) = Sparsity_PL_Group1_50(i,j)/Sparsity_PL_Group1_rand_50(i,j); 
    end
end

for i = 1:length(SUBJlist_Group1); 
    for j = 1:45; 
            SmallWorldNess_Group1(i,j) = sparsity_CC_normalised_Group1(i,j)/sparsity_PL_normalised_Group1(i,j); 
    end
end


Group1_LE_50=Group1_LE(:,6:50,:);                          
Group1_LE_rand_squ = squeeze(mean(Group1_LE_rand,3));        

AvgGroup1_LE=mean(mean(Group1_LE_50,3));

sparsity_LE_Group1_50 = (mean(Group1_LE_50,3));
sparsity_LE_rand_Group1 = mean(Group1_LE_rand_squ,3);
sparsity_LE_rand_Group1_50 = sparsity_LE_rand_Group1 (:,6:50);

Group1_GE_50=Group1_GE(:,:,6:50);
AvgGroup1_GE=squeeze(mean(Group1_GE_50));

Sparsity_GE_Group1_50=squeeze(Group1_GE_50);
Sparsity_GE_Group1_rand_squ = squeeze(mean(Group1_GE_rand,3)); 
Sparsity_GE_Group1_rand_50 = Sparsity_GE_Group1_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group1); 
    for j = 1:45; 
            sparsity_LE_normalised_Group1(i,j) = sparsity_LE_Group1_50(i,j)/sparsity_LE_rand_Group1_50(i,j); 
    end
end


for i = 1:length(SUBJlist_Group1); 
    for j = 1:45; 
            sparsity_GE_normalised_Group1(i,j) = Sparsity_GE_Group1_50(i,j)/Sparsity_GE_Group1_rand_50(i,j); 
    end
end


sparsity_CC_Group1_ROI = squeeze(mean(Group1_CC_50,2)); 
sparsity_CC_rand_Group1_ROI = mean(Group1_CC_rand_squ,2);


for i = 1:length(SUBJlist_Group1); 
    for j = 1:160; 
            sparsity_CC_normalised_Group1_ROI(i,j) = sparsity_CC_Group1_ROI(i,j)/sparsity_CC_rand_Group1_ROI(i,j);
    end
end

%Group1_ML(i,:,:)= data.GT_modularity; 
%Group1_ML_rand(i,:,:,:)= data_rand.GT_modularity_rand;

% Group1_ML_50=Group1_ML(:,6:50,:);                          
% Group1_ML_rand_squ = squeeze(mean(Group1_ML_rand,3));        
% AvgGroup1_ML=mean(mean(Group1_ML_50,3));
% AvgGroup1_ML_BrainRegion=mean(Group1_ML_50,2);
% 
% sparsity_ML_Group1_50 = (mean(Group1_ML_50,3));
% sparsity_ML_rand_Group1 = mean(Group1_ML_rand_squ,3);
% sparsity_ML_rand_Group1_50 = sparsity_ML_rand_Group1 (:,6:50);
% 
% for i = 1:length(SUBJlist_Group1); 
%     for j = 1:45; 
%             sparsity_ML_normalised_Group1(i,j) = sparsity_ML_Group1_50(i,j)/sparsity_ML_rand_Group1_50(i,j); 
%     end
% end
%Group1_ML = Group1_ML';
Group1_ML_50=Group1_ML(:,6:50);
AvgGroup1_ML=squeeze(mean(Group1_ML_50));

Sparsity_ML_Group1_50=squeeze(Group1_ML_50);
Sparsity_ML_Group1_rand_squ = squeeze(mean(Group1_ML_rand,3)); 
Sparsity_ML_Group1_rand_50 = Sparsity_ML_Group1_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group1); 
    for j = 1:45; 
            sparsity_ML_normalised_Group1(i,j) = Sparsity_ML_Group1_50(i,j)/Sparsity_ML_Group1_rand_50(i,j); 
    end
end


%%%%%% Absolute  and Normalised Clustering Coeficent(CC), Path Length,
%%%%%% Global Efficency, Local Efficency for Group2 data extraction %%%%%%%%%%%%

path = 'D:\fMRI\CaseControl\DataSet\Dataset_UWS-CTR-MCS\MCS\GTproces\Modularity\'


cd(path);
SUBJlist_Group2 = dir('dataanalysis_MCS*');

for i = 1:length(SUBJlist_Group2)
    SUBJname = SUBJlist_Group2(i).name;
    path1=([path SUBJname]);
    cd(path1);
    data=load([SUBJname '_ABS_GT.mat'])
    Group2_CC(i,:,:)= data.GT_clust_coeff;         
    Group2_PL(i,:,:)= data.GT_path_length;
    Group2_LE(i,:,:)= data.GT_local_eff;         
    Group2_GE(i,:,:)= data.GT_global_eff;
    Group2_CorrMatrix(i,:,:) = data.GT_corr_data_abs;
    
    Group2_ML(i,:,:)= data.GT_modularity_Q; 

    
    data_rand=load([SUBJname '_RAND_new.mat'])
    Group2_CC_rand(i,:,:,:)= data_rand.GT_clust_coeff_rand;     
    Group2_PL_rand(i,:,:,:)= data_rand.GT_path_length_rand;  
    Group2_LE_rand(i,:,:,:)= data_rand.GT_local_eff_rand;    
    Group2_GE_rand(i,:,:,:)= data_rand.GT_global_eff_rand;
    
    Group2_ML_rand(i,:,:,:)= data_rand.GT_modularity_Q_rand;
end


Group2_CC_50=Group2_CC(:,6:50,:);                          
Group2_CC_rand_squ = squeeze(mean(Group2_CC_rand,3));        
AvgGroup2_CC=mean(mean(Group2_CC_50,3));
AvgGroup2_CC_BrainRegion=mean(Group2_CC_50,2);

sparsity_CC_Group2_50 = (mean(Group2_CC_50,3));
sparsity_CC_rand_Group2 = mean(Group2_CC_rand_squ,3);
sparsity_CC_rand_Group2_50 = sparsity_CC_rand_Group2 (:,6:50);

Group2_PL_50=Group2_PL(:,:,6:50);
AvgGroup2_PL=squeeze(mean(Group2_PL_50));

Sparsity_PL_Group2_50=squeeze(Group2_PL_50);
Sparsity_PL_Group2_rand_squ = squeeze(mean(Group2_PL_rand,3)); 
Sparsity_PL_Group2_rand_50 = Sparsity_PL_Group2_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group2); 
    for j = 1:45; 
            sparsity_CC_normalised_Group2(i,j) = sparsity_CC_Group2_50(i,j)/sparsity_CC_rand_Group2_50(i,j); 
    end
end


for i = 1:length(SUBJlist_Group2); 
    for j = 1:45; 
            sparsity_PL_normalised_Group2(i,j) = Sparsity_PL_Group2_50(i,j)/Sparsity_PL_Group2_rand_50(i,j); 
    end
end

for i = 1:length(SUBJlist_Group2); 
    for j = 1:45; 
            SmallWorldNess_Group2(i,j) = sparsity_CC_normalised_Group2(i,j)/sparsity_PL_normalised_Group2(i,j); 
    end
end


Group2_LE_50=Group2_LE(:,6:50,:);                          
Group2_LE_rand_squ = squeeze(mean(Group2_LE_rand,3));        

AvgGroup2_LE=mean(mean(Group2_LE_50,3));

sparsity_LE_Group2_50 = (mean(Group2_LE_50,3));
sparsity_LE_rand_Group2 = mean(Group2_LE_rand_squ,3);
sparsity_LE_rand_Group2_50 = sparsity_LE_rand_Group2 (:,6:50);

Group2_GE_50=Group2_GE(:,:,6:50);
AvgGroup2_GE=squeeze(mean(Group2_GE_50));

Sparsity_GE_Group2_50=squeeze(Group2_GE_50);
Sparsity_GE_Group2_rand_squ = squeeze(mean(Group2_GE_rand,3)); 
Sparsity_GE_Group2_rand_50 = Sparsity_GE_Group2_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group2); 
    for j = 1:45; 
            sparsity_LE_normalised_Group2(i,j) = sparsity_LE_Group2_50(i,j)/sparsity_LE_rand_Group2_50(i,j); 
    end
end


for i = 1:length(SUBJlist_Group2); 
    for j = 1:45; 
            sparsity_GE_normalised_Group2(i,j) = Sparsity_GE_Group2_50(i,j)/Sparsity_GE_Group2_rand_50(i,j); 
    end
end


sparsity_CC_Group2_ROI = squeeze(mean(Group2_CC_50,2)); 
sparsity_CC_rand_Group2_ROI = mean(Group2_CC_rand_squ,2);


for i = 1:length(SUBJlist_Group2); 
    for j = 1:160; 
            sparsity_CC_normalised_Group2_ROI(i,j) = sparsity_CC_Group2_ROI(i,j)/sparsity_CC_rand_Group2_ROI(i,j);
    end
end


%Group2_ML(i,:,:)= data.GT_modularity_Q; 
%Group2_ML_rand(i,:,:,:)= data_rand.GT_modularity_rand;

% Group2_ML_50=Group2_ML(:,6:50,:);                          
% Group2_ML_rand_squ = squeeze(mean(Group2_ML_rand,3));        
% AvgGroup2_ML=mean(mean(Group2_ML_50,3));
% AvgGroup2_ML_BrainRegion=mean(Group2_ML_50,2);
% 
% sparsity_ML_Group2_50 = (mean(Group2_ML_50,3));
% sparsity_ML_rand_Group2 = mean(Group2_ML_rand_squ,3);
% sparsity_ML_rand_Group2_50 = sparsity_ML_rand_Group2 (:,6:50);
% 
% for i = 1:length(SUBJlist_Group2); 
%     for j = 1:45; 
%             sparsity_ML_normalised_Group2(i,j) = sparsity_ML_Group2_50(i,j)/sparsity_ML_rand_Group2_50(i,j); 
%     end
% end

%Group2_ML = Group2_ML';
Group2_ML_50=Group2_ML(:,6:50);
AvgGroup2_ML=squeeze(mean(Group2_ML_50));

Sparsity_ML_Group2_50=squeeze(Group2_ML_50);
Sparsity_ML_Group2_rand_squ = squeeze(mean(Group2_ML_rand,3)); 
Sparsity_ML_Group2_rand_50 = Sparsity_ML_Group2_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group2); 
    for j = 1:45; 
            sparsity_ML_normalised_Group2(i,j) = Sparsity_ML_Group2_50(i,j)/Sparsity_ML_Group2_rand_50(i,j); 
    end
end


%%%%%% Absolute  and Normalised Clustering Coeficent(CC), Path Length,
%%%%%% Global Efficency, Local Efficency for Group3 data extraction %%%%%%%%%%%%

path = 'D:\fMRI\CaseControl\DataSet\Dataset_UWS-CTR-MCS\UWS\GTproces\Modularity\'

cd(path);
SUBJlist_Group3 = dir('dataanalysis_UWS*');

for i = 1:length(SUBJlist_Group3)
    SUBJname = SUBJlist_Group3(i).name;
    path1=([path SUBJname]);
    cd(path1);
    data=load([SUBJname '_ABS_GT.mat'])
    Group3_CC(i,:,:)= data.GT_clust_coeff;         
    Group3_PL(i,:,:)= data.GT_path_length;
    Group3_LE(i,:,:)= data.GT_local_eff;         
    Group3_GE(i,:,:)= data.GT_global_eff;
    Group3_CorrMatrix(i,:,:) = data.GT_corr_data_abs;
    Group3_ML(i,:,:)= data.GT_modularity_Q; 

    data_rand=load([SUBJname '_RAND_new.mat'])
    Group3_CC_rand(i,:,:,:)= data_rand.GT_clust_coeff_rand;     
    Group3_PL_rand(i,:,:,:)= data_rand.GT_path_length_rand;  
    Group3_LE_rand(i,:,:,:)= data_rand.GT_local_eff_rand;    
    Group3_GE_rand(i,:,:,:)= data_rand.GT_global_eff_rand;
    Group3_ML_rand(i,:,:,:)= data_rand.GT_modularity_Q_rand;
end


Group3_CC_50=Group3_CC(:,6:50,:);                          
Group3_CC_rand_squ = squeeze(mean(Group3_CC_rand,3));        
AvgGroup3_CC=mean(mean(Group3_CC_50,3));
AvgGroup3_CC_BrainRegion=mean(Group3_CC_50,2);

sparsity_CC_Group3_50 = (mean(Group3_CC_50,3));
sparsity_CC_rand_Group3 = mean(Group3_CC_rand_squ,3);
sparsity_CC_rand_Group3_50 = sparsity_CC_rand_Group3 (:,6:50);

Group3_PL_50=Group3_PL(:,:,6:50);
AvgGroup3_PL=squeeze(mean(Group3_PL_50));

Sparsity_PL_Group3_50=squeeze(Group3_PL_50);
Sparsity_PL_Group3_rand_squ = squeeze(mean(Group3_PL_rand,3)); 
Sparsity_PL_Group3_rand_50 = Sparsity_PL_Group3_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group3); 
    for j = 1:45; 
            sparsity_CC_normalised_Group3(i,j) = sparsity_CC_Group3_50(i,j)/sparsity_CC_rand_Group3_50(i,j); 
    end
end


for i = 1:length(SUBJlist_Group3); 
    for j = 1:45; 
            sparsity_PL_normalised_Group3(i,j) = Sparsity_PL_Group3_50(i,j)/Sparsity_PL_Group3_rand_50(i,j); 
    end
end

for i = 1:length(SUBJlist_Group3); 
    for j = 1:45; 
            SmallWorldNess_Group3(i,j) = sparsity_CC_normalised_Group3(i,j)/sparsity_PL_normalised_Group3(i,j); 
    end
end


Group3_LE_50=Group3_LE(:,6:50,:);                          
Group3_LE_rand_squ = squeeze(mean(Group3_LE_rand,3));        
AvgGroup3_LE=mean(mean(Group3_LE_50,3));

sparsity_LE_Group3_50 = (mean(Group3_LE_50,3));
sparsity_LE_rand_Group3 = mean(Group3_LE_rand_squ,3);
sparsity_LE_rand_Group3_50 = sparsity_LE_rand_Group3 (:,6:50);

Group3_GE_50=Group3_GE(:,:,6:50);
AvgGroup3_GE=squeeze(mean(Group3_GE_50));

Sparsity_GE_Group3_50=squeeze(Group3_GE_50);
Sparsity_GE_Group3_rand_squ = squeeze(mean(Group3_GE_rand,3)); 
Sparsity_GE_Group3_rand_50 = Sparsity_GE_Group3_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group3); 
    for j = 1:45; 
            sparsity_LE_normalised_Group3(i,j) = sparsity_LE_Group3_50(i,j)/sparsity_LE_rand_Group3_50(i,j); 
    end
end


for i = 1:length(SUBJlist_Group3); 
    for j = 1:45; 
            sparsity_GE_normalised_Group3(i,j) = Sparsity_GE_Group3_50(i,j)/Sparsity_GE_Group3_rand_50(i,j); 
    end
end

sparsity_CC_Group3_ROI = squeeze(mean(Group3_CC_50,2));
sparsity_CC_rand_Group3_ROI = mean(Group3_CC_rand_squ,2);

for i = 1:length(SUBJlist_Group3); 
    for j = 1:160; 
            sparsity_CC_normalised_Group3_ROI(i,j) = sparsity_CC_Group3_ROI(i,j)/sparsity_CC_rand_Group3_ROI(i,j); 
    end
end


%Group3_ML(i,:,:)= data.GT_modularity_Q; 
%Group3_ML_rand(i,:,:,:)= data_rand.GT_modularity_rand;
% 
% Group3_ML_50=Group3_ML(:,6:50,:);                          
% Group3_ML_rand_squ = squeeze(mean(Group3_ML_rand,3));        
% AvgGroup3_ML=mean(mean(Group3_ML_50,3));
% AvgGroup3_ML_BrainRegion=mean(Group3_ML_50,2);
% 
% sparsity_ML_Group3_50 = (mean(Group3_ML_50,3));
% sparsity_ML_rand_Group3 = mean(Group3_ML_rand_squ,3);
% sparsity_ML_rand_Group3_50 = sparsity_ML_rand_Group3 (:,6:50);
% 
% for i = 1:length(SUBJlist_Group3); 
%     for j = 1:45; 
%             sparsity_ML_normalised_Group3(i,j) = sparsity_ML_Group3_50(i,j)/sparsity_ML_rand_Group3_50(i,j); 
%     end
% end


%Group3_ML = Group3_ML';
Group3_ML_50=Group3_ML(:,6:50);
AvgGroup3_ML=squeeze(mean(Group3_ML_50));

Sparsity_ML_Group3_50=squeeze(Group3_ML_50);
Sparsity_ML_Group3_rand_squ = squeeze(mean(Group3_ML_rand,3)); 
Sparsity_ML_Group3_rand_50 = Sparsity_ML_Group3_rand_squ (:,6:50); 


for i = 1:length(SUBJlist_Group3); 
    for j = 1:45; 
            sparsity_ML_normalised_Group3(i,j) = Sparsity_ML_Group3_50(i,j)/Sparsity_ML_Group3_rand_50(i,j); 
    end
end




% Ploting lustering Coeficent(CC), Path Length,
%%%%%% Global Efficency, Local Efficency for Group2 and Group3

figure (1)
y1_CC = mean (sparsity_CC_normalised_Group1);
z1_CC = std (sparsity_CC_normalised_Group1)/sqrt (length(sparsity_CC_normalised_Group1));
errorbar (y1_CC,z1_CC, 'k', 'LineWidth',2); grid on; 
hold on
y2_CC = mean (sparsity_CC_normalised_Group2);
z2_CC = std (sparsity_CC_normalised_Group2)/sqrt (length(sparsity_CC_normalised_Group2));
errorbar (y2_CC,z2_CC, 'b', 'LineWidth',2); grid on;
hold on
y3_CC = mean (sparsity_CC_normalised_Group3);
z3_CC = std (sparsity_CC_normalised_Group3)/sqrt (length(sparsity_CC_normalised_Group3));
errorbar (y3_CC,z3_CC, 'r', 'LineWidth',2); grid on; 
title('Normalised Clustering Coefficient', 'FontSize',18,'FontWeight','bold','Color','k')
xlabel('Sparsity level (%)', 'FontSize',24,'FontWeight','bold','Color','k')
hleg1 = legend('Control', 'MCS', 'UWS');

figure (2)
y1_PL = mean (sparsity_PL_normalised_Group1);
z1_PL = std (sparsity_PL_normalised_Group1)/sqrt (length(sparsity_PL_normalised_Group1));
errorbar (y1_PL,z1_PL, 'k', 'LineWidth',2); grid on; 
hold on
y2_PL = mean (sparsity_PL_normalised_Group2);
z2_PL = std (sparsity_PL_normalised_Group2)/sqrt (length(sparsity_PL_normalised_Group2));
errorbar (y2_PL,z2_PL, 'b', 'LineWidth',2); grid on; 
hold on

y3_PL = mean (sparsity_PL_normalised_Group3);
z3_PL = std (sparsity_PL_normalised_Group3)/sqrt (length(sparsity_PL_normalised_Group3));
errorbar (y3_PL,z3_PL, 'r', 'LineWidth',2); grid on;
title('Normalised Path Length', 'FontSize',18,'FontWeight','bold','Color','k')
xlabel('Sparsity level (%)', 'FontSize',24,'FontWeight','bold','Color','k')
hleg1 = legend('Control', 'MCS', 'UWS');

figure (3)
y1_SW = mean (SmallWorldNess_Group1);
z1_SW = std (SmallWorldNess_Group1)/sqrt (length(SmallWorldNess_Group1));
errorbar (y1_SW,z1_SW, 'k', 'LineWidth',2); grid on;
hold on
y2_SW = mean (SmallWorldNess_Group2);
z2_SW = std (SmallWorldNess_Group2)/sqrt (length(SmallWorldNess_Group2));
errorbar (y2_SW,z2_SW, 'b', 'LineWidth',2); grid on;
hold on

y3_SW = mean (SmallWorldNess_Group3);
z3_SW = std (SmallWorldNess_Group3)/sqrt (length(SmallWorldNess_Group3));
errorbar (y3_SW,z3_SW, 'r', 'LineWidth',2); grid on;
title('Small Worldness', 'FontSize',18,'FontWeight','bold','Color','k')
xlabel('Sparsity level (%)', 'FontSize',24,'FontWeight','bold','Color','k')
hleg1 = legend('Control', 'MCS', 'UWS');

figure (4)
y1_LE = mean (sparsity_LE_normalised_Group1);
z1_LE = std (sparsity_LE_normalised_Group1)/sqrt (length(sparsity_LE_normalised_Group1));
errorbar (y1_LE,z1_LE, 'k', 'LineWidth',2); grid on; 
hold on
y2_LE = mean (sparsity_LE_normalised_Group2);
z2_LE = std (sparsity_LE_normalised_Group2)/sqrt (length(sparsity_LE_normalised_Group2));
errorbar (y2_LE,z2_LE, 'b', 'LineWidth',2); grid on; 
hold on

y3_LE = mean (sparsity_LE_normalised_Group3);
z3_LE = std (sparsity_LE_normalised_Group3)/sqrt (length(sparsity_LE_normalised_Group3));
errorbar (y3_LE,z3_LE, 'r', 'LineWidth',2); grid on; 
title('Local Efficency', 'FontSize',18,'FontWeight','bold','Color','k')
xlabel('Sparsity level (%)', 'FontSize',24,'FontWeight','bold','Color','k')
hleg1 = legend('Control', 'MCS', 'UWS');

figure (5)
y1_GE = mean (sparsity_GE_normalised_Group1);
z1_GE = std (sparsity_GE_normalised_Group1)/sqrt (length(sparsity_GE_normalised_Group1));
errorbar (y1_GE,z1_GE, 'k', 'LineWidth',2); grid on; 
hold on
y2_GE = mean (sparsity_GE_normalised_Group2);
z2_GE = std (sparsity_GE_normalised_Group2)/sqrt (length(sparsity_GE_normalised_Group2));
errorbar (y2_GE,z2_GE, 'b', 'LineWidth',2); grid on; 
hold on

y3_GE = mean (sparsity_GE_normalised_Group3);
z3_GE = std (sparsity_GE_normalised_Group3)/sqrt (length(sparsity_GE_normalised_Group3));
errorbar (y3_GE,z3_GE, 'r', 'LineWidth',2); grid on;
title('Global Efficency', 'FontSize',18,'FontWeight','bold','Color','k')
xlabel('Sparsity level (%)', 'FontSize',24,'FontWeight','bold','Color','k')
hleg1 = legend('Control', 'MCS', 'UWS');

figure (6)
y1_ML = mean (sparsity_ML_normalised_Group1);
z1_ML = std (sparsity_ML_normalised_Group1)/sqrt (length(sparsity_ML_normalised_Group1));
errorbar (y1_ML,z1_ML, 'k', 'LineWidth',2); grid on; 
hold on
y2_ML = mean (sparsity_ML_normalised_Group2);
z2_ML = std (sparsity_ML_normalised_Group2)/sqrt (length(sparsity_ML_normalised_Group2));
errorbar (y2_ML,z2_ML, 'b', 'LineWidth',2); grid on;
hold on
y3_ML = mean (sparsity_ML_normalised_Group3);
z3_ML = std (sparsity_ML_normalised_Group3)/sqrt (length(sparsity_ML_normalised_Group3));
errorbar (y3_ML,z3_ML, 'r', 'LineWidth',2); grid on; 
title('Normalised Modularity', 'FontSize',18,'FontWeight','bold','Color','k')
xlabel('Sparsity level (%)', 'FontSize',24,'FontWeight','bold','Color','k')
hleg1 = legend('Control', 'MCS', 'UWS');




figure (7)
plot (sparsity_ML_normalised_Group1')
title('Normalised Clustering Coefficient Resting', 'FontSize',18)
xlabel('Sparsity level (%)', 'FontSize',28,'FontWeight','bold','Color','k')
figure (10)
plot (sparsity_ML_normalised_Group2')
title('Normalised Clustering Coefficient Hypnosis','FontSize',18)
xlabel('Sparsity level (%)', 'FontSize',28,'FontWeight','bold','Color','k')
figure (9)
plot (sparsity_ML_normalised_Group3')
title('Normalised Clustering Coefficient Hypnosis','FontSize',18)
xlabel('Sparsity level (%)', 'FontSize',28,'FontWeight','bold','Color','k')

% Clustering Coeficent

for i = 1:45
    [h_CC1(i),p_CC1(i)] = ttest2(sparsity_CC_normalised_Group3(:,i),sparsity_CC_normalised_Group2(:,i),0.06,'left');
end

h_CC1
p_CC1

% Path Lengtht
for i = 1:45
    [h_PL1(i),p_PL1(i)] = ttest2(sparsity_PL_normalised_Group2(:,i),sparsity_PL_normalised_Group1(:,i),0.09,'left');
end

h_PL1
p_PL1

% Small Worldness
for i = 1:45
    [h_SW1(i),p_SE1(i)] = ttest2(SmallWorldNess_Group3(:,i),SmallWorldNess_Group2(:,i),0.09,'right');
end

h_SW1
p_SE1




%Brain resion

for i = 1:160
    [h_CC_Normalised(i),p_CC_Normalised(i)] = ttest2(sparsity_CC_normalised_Group2_ROI(:,i),sparsity_CC_normalised_Group1_ROI(:,i),0.001, 'left');
end

h_CC_Normalised
p_CC_Normalised
%[p,h]=fdr(p_CC_Normalised,0.099);
%p

%%%  Graphical Plot od GT measures %%%
tpz_cc_Group1 = trapz(sparsity_CC_normalised_Group1(:,1:25),2)/25;
tpz_cc_Group2 = trapz(sparsity_CC_normalised_Group2(:,1:25),2)/25;
tpz_cc_Group3 = trapz(sparsity_CC_normalised_Group3(:,1:25),2)/25;

tpz_pl_Group1 = trapz(sparsity_PL_normalised_Group1(:,1:25),2)/25;
tpz_pl_Group2 = trapz(sparsity_PL_normalised_Group2(:,1:25),2)/25;
tpz_pl_Group3 = trapz(sparsity_PL_normalised_Group3(:,1:25),2)/25;

tpz_sw_Group1 = trapz(SmallWorldNess_Group1(:,1:25),2)/25;
tpz_sw_Group2 = trapz(SmallWorldNess_Group2(:,1:25),2)/25;
tpz_sw_Group3 = trapz(SmallWorldNess_Group3(:,1:25),2)/25;

tpz_le_Group1 = trapz(sparsity_LE_normalised_Group1(:,1:25),2)/25;
tpz_le_Group2 = trapz(sparsity_LE_normalised_Group2(:,1:25),2)/25;
tpz_le_Group3 = trapz(sparsity_LE_normalised_Group3(:,1:25),2)/25;

tpz_ge_Group1 = trapz(sparsity_GE_normalised_Group1(:,1:25),2)/25;
tpz_ge_Group2 = trapz(sparsity_GE_normalised_Group2(:,1:25),2)/25;
tpz_ge_Group3 = trapz(sparsity_GE_normalised_Group3(:,1:25),2)/25;

%tpz_GT = [tpz_cc_Group1 tpz_cc_Group2 tpz_cc_Group3 tpz_pl_Group1 tpz_pl_Group2 tpz_pl_Group3 tpz_sw_Group1 tpz_sw_Group2 tpz_sw_Group3 tpz_le_Group1 tpz_le_Group2 tpz_le_Group3 tpz_ge_Group1 tpz_ge_Group2 tpz_ge_Group3]

tpz_GT_Group1 = [tpz_cc_Group1 tpz_pl_Group1 tpz_sw_Group1 tpz_le_Group1 tpz_ge_Group1]
tpz_GT_Group2 = [tpz_cc_Group2 tpz_pl_Group2 tpz_sw_Group2 tpz_le_Group2 tpz_ge_Group2]
tpz_GT_Group3 = [tpz_cc_Group3 tpz_pl_Group3 tpz_sw_Group3 tpz_le_Group3 tpz_ge_Group3]

[p,h]=ttest2(tpz_GT(:,1),tpz_GT(:,2), 0.05,'left')

