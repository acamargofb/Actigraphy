function maxACC_n = maxACC_number(ACTI_DATA, number, inddex)

% if( number == 0 )
%     maxACC_n = ACTI_DATA(inddex)
% else
    tindx = inddex - number; 
    temp = ACTI_DATA(tindx:inddex);
    maxACC_n = mean(temp);
% end




end