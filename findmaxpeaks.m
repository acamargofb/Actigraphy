function n = findmaxpeaks(x)
% Find peaks.
% n = findmaxpeaks(x)
% h = .001;
% yy = diff(x);
% 
% mm = yy/h;
% 
% 
% for i = 1:length(x) - 2 
%     if(mm(i) > 
% 
% end

n    = find(diff(x)/h > 0 );
u    = find(x(n+1) > x(n));
n(u) = n(u)+1;

n = find(mm <= 2e-4)
n = n + 1
