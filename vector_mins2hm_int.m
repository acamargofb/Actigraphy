function vector_hhmm = vector_mins2hm_int(vector_time_in_mins)
    
%vector_hhmm= [];

N = length(vector_time_in_mins);
%vector_hhmm = zeros(N,2);
vector_hhmm= [];

for i=1:N
  %vector_hhmm=  [ mins2hm_int(vector_time_in_mins(i))];
  vector_hhmm = [ vector_hhmm; mins2hm_int(vector_time_in_mins(i))];
end  

end