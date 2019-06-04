function time_hhmm_int = mins2hm_int(time_in_mins)
    time_hhmm_int=[];
    nhours = 0;
    nmins = 0;
    
    nhours = floor(time_in_mins/60);
    nmins  = mod(time_in_mins,60);
    
%     time_hhmm_int{1} = nhours;
%     time_hhmm_int{2} = nmins;


time_hhmm_int(1) = nhours;
time_hhmm_int(2) = nmins;

end