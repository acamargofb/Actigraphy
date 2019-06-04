function time_string=mins2hm(time_in_mins)
    time_string='';
    nhours = 0;
    nmins = 0;
    
    nhours = floor(time_in_mins/60);
    nmins  = mod(time_in_mins,60);
    
    time_string = [ num2str(nhours) sprintf(':%2d', nmins)];
%     
%     
%     if time_in_secs >= 3600
%         nhours = floor(time_in_secs/3600);
%         if nhours > 1
%             hour_string = ' hours, ';
%         else
%             hour_string = ' hour, ';
%         end
%         time_string = [num2str(nhours) hour_string];
%     end
%     if time_in_secs >= 60
%         nmins = floor((time_in_secs - 3600*nhours)/60);
%         if nmins > 1
%             minute_string = ' mins, ';
%         else
%             minute_string = ' min, ';
%         end
%         time_string = [time_string num2str(nmins) minute_string];
%     end
%     nsecs = time_in_secs - 3600*nhours - 60*nmins;
%     time_string = [time_string sprintf('%2.1f', nsecs) ' secs'];
end