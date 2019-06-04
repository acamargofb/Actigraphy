function [mu_act, std_act,LogAct, nat_act, PS_SI] = activ_sadeh(ACTI_DATA)
%%
% This function implements the Sadeh algorithm based on the paper:
% Algorithms for sleep–wake identification using actigraphy:
% a comparative study and new results
% J O Ë L L E T I L M A N N E 1 , J É R Ô M E U R B A I N 1 , M A Y U R E S H V . K O T H A R E 2 ,
% A L A I N V A N D E W O U W E R 3 and S A N J E E V V . K O T H A R E 4
% 1
% Service de Théorie des Circuits et Traitement du Signal, Faculté Polytechnique de Mons, Mons, Belgium, 2 Department of Chemical Engineering,
% Lehigh University, Bethlehem, PA, USA, 3 Service dÕAutomatique, Faculté Polytechnique de Mons, Mons, Belgium and 4 Sleep Center for Children,
% ChildrenÕs Hospital, and Department of Neurology, Harvard Medical School, Boston, MA, USA
%   Author: Aldo Camargo (University of Liege - Belgium )
%   (aldo.camargo@ulg.ac.be)
%  
%%

N = length(ACTI_DATA);
% window_act_u =  11;

% mu_act = [];
% std_act = [];
% LogAct = [];
% nat_act = [];
% PS_SI = [];



mu_act = zeros(1,N);
std_act = zeros(1,N);
LogAct = zeros(1, N);
nat_act = zeros(1, N);
SI  = zeros(1, N);
PS_SI =  zeros(1, N);


% Compute of mu_act
% Compute of std_act
for i=1:N
    if (i >= 6 ) && ( i <= N-5) % window of size 11
       temp_vector_u = [i-5:1:i+5];  % there are 10 elements
       mu_act(i) = mean(temp_vector_u); % compute the mean
%        mu_act = [ mu_act; u_temp];
      count_nat = 0;
      for j= i-5:1:i+5
          if(ACTI_DATA(j) >= 50 &&  ACTI_DATA(j) < 100)
            count_nat = count_nat + 1;
          end
      end
       nat_act(i) = count_nat;
    end
    % Compute of sigma
    if (i > 6 )  % window of size 11
       temp_vector_std = [i-6:1:i];  % there are 6 elements
       std_act(i) = std(temp_vector_std); % compute the std
%        std_act = [ mu_act; u_temp];
    end
       
    
    LogAct(i) = log(ACTI_DATA(i)) + 1;
    
    
    SI(i) = 7.601 - 0.065*mu_act(i) - 0.056*std_act(i) - 0.0703*LogAct(i) - 1.08*nat_act(i);
    
    PS_SI(i) =  (1 / (1 + exp(-SI(i))));
    
    
    
    
    
end

