function [Cohens_d, effect_size_r] = effect_size(mean_1, mean_2, std_1, std_2)
% Computes el effect size and the Cohen's d
% reference: https://www.uccs.edu/~lbecker/
 Spooled = sqrt((std_1^2 + std_2^2)/2);
 Cohens_d = (mean_1 - mean_2)/Spooled;
 effect_size_r = Cohens_d/(sqrt(Cohens_d^2 + 4));
end