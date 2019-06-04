function vector_time_string=vector_mins2hm(vector_time_in_mins)
    

N = length(vector_time_in_mins);

for i=1:N
  vector_time_string{i}=  [ mins2hm(vector_time_in_mins(i))];
end

end