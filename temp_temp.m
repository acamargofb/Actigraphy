 %% EMCS at subject level
     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%    EMCS: AWD  Data                               %%%
    %%%                                                  %%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fid=fopen('EMCS_awd_120min.csv','w');
    fid2 = fopen('EMCS_AWD_mean_std_cv_120min.csv','w');
    
    [m_EMCS_awd, n_EMCS_awd] = size(EMCS_awd_aux);  % MSA
    [m_EMCS_SE_awd, n_EMCS_SE_awd] = size(EMCS_awd_SE_aux);  % SE
    
    number_of_pks_EMCS_awd = [];
    
    for i=1:m_EMCS_awd
        [pks_emcs_awd, indx_pks_emcs_awd] = findpeaks((EMCS_awd_aux(i,:)));
        number_of_pks_EMCS_awd = [number_of_pks_EMCS_awd; length(indx_pks_emcs_awd)];
      
         pks_MSA_EMCS_AWD{i} = t_emcs_mtn(indx_pks_emcs_awd);  % pks in minutes
         value_pks_MSA_EMCS_AWD{i} = pks_emcs_awd;  % value of the corresponding pks in MSA
         emcs_awd_selected_pks_values{i}.pks = t_emcs_mtn(indx_pks_emcs_awd);
         emcs_awd_selected_pks_values{i}.values = pks_emcs_awd;
         % This is the corresponding SE for the respective peaks found
         % previously:
         emcs_awd_selected_pks_values{i}.SE = EMCS_awd_SE_aux(i,floor(t_emcs_mtn(indx_pks_emcs_awd)));  % I use floor, you can try with ceil :)
       
         emcs_awd_selected_pks_values{i}.std_SE = std(EMCS_awd_SE_aux(i,:));
         emcs_awd_selected_pks_values{i}.mean_SE = mean(EMCS_awd_SE_aux(i,:));
         
          % cv = std/mean
          % (https://en.wikipedia.org/wiki/Coefficient_of_variation)
          
         emcs_awd_selected_pks_values{i}.cv_SE =  (emcs_awd_selected_pks_values{i}.std_SE)/(emcs_awd_selected_pks_values{i}.mean_SE); 
         
         fprintf(fid, '%s,',emcs_awd_selected_pks_values{i}.SE);
         fprintf(fid, '\n ');
         
         fprintf(fid2, '%s, %s,', emcs_awd_selected_pks_values{i}.mean_SE, emcs_awd_selected_pks_values{i}.std_SE );
         fprintf(fid2, '%s, ', emcs_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid2, '\n ');
         
    end
    
    fclose(fid);
    fclose(fid2);
    
    
    indx_m_EMCS_awd = zeros(m_EMCS_awd,3);
    MSA_at_indx_m_EMCS_awd = zeros(m_EMCS_awd,3);
    SE_at_indx_m_EMCS_awd = zeros(m_EMCS_SE_awd,3);
    
    for i=1:m_EMCS_awd
        temp = pks_MSA_EMCS_AWD{i};
        idx_temp = (pks_MSA_EMCS_AWD{i} > 20 & pks_MSA_EMCS_AWD{i} < 240);
        
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_EMCS_awd(i,1) = temp(temp_idx);
            MSA_at_indx_m_EMCS_awd(i,1) = emcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_EMCS_awd(i,1) = emcs_awd_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        
        idx_temp = (pks_MSA_EMCS_AWD{i} >= 240 & pks_MSA_EMCS_AWD{i} < 720);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_EMCS_awd(i,2) = temp(temp_idx);
            MSA_at_indx_m_EMCS_awd(i,2) = emcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_EMCS_awd(i,2) = emcs_awd_selected_pks_values{i}.SE(temp_idx);  % SE
        end
        
        idx_temp = (pks_MSA_EMCS_AWD{i} >= 720 & pks_MSA_EMCS_AWD{i} < 1400);
        if(sum(idx_temp) ~= 0) 
            max_temp = max(emcs_awd_selected_pks_values{i}.values(idx_temp));
            temp_idx = find(emcs_awd_selected_pks_values{i}.values == max_temp);
            indx_m_EMCS_awd(i,3) = temp(temp_idx);
            MSA_at_indx_m_EMCS_awd(i,3) = emcs_awd_selected_pks_values{i}.values(temp_idx);
            SE_at_indx_m_EMCS_awd(i,3) = emcs_awd_selected_pks_values{i}.SE(temp_idx); % SE
        end
    end
    
    
    fid3=fopen('EMCS_awd_120min_resume.csv','w');
    
    for i=1:m_EMCS_awd
      
         fprintf(fid3, '%s,',emcs_awd_selected_pks_values{i}.pks);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s,',emcs_awd_selected_pks_values{i}.values);
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, ', emcs_awd_selected_pks_values{i}.SE );
         fprintf(fid3, '_new_col_,');
         fprintf(fid3, '%s, %s,', emcs_awd_selected_pks_values{i}.mean_SE, emcs_awd_selected_pks_values{i}.std_SE );
         fprintf(fid3, '%s, ', emcs_awd_selected_pks_values{i}.cv_SE );
         fprintf(fid3, '\n');
         
    end
    
    fclose(fid3);
